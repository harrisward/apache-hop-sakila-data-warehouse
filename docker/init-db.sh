#!/bin/bash
set -e

echo "Creating schemas..."
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE SCHEMA IF NOT EXISTS source;
    CREATE SCHEMA IF NOT EXISTS dwh;
EOSQL

echo "Loading Sakila source schema..."
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -f /ddl-files/sakila-postgres-schema.sql

echo "Loading Sakila source data..."
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -f /ddl-files/sakila-postgres-data.sql

echo "Creating data warehouse schema..."
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -f /ddl-files/sakila-dwh-postgres-schema.sql

echo "Database initialization completed successfully!"
