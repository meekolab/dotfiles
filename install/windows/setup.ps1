# Stop on error
$ErrorActionPreference = "Stop"

# Check for Winget
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "🔧 Winget not found. Installing App Installer from Microsoft Store..."
    Start-Process "ms-windows-store://pdp/?productid=9NBLGGH4NNS1"
    Write-Host "❗ Please install 'App Installer' manually, then re-run this script."
    exit
}

# Install git and chezmoi
$packages = @(
    "Git.Git",
    "TorusShells.chezmoi"
)

foreach ($pkg in $packages) {
    winget install --id $pkg --silent --accept-package-agreements --accept-source-agreements
}

# Initialize chezmoi
chezmoi init git@github.com:meekolab/dotfiles.git
chezmoi apply
