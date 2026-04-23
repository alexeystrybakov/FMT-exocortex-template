#!/bin/bash
# Synchronizer: установка центрального диспетчера (cron, Linux version)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing Synchronizer (central scheduler)..."

chmod +x "$SCRIPT_DIR/scripts/"*.sh
chmod +x "$SCRIPT_DIR/scripts/templates/"*.sh 2>/dev/null || true

mkdir -p "$HOME/.local/state/exocortex"
mkdir -p "$HOME/logs/synchronizer"

# Удаляем старые задачи synchronizer и legacy strategist
crontab -l 2>/dev/null | grep -v synchronizer | grep -v strategist | grep -v '^$' > /tmp/crontab_tmp || true

# 10 точек запуска в день (каждые ~2.5 часа)
echo "0 2 * * * $SCRIPT_DIR/scripts/scheduler.sh morning >> $HOME/logs/synchronizer/scheduler.log 2>&1" >> /tmp/crontab_tmp
echo "0 2 * * 0 $SCRIPT_DIR/scripts/scheduler.sh weekreview >> $HOME/logs/synchronizer/scheduler.log 2>&1" >> /tmp/crontab_tmp
echo "0 */3 * * * $SCRIPT_DIR/scripts/scheduler.sh dispatch >> $HOME/logs/synchronizer/scheduler.log 2>&1" >> /tmp/crontab_tmp

crontab /tmp/crontab_tmp
rm /tmp/crontab_tmp

echo "  ✓ Installed: exocortex scheduler"
echo "  ✓ Schedule: 10 dispatch points per day"
echo "  ✓ State: ~/.local/state/exocortex/"
echo "  ✓ Logs: ~/logs/synchronizer/"
echo ""
echo "Verify: crontab -l | grep synchronizer"
echo "Status: bash $SCRIPT_DIR/scripts/scheduler.sh status"
