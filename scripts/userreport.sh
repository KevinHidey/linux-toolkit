#!/bin/bash
set -euo pipefail

# userreport.sh
# Reads /etc/passwd and shows username, UID, home directory, and login shell.

LOG_FILE="../logs/toolkit.log"

echo "===== User Report ====="

if [ ! -f /etc/passwd ]; then
  echo "/etc/passwd not found. This script works best on Linux."
  exit 1
fi

printf "%-20s %-10s %-30s %-20s\n" "Username" "UID" "Home" "Shell"
echo "----------------------------------------------------------------------------"

awk -F: '{ printf "%-20s %-10s %-30s %-20s\n", $1, $3, $6, $7 }' /etc/passwd

echo
echo "Total user accounts:"
wc -l < /etc/passwd

echo "$(date '+%Y-%m-%d %H:%M') User report created" >> "$LOG_FILE"
