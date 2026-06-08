#!/bin/bash
set -euo pipefail

# toolkit.sh
# Main menu for the Linux administration toolkit.
# This script starts the other scripts from one menu.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

while true; do
  echo
  echo "================================"
  echo "      Linux Administration Tool"
  echo "================================"
  echo "1 - System information"
  echo "2 - Disk check"
  echo "3 - User report"
  echo "4 - Create backup"
  echo "5 - Restore backup"
  echo "6 - Network information"
  echo "0 - Exit"
  echo "================================"

  read -p "Choose an option: " choice

  case "$choice" in
    1)
      "$SCRIPT_DIR/systeminfo.sh"
      ;;
    2)
      "$SCRIPT_DIR/diskcheck.sh"
      ;;
    3)
      "$SCRIPT_DIR/userreport.sh"
      ;;
    4)
      "$SCRIPT_DIR/backup.sh"
      ;;
    5)
      "$SCRIPT_DIR/restore.sh"
      ;;
    6)
      "$SCRIPT_DIR/networkinfo.sh"
      ;;
    0)
      echo "Goodbye."
      exit 0
      ;;
    *)
      echo "Invalid option. Choose 0 to 6."
      ;;
  esac
done
