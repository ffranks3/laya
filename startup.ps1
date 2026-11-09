# Container start for laya-serve. The image entrypoint loads HF_TOKEN_FILE and
# LAYA_API_KEY_FILE before this script runs. A value already set by the task
# definition is left alone.
$ErrorActionPreference = "Stop"

if (-not $env:LAYA_HOST) { $env:LAYA_HOST = "0.0.0.0" }
if (-not $env:LAYA_PORT) { $env:LAYA_PORT = "8000" }
if (-not $env:LAYA_DEVICE) { $env:LAYA_DEVICE = "cpu" }
# One checkpoint unless the task names a comma-separated list. An empty value
# would preload every checkpoint.
if (-not $env:LAYA_MODELS) { $env:LAYA_MODELS = "english" }

& laya-serve
exit $LASTEXITCODE
