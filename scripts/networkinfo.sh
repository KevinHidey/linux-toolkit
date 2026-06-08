#!/bin/bash
set -euo pipefail

# networkinfo.sh
# Shows basic network information.

LOG_FILE="../logs/toolkit.log"

echo "===== Network Information ====="

echo
echo "IP addresses:"
ip -4 addr 2>/dev/null || hostname -I 2>/dev/null || echo "IP command not available"

echo
echo "Gateway:"
ip route | grep default 2>/dev/null || echo "Gateway information not available"

echo
echo "DNS servers:"
if [ -f /etc/resolv.conf ]; then
  grep "nameserver" /etc/resolv.conf || echo "No DNS servers found"
else
  echo "/etc/resolv.conf not found"
fi

echo
echo "Active network interfaces:"
ip link show up 2>/dev/null || echo "Network interface command not available"

echo "$(date '+%Y-%m-%d %H:%M') Network information checked" >> "$LOG_FILE"
