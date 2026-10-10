<#
.SYNOPSIS
    update_flash.ps1 - Automates pulling ESPHome YAML from GitHub and flashing the device.
.DESCRIPTION
    Forces Git to pull the latest configurations, activates the stable Python 3.12 
    virtual environment, and runs the ESPHome compilation/flash binary sequence.
#>

\$ErrorActionPreference = "Stop"

# --- CONFIGURATION (Adjust paths as needed) ---
ProjectDir = "Home\Documents\E_INK_PROJECTS\RolandSticky1"
VenvActivate = "Home\esphome_env\venv\Scripts\Activate.ps1"
\$YamlFile    = "rolandsticky1.yaml" # Replace with your exact device YAML filename

Write-Host "=============================================" -ForegroundColor Cyan
Write-Host " Starting ESPHome Update & Flash Automation" -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan

# 1. Navigate to your project directory
if (Test-Path \$ProjectDir) {
    Set-Location \$ProjectDir
    Write-Host "[✓] Moved to project directory: \$ProjectDir" -ForegroundColor Green
} else {
    Write-Error "Project directory not found at: \$ProjectDir"
}

# 2. Pull latest changes from GitHub
Write-Host "`n[i] Fetching latest changes from GitHub..." -ForegroundColor Yellow
try {
    # Fetch and pull cleanly
    git fetch --all
    $gitStatus = git pull --ff-only
    Write-Host "[✓] Git Pull Success: $gitStatus" -ForegroundColor Green
}
catch {
    Write-Warning "Git pull encountered issues. Attempting to proceed anyway..."
}

# 3. Activate the Python Virtual Environment
Write-Host "`n[i] Activating Python Virtual Environment..." -ForegroundColor Yellow
if (Test-Path \$VenvActivate) {
    # Dot-source the activation script to keep variables in scope
    . \$VenvActivate
    Write-Host "[✓] Virtual Environment Activated." -ForegroundColor Green
} else {
    Write-Error "Virtual environment activation script not found at: \$VenvActivate. Please ensure your Python 3.12 environment is installed there."
}

# 4. Verify ESPHome command availability
try {
    \$esphomePath = (Get-Command esphome).Source
    Write-Host "[✓] Found ESPHome binary: \$esphomePath" -ForegroundColor Green
}
catch {
    Write-Error "ESPHome command line tool not found. Check if it is fully installed inside your venv."
}

# 5. Run ESPHome Compile and Upload
Write-Host "`n[i] Compiling and flashing $YamlFile..." -ForegroundColor Yellow
Write-Host "---------------------------------------------------" -ForegroundColor Gray

# Executes the compilation and starts looking for local/network targets to flash
esphome run $YamlFile

Write-Host "`n=============================================" -ForegroundColor Green
Write-Host " Process Complete!" -ForegroundColor Green
Write-Host "=============================================" -ForegroundColor Green
