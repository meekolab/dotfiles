# 🛠️ Dotfiles for Windows 11 / macOS / Linux

This repository contains cross-platform dotfiles and setup scripts for quickly configuring development environments on **Windows 11**, **macOS** and **Linux**.

---

## ⚡ Quick Setup for Windows 11

To run the setup script directly from git:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
irm https://raw.githubusercontent.com/meekolab/dotfiles/main/install/windows/setup.ps1 | iex
```
> 💡 The first command temporarily allows PowerShell scripts to run during this session only.
> 💡 Make sure to run from **PowerShell as Administrator**

### ✅ What It Does:
- Installs `winget` (if available)
- Installs essential tools like `git`, `chezmoi`
- Prepares environment for further provisioning

---

## 👤 Create Local User `{userName}` (Optional)

If you want to install Windows 11 without Microsoft Account (local user):
- See: [Install Windows Without Microsoft Account](./docs/install-windows-without-ms-account.md)

---

## 🧩 Structure

```
.
├── install/
│   └── windows/
│       └── setup.ps1       # Windows installation script
├── dotfiles/               # Config files managed by chezmoi
├── docs/
│   └── install-windows-without-ms-account.md
└── README.md
```

---

## 🔧 Tools Used

- [chezmoi](https://www.chezmoi.io/) — Dotfiles manager
- [winget](https://learn.microsoft.com/en-us/windows/package-manager/) — Windows package manager
- `git`, `PowerShell`, and more...

---

## 📦 Coming Soon

- Setup scripts for macOS and Linux
- Pre-built Hyper-V VM with dotfiles preinstalled

---

## 📝 License

[MIT](LICENSE)

---

Maintained by [@meekolab](https://github.com/meekolab)
