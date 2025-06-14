# 🪟 Installing Windows 11 Without Microsoft Account

> Guide for setting up **local user accounts** during Windows 11 installation, skipping Microsoft login prompts.

---

## ✅ Recommended Method by Windows Build

| Windows Build       | Method                        | Command                        |
|--------------------|-------------------------------|---------------------------------|
| < 26120 (older)    | Bypass network requirement    | `OOBE\BYPASSNRO`               |
| ≥ 26120 (newer)    | Direct local account creation | `start ms-chx:localonly`       |

---

## 🔹 Method 1: `OOBE\BYPASSNRO` (Most Builds)

### 💡 Steps:
```bash
1. Press Shift + F10 on region selection screen
2. Type: OOBE\BYPASSNRO
3. Setup will reboot
4. Click "I don't have internet" → Continue with offline account
5. Create user
```

⚠️ **Note:** In some cases, this method can cause Windows to fully disable networking (especially on Hyper-V or if `ipconfig /release` was used). If this happens:
- Go to `Device Manager` → Re-enable network adapters
- Or reboot the system
- ✅ A simple fix: right-click the disabled adapter → **Enable**

---

## 🔹 Method 2: `start ms-chx:localonly` (Build ≥ 26120)

### 💡 Steps:
```bash
1. Press Shift + F10 during Microsoft login prompt
2. Type: start ms-chx:localonly
3. Setup will show local account screen directly
```