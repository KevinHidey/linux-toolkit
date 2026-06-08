#!/bin/bash
set -euo pipefail

# diskcheck.sh
# Shows mounted filesystems and warns if disk usage is 80 percent or higher.

LOG_FILE="../logs/toolkit.log"

echo "===== Disk Check ====="
df -h

echo
echo "===== Warnings ====="

df -h | awk 'NR > 1 {
  usage=$5
  gsub("%","",usage)
  if (usage >= 80) {
    print "WARNING: " $6 " is " usage "% full."
  }
}'

echo "$(date '+%Y-%m-%d %H:%M') Disk check executed" >> "$LOG_FILE"
