FROM timescale/timescaledb:latest-pg14

# Remove the automatic tuning script
RUN rm /docker-entrypoint-initdb.d/001_timescaledb_tune.sh

# Add a custom initialization script
COPY init-timescaledb.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/init-timescaledb.sh
