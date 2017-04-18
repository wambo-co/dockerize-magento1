#!/bin/bash
#
# Run the Magento cron jobs

export PATH=$PATH:/usr/local/bin

echo "Running cron `date`"

# check if Magento is installed
if [ ! -f "/var/www/html/cron.php" ]; then
  echo >&2 "Magento is not installed yet"
  exit 1
fi

# check if Magento is in maintenance mode
if [ -f "/var/www/html/maintenance.flag" ]; then
  echo >&2 "Magento is in maintenance"
  exit 1
fi

php /var/www/html/cron.php
