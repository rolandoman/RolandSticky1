<#
.SYNOPSIS
    Pulls the latest ESPHome configuration from GitHub and builds/flashes the ESP device.
.PARAMETER ConfigFile
    The name of your ESPHome YAML configuration file (default: config.yaml).
.PARAMETER Branch
    The git branch to pull from (default: main).
#>

param(
    [string]$ConfigFile = "config.yaml",
    [string]$Branch = "main"
)

# Stop execution immediately if any native command fails
$ErrorActionPreference = "Stop"

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host " Starting ESPHome Update & Flash Pipeline" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

# Step 1: Pull from GitHub
Write-Host "`n[1/2] Pulling latest changes from GitHub ($Branch)..." -ForegroundColor Yellow
try {
    git pull origin $Branch
    if ($LASTEXITCODE -ne 0) {
        throw "Git pull encountered issues (exit code $LASTEXITCODE)."
    }
    Write-Host "Successfully updated local files from GitHub." -ForegroundColor Green
}
catch {
    Write-Error "Git update failed: $_"
    Write-Host "Tip: Resolve any local merge conflicts before running this script again." -ForegroundColor Red
    exit 1
}

# Step 2: Run ESPHome Build & Upload
Write-Host "`n[2/2] Running ESPHome build and upload for '$ConfigFile'..." -ForegroundColor Yellow
try {
    # 'esphome run' compiles the code and uploads it. 
    # If you need a specific port or OTA target, you can append flags like: --device COM3
    esphome run $ConfigFile
    
    if ($LASTEXITCODE -ne 0) {
        throw "ESPHome build/upload failed (exit code $LASTEXITCODE)."
    }
    Write-Host "`nDevice updated successfully!" -ForegroundColor Green
}
catch {
    Write-Error "ESPHome execution failed: $_"
    exit 1
}
