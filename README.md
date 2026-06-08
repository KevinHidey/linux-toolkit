# 🐧 linux-toolkit

A small Linux administration toolkit written in Bash.

This project was created to practice Linux administration, Bash scripting, Git version control, documentation, and project structure.

## 🎯 Project goal

The goal of this project is to build a simple Linux administration tool with multiple Bash scripts.

The toolkit can:

- 🖥️ show system information
- 💾 check disk usage
- 👤 create a user report
- 📦 create backups
- ♻️ restore backups
- 🌐 show network information
- 🧭 start everything from one main menu

## 📁 Project structure

```text
linux-toolkit/
├── scripts/
├── logs/
├── docs/
├── backup/
└── README.md
```

## 🛠️ Scripts

| Script | Purpose |
|---|---|
| `scripts/systeminfo.sh` | 🖥️ Shows system information |
| `scripts/diskcheck.sh` | 💾 Shows disk usage and warnings from 80% |
| `scripts/userreport.sh` | 👤 Reads `/etc/passwd` and creates a user report |
| `scripts/backup.sh` | 📦 Creates a `.tar.gz` backup |
| `scripts/restore.sh` | ♻️ Restores a selected backup |
| `scripts/networkinfo.sh` | 🌐 Shows network information |
| `scripts/toolkit.sh` | 🧭 Main menu for all scripts |

## ⚙️ Installation

Clone the repository:

```bash
git clone https://github.com/KevinHidey/linux-toolkit.git
cd linux-toolkit
```

Make all scripts executable:

```bash
chmod +x scripts/*.sh
```

## ▶️ Usage

Start the main toolkit menu:

```bash
./scripts/toolkit.sh
```

Or run scripts directly:

```bash
./scripts/systeminfo.sh
./scripts/diskcheck.sh
./scripts/userreport.sh
./scripts/backup.sh
./scripts/restore.sh
./scripts/networkinfo.sh
```

## 🧭 Main menu

When starting `toolkit.sh`, this menu appears:

```text
1 - System information
2 - Disk check
3 - User report
4 - Create backup
5 - Restore backup
6 - Network information
0 - Exit
```

## 📝 Logging

All scripts write events into:

```text
logs/toolkit.log
```

Example log entries:

```text
2026-06-08 10:30 Backup created
2026-06-08 10:45 System information checked
2026-06-08 11:10 User report created
```

## 📚 Used Linux commands

This project uses commands such as:

- `hostname`
- `uname`
- `uptime`
- `ip`
- `df`
- `free`
- `awk`
- `tar`
- `chmod`
- `git`

More details are documented in:

```text
docs/commands.md
```

## 🔧 Git usage

The project is managed with Git.

The project should include:

- ✅ meaningful commit messages
- ✅ at least 10 commits
- ✅ no single final collection commit
- ✅ full Git history

Example commit messages:

```text
Add system information script
Implement disk usage check
Add backup restore script
Update README documentation
```

## 🔐 Privacy note

This repository should not contain:

- ❌ personal files
- ❌ passwords
- ❌ private logs
- ❌ real backup archives
- ❌ secrets or tokens

Generated backup files are ignored by Git.

## 🚀 Learning goals

This project helps practice:

- 🐚 Bash scripting
- 🐧 Linux administration
- 📂 project structure
- 📝 documentation
- 🔧 Git version control
- ☁️ GitHub uploads
- 🧠 basic DevOps thinking

## ✅ Status

This toolkit is a learning project for Linux administration and Git practice.
