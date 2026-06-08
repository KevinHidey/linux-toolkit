#!/bin/bash
set -euo pipefail

# backup.sh
# Creates a backup of a selected folder using rsync.
#
# rsync is useful because it only copies files that are new or changed.
# This makes repeated backups faster than copying everything again.
#
# This script:
# - asks for a source folder
# - creates a timestamped backup folder
# - copies the files with rsync
# - writes an event into logs/toolkit.log

LOG_FILE="../logs/toolkit.log"
BACKUP_DIR="../backup"

mkdir -p "$BACKUP_DIR"
mkdir -p "../logs"

echo "===== Rsync Backup Tool ====="

# Ask the user which folder should be backed up.
read -p "Enter folder to backup: " SOURCE

# Check if the source folder exists.
if [ ! -d "$SOURCE" ]; then
  echo "Error: folder does not exist."
  exit 1
fi

# Check if rsync is installed.
if ! command -v rsync >/dev/null 2>&1; then
  echo "Error: rsync is not installed."
  echo "Install it with:"
  echo "sudo apt install rsync -y"
  exit 1
fi

# Create date and time for the backup folder name.
TIMESTAMP="$(date '+%Y-%m-%d_%H%M')"

# Get only the folder name, not the full path.
SOURCE_NAME="$(basename "$SOURCE")"

# Create the final backup folder.
BACKUP_TARGET="$BACKUP_DIR/${SOURCE_NAME}_backup_$TIMESTAMP"

mkdir -p "$BACKUP_TARGET"

echo "Creating backup..."
echo "Source: $SOURCE"
echo "Target: $BACKUP_TARGET"

# rsync options:
# -a = archive mode, keeps permissions, timestamps, and folder structure
# -v = verbose, shows copied files
# --progress = shows progress while copying
#
# The slash after "$SOURCE/" means:
# copy the CONTENTS of the source folder into the backup target.
rsync -av --progress "$SOURCE/" "$BACKUP_TARGET/"

echo
echo "Backup created:"
echo "$BACKUP_TARGET"

echo "$(date '+%Y-%m-%d %H:%M') Rsync backup created: $BACKUP_TARGET" >> "$LOG_FILE"
