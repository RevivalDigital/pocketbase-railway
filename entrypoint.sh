#!/bin/sh

if [ ! -f /pb_data/data.db ]; then
  echo "First run detected. Creating superuser..."
  /usr/local/bin/pocketbase superuser upsert $ADMIN_EMAIL $ADMIN_PASSWORD
fi

exec /usr/local/bin/pocketbase serve --http=0.0.0.0:${PORT}
