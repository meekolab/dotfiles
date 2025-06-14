# Stop script on any error
$ErrorActionPreference = "Stop"

# Ensure script runs as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "❗ This script must be run as Administrator."
    Read-Host "🔒 Press Enter to exit..."
    exit 1
}


# Check for winget
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "🔧 Winget not found. Opening App Installer in Microsoft Store..."
    Start-Process "ms-windows-store://pdp/?productid=9NBLGGH4NNS1"
    Write-Host "❗ Please install 'App Installer' manually, then re-run this script."
    exit
}

# Install Git and chezmoi silently
$packages = @(
    "Git.Git",
    "twpayne.chezmoi"
)

foreach ($pkg in $packages) {
    Write-Host "`n📦 Installing $pkg..."
    winget install --id $pkg --silent --accept-package-agreements --accept-source-agreements
}

# Reload system PATH to include newly added CLI tools
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine")

# Run chezmoi init/apply
Write-Host "`n🔁 Running chezmoi init/apply..."
chezmoi init git@github.com:meekolab/dotfiles.git
chezmoi apply
