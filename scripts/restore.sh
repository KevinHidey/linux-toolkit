#!/bin/bash
set -euo pipefail

# restore.sh
# Restores an existing .tar.gz backup into a selected destination folder.

LOG_FILE="../logs/toolkit.log"
BACKUP_DIR="../backup"

echo "===== Restore Tool ====="

if [ ! -d "$BACKUP_DIR" ]; then
  echo "Backup folder does not exist."
  exit 1
fi

echo "Available backups:"
ls -1 "$BACKUP_DIR"/*.tar.gz 2>/dev/null || {
  echo "No backups found."
  exit 1
}

echo
read -p "Enter backup file path: " BACKUP_FILE

if [ ! -f "$BACKUP_FILE" ]; then
  echo "Error: backup file does not exist."
  exit 1
fi

read -p "Enter destination folder: " DESTINATION
mkdir -p "$DESTINATION"

tar -xzf "$BACKUP_FILE" -C "$DESTINATION"

echo "Backup restored to:"
echo "$DESTINATION"

echo "$(date '+%Y-%m-%d %H:%M') Backup restored: $BACKUP_FILE" >> "$LOG_FILE"
