# linux-toolkit

A small Linux administration toolkit written in Bash.

This project was created for practicing Linux administration, Bash scripting, Git version control, documentation, and project structure.

## Project structure

```text
linux-toolkit/
├── scripts/
├── logs/
├── docs/
├── backup/
└── README.md
```

## Scripts

| Script | Purpose |
|---|---|
| `scripts/systeminfo.sh` | Shows system information |
| `scripts/diskcheck.sh` | Shows disk usage and warnings from 80 percent |
| `scripts/userreport.sh` | Reads `/etc/passwd` and creates a user report |
| `scripts/backup.sh` | Creates a `.tar.gz` backup |
| `scripts/restore.sh` | Restores a selected backup |
| `scripts/networkinfo.sh` | Shows network information |
| `scripts/toolkit.sh` | Main menu for all scripts |

## Installation

Clone the repository:

```bash
git clone https://github.com/KevinHidey/linux-toolkit.git
cd linux-toolkit
```

Make scripts executable:

```bash
chmod +x scripts/*.sh
```

## Usage

Start the main menu:

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

## Logging

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

## Used Linux commands

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

## Git usage

The project is managed with Git.

Requirements for this project:

- meaningful commit messages
- at least 10 commits
- no single final collection commit
- full Git history

## Privacy note

This repository should not contain personal files, real backups, passwords, secrets, or private logs.

Generated backup files are ignored by Git.
