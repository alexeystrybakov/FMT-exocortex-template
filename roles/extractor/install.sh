#!/bin/bash
# Extractor: установка cron-задачи для inbox-check (Linux version)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing Extractor cron job..."

if [ ! -f "$SCRIPT_DIR/scripts/extractor.sh" ]; then
    echo "ERROR: $SCRIPT_DIR/scripts/extractor.sh not found"
    exit 1
fi

chmod +x "$SCRIPT_DIR/scripts/extractor.sh"

# Удаляем старые задачи
crontab -l 2>/dev/null | grep -v extractor | grep -v '^$' > /tmp/crontab_tmp || true

# Каждые 3 часа
echo "0 */3 * * * $SCRIPT_DIR/scripts/extractor.sh >> $HOME/.claude/extractor.log 2>&1" >> /tmp/crontab_tmp

crontab /tmp/crontab_tmp
rm /tmp/crontab_tmp

echo "  ✓ Installed: extractor cron job"
echo "  ✓ Interval: every 3 hours"
echo "  ✓ Logs: $HOME/.claude/extractor.log"
echo ""
echo "Verify: crontab -l | grep extractor"
