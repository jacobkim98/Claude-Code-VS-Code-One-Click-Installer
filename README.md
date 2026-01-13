# Claude Code & VS Code One-Click Installer

One-click installer for setting up Claude Code with VS Code. Automatically installs all required dependencies and configurations.

## What Gets Installed

- **Node.js** - Required for Claude Code CLI
- **Git** - Version control
- **VS Code** - Code editor
- **Claude Code CLI** - `@anthropic-ai/claude-code`
- **VS Code Claude Extension** - `anthropic.claude-code`

## Quick Start

### Windows

**Option 1: Web Install (Recommended)**

Press `Win + R` and paste:
```
powershell -ep bypass -c "irm https://raw.githubusercontent.com/jacobkim98/Claude-Code-VS-Code-One-Click-Installer/main/windows/web-install.ps1|iex"
```

**Option 2: Download and Run**

1. Download [ClaudeCodeSetup.exe](windows/inno-installer/output/ClaudeCodeSetup.exe)
2. Double-click to run

**Option 3: PowerShell Script**
```powershell
powershell -ExecutionPolicy Bypass -File install.ps1
```

### macOS

**Terminal:**
```bash
curl -fsSL https://raw.githubusercontent.com/jacobkim98/Claude-Code-VS-Code-One-Click-Installer/main/mac/install.sh | bash
```

## Directory Structure

```
├── windows/
│   ├── install.ps1              # PowerShell installer (local)
│   ├── web-install.ps1          # PowerShell installer (web)
│   └── inno-installer/
│       ├── ClaudeCodeSetup.iss  # Inno Setup script
│       └── output/
│           └── ClaudeCodeSetup.exe
│
└── mac/
    └── install.sh               # Shell installer
```

## Features

- Automatic admin/root privilege elevation
- Skip already installed components
- Progress bar for downloads
- Post-install setup guide

## After Installation

1. Open VS Code
2. Click the Claude icon in the left sidebar
3. Login to Claude

Or run `claude` command in terminal.

## Requirements

### Windows
- Windows 10/11 (64-bit)
- Internet connection

### macOS
- macOS 10.13 or later
- Internet connection

## License

MIT License

## Links

- [Claude Code Documentation](https://docs.anthropic.com/claude-code)
- [VS Code Claude Extension](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code)
