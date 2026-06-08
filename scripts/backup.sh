#!/bin/bash
set -euo pipefail

# backup.sh
# Creates a compressed .tar.gz backup of a selected folder.
# The backup filename contains date and time.

LOG_FILE="../logs/toolkit.log"
BACKUP_DIR="../backup"

mkdir -p "$BACKUP_DIR"

echo "===== Backup Tool ====="
read -p "Enter folder to backup: " SOURCE

if [ ! -d "$SOURCE" ]; then
  echo "Error: folder does not exist."
  exit 1
fi

TIMESTAMP="$(date '+%Y-%m-%d_%H%M')"
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

tar -czf "$BACKUP_FILE" "$SOURCE"

echo "Backup created:"
echo "$BACKUP_FILE"

echo "$(date '+%Y-%m-%d %H:%M') Backup created: $BACKUP_FILE" >> "$LOG_FILE"

