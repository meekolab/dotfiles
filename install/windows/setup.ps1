# Stop on error
$ErrorActionPreference = "Stop"

# Check for winget
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "🔧 Winget not found. Opening App Installer page in Microsoft Store..."
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

# Initialize chezmoi
Write-Host "`n🔁 Running chezmoi init/apply..."
chezmoi init git@github.com:meekolab/dotfiles.git
chezmoi apply
