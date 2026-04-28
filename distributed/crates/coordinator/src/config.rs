use serde::{Deserialize, Serialize};
use std::env;
use std::path::PathBuf;
use zisk_distributed_common::Environment;
use zisk_distributed_common::LoggingConfig;

pub type Result<T> = std::result::Result<T, anyhow::Error>;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Config {
    pub service: ServiceConfig,
    pub server: ServerConfig,
    pub logging: LoggingConfig,
    pub coordinator: CoordinatorConfig,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ServerConfig {
    pub host: String,
    pub port: u16,
    pub proofs_dir: PathBuf,
    pub no_save_proofs: bool,
    pub shutdown_timeout_seconds: u64,
    /// TCP keep-alive interval in seconds for gRPC connections (0 = disabled).
    /// Keeps long-lived connections alive during extended GPU computations.
    #[serde(default = "ServerConfig::default_tcp_keepalive_seconds")]
    pub tcp_keepalive_seconds: u64,
    /// HTTP/2 ping interval in seconds for gRPC connections (0 = disabled).
    /// Sends periodic pings to detect dead connections faster than TCP timeout.
    #[serde(default = "ServerConfig::default_http2_keepalive_interval_seconds")]
    pub http2_keepalive_interval_seconds: u64,
    /// HTTP/2 ping timeout in seconds. If no pong is received within this time,
    /// the connection is considered dead and closed.
    #[serde(default = "ServerConfig::default_http2_keepalive_timeout_seconds")]
    pub http2_keepalive_timeout_seconds: u64,
}

impl ServerConfig {
    pub const fn default_tcp_keepalive_seconds() -> u64 {
        60
    }
    pub const fn default_http2_keepalive_interval_seconds() -> u64 {
        60
    }
    pub const fn default_http2_keepalive_timeout_seconds() -> u64 {
        20
    }
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ServiceConfig {
    pub name: String,
    pub version: String,
    pub environment: Environment,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CoordinatorConfig {
    pub max_workers_per_job: u32,
    pub max_total_workers: u32,
    pub phase1_timeout_seconds: u64,
    pub phase2_timeout_seconds: u64,
    pub webhook_url: Option<String>,
    pub compressed_proofs: bool,
    /// Seconds after last heartbeat before an idle/error worker is evicted.
    /// Computing workers are never evicted regardless of this setting.
    /// Set to 0 to disable stale-worker eviction.
    #[serde(default = "CoordinatorConfig::default_stale_worker_timeout_seconds")]
    pub stale_worker_timeout_seconds: u64,
}

impl CoordinatorConfig {
    pub const fn default_stale_worker_timeout_seconds() -> u64 {
        // 3× the default heartbeat interval (120 s) gives comfortable headroom
        360
    }
}

impl Config {
    const DEFAULT_BIND_HOST: &'static str = "0.0.0.0";
    const DEFAULT_HOST: &'static str = "127.0.0.1";
    const DEFAULT_PORT: u16 = 50051;
    const DEFAULT_PROOFS_DIR: &'static str = "proofs";

    pub fn load(
        config_file: Option<String>,
        port: Option<u16>,
        proofs_dir: Option<PathBuf>,
        no_save_proofs: bool,
        compressed_proofs: bool,
        webhook_url: Option<String>,
    ) -> Result<Self> {
        // Create proofs directory if it doesn't exist
        if let Some(ref path) = proofs_dir {
            if !path.exists() {
                std::fs::create_dir_all(path)?;
            } else if !path.is_dir() {
                anyhow::bail!("Proofs path exists but is not a directory: {}", path.display());
            }
        }

        let mut builder = config::Config::builder()
            .set_default("service.name", "ZisK Distributed Coordinator")?
            .set_default("service.version", env!("CARGO_PKG_VERSION"))?
            .set_default("service.environment", "development")?
            .set_default("server.host", Self::DEFAULT_BIND_HOST)?
            .set_default("server.port", Self::DEFAULT_PORT)?
            .set_default("server.proofs_dir", Self::DEFAULT_PROOFS_DIR)?
            .set_default("server.no_save_proofs", false)?
            .set_default("server.shutdown_timeout_seconds", 30)?
            .set_default("server.tcp_keepalive_seconds", 60)?
            .set_default("server.http2_keepalive_interval_seconds", 60)?
            .set_default("server.http2_keepalive_timeout_seconds", 20)?
            .set_default("logging.level", "info")?
            .set_default("logging.format", "pretty")?
            .set_default("coordinator.max_workers_per_job", 10)?
            .set_default("coordinator.max_total_workers", 1000)?
            .set_default("coordinator.phase1_timeout_seconds", 300)?
            .set_default("coordinator.phase2_timeout_seconds", 600)?
            .set_default("coordinator.compressed_proofs", compressed_proofs)?
            .set_default("coordinator.stale_worker_timeout_seconds", 360)?;

        if let Some(path) = config_file {
            builder = builder.add_source(config::File::with_name(&path));
        }

        // Force version to always be the compiled version (cannot be overridden by config)
        builder = builder.set_override("service.version", env!("CARGO_PKG_VERSION"))?;

        // Override port if provided via function argument
        if let Some(port) = port {
            builder = builder.set_override("server.port", port)?;
        }

        // Override proofs_dir if provided via function argument
        if let Some(proofs_dir) = proofs_dir {
            builder = builder
                .set_override("server.proofs_dir", proofs_dir.to_string_lossy().to_string())?;
        }

        builder = builder.set_override("server.no_save_proofs", no_save_proofs)?;

        // Override webhook_url if provided via function argument
        if let Some(url) = webhook_url {
            builder = builder.set_override("coordinator.webhook_url", url)?;
        }

        let config = builder.build()?;

        Ok(config.try_deserialize()?)
    }

    pub fn default_url() -> String {
        format!("http://{}:{}", Self::DEFAULT_HOST, Self::DEFAULT_PORT)
    }
}
