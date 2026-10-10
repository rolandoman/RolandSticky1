@'

<#
.SYNOPSIS
    update-and-flash.ps1 - Automates pulling ESPHome YAML from GitHub and flashing the device.
.DESCRIPTION
    Forces Git to pull the latest configurations, activates the stable Python 3.12 
    virtual environment, and runs ESPHome via direct python injection to bypass launcher errors.
#>

\$ErrorActionPreference = "Stop"

# --- CONFIGURATION ---
$ProjectDir   = "C:\Users\rolan\Dropbox\My PC (LAPTOP-T9DG581H)\Documents\E_INK_PROJECTS\RolandSticky1"
$VenvPython   = "C:\Users\rolan\esphome_env\venv\Scripts\python.exe"
$YamlFile     = "rolandosticky1.yaml"

Write-Host "=============================================" -ForegroundColor Cyan
Write-Host " Starting ESPHome Update & Flash Automation" -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan

# 1. Navigate to your project directory
if (Test-Path $ProjectDir) {
    Set-Location $ProjectDir
    Write-Host "[✓] Moved to project directory: $ProjectDir" -ForegroundColor Green
} else {
    Write-Error "Project directory not found at: $ProjectDir"
}

# 2. Pull latest changes from GitHub
Write-Host "`n[i] Fetching latest changes from GitHub..." -ForegroundColor Yellow
try {
    git fetch --all
    $gitStatus = git pull --ff-only
    Write-Host "[✓] Git Pull Success: $gitStatus" -ForegroundColor Green
}
catch {
    Write-Warning "Git pull encountered issues (e.g., local changes or network). Attempting to proceed with compilation anyway..."
}

# 3. Verify Python Virtual Environment Executable Exists
Write-Host "`n[i] Validating Python 3.12 Virtual Environment..." -ForegroundColor Yellow
if (Test-Path $VenvPython) {
    Write-Host "[✓] Found stable Python environment at: $VenvPython" -ForegroundColor Green
} else {
    Write-Error "Virtual environment Python executable not found at: $VenvPython. Please ensure your Python 3.12 environment is built there."
}

# 4. Run ESPHome Compile and Upload using Direct Module Bypass
Write-Host "`n[i] Compiling and flashing $YamlFile..." -ForegroundColor Yellow
Write-Host "---------------------------------------------------" -ForegroundColor Gray

# Executes using the explicit python binary + module flag to ignore the broken AppData esphome.exe path
& $VenvPython -m esphome run $YamlFile

Write-Host "`n=============================================" -ForegroundColor Green
Write-Host " Process Complete!" -ForegroundColor Green
Write-Host "=============================================" -ForegroundColor Green
'@