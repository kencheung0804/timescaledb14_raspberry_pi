bash

复制
#!/bin/bash
set -e

# Create TimescaleDB extension
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE EXTENSION IF NOT EXISTS timescaledb;
EOSQL

# Basic TimescaleDB settings
echo "timescaledb.telemetry_level=off" >> /var/lib/postgresql/data/postgresql.conf
echo "max_connections = 100" >> /var/lib/postgresql/data/postgresql.conf
echo "shared_buffers = 128MB" >> /var/lib/postgresql/data/postgresql.conf
echo "effective_cache_size = 512MB" >> /var/lib/postgresql/data/postgresql.conf
echo "maintenance_work_mem = 64MB" >> /var/lib/postgresql/data/postgresql.conf
echo "work_mem = 4MB" >> /var/lib/postgresql/data/postgresql.conf
