#!/bin/bash
# Install Strategist Agent via cron (Linux version)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing Strategist Agent cron jobs..."

chmod +x "$SCRIPT_DIR/scripts/strategist.sh"

# Remove old strategist jobs
crontab -l 2>/dev/null | grep -v strategist | grep -v '^$' > /tmp/crontab_tmp || true

# Add new jobs
echo "0 2 * * * $SCRIPT_DIR/scripts/strategist.sh morning >> $HOME/.claude/strategist.log 2>&1" >> /tmp/crontab_tmp
echo "0 2 * * 0 $SCRIPT_DIR/scripts/strategist.sh weekreview >> $HOME/.claude/strategist.log 2>&1" >> /tmp/crontab_tmp

crontab /tmp/crontab_tmp
rm /tmp/crontab_tmp

echo "Done. Cron jobs installed:"
crontab -l | grep strategist
