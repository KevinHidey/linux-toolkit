#!/bin/bash
set -euo pipefail

# systeminfo.sh
# Shows important system information and writes an event to the toolkit log.

LOG_FILE="../logs/toolkit.log"

echo "===== System Information ====="

echo "Hostname: $(hostname)"
echo "Username: ${USER:-${USERNAME:-unknown}}"
echo "Kernel version: $(uname -r)"

if command -v uptime >/dev/null 2>&1; then
  echo "Uptime: $(uptime -p 2>/dev/null || uptime)"
else
  echo "Uptime: command not available"
fi

echo
echo "===== IP Address ====="
hostname -I 2>/dev/null || ip addr show 2>/dev/null || echo "IP command not available"

echo
echo "===== Memory ====="
free -h 2>/dev/null || echo "Memory command not available"

echo
echo "===== Disk Usage ====="
df -h

echo "$(date '+%Y-%m-%d %H:%M') System information checked" >> "$LOG_FILE"
