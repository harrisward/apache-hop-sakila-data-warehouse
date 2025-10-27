# Sakila Hop

An ETL (Extract, Transform, Load) project built with Apache Hop that transforms the Sakila sample database into a dimensional data warehouse schema.

## Overview

This project demonstrates a complete data warehouse implementation using Apache Hop. It extracts data from the Sakila OLTP (Online Transaction Processing) database and loads it into a star schema optimized for analytics and reporting.

### What is Sakila?

Sakila is a sample database originally developed by MySQL to demonstrate database features. It represents a DVD rental store with tables for films, actors, customers, rentals, and payments.

## Project Structure

```
sakila-hop/
├── etl/
│   ├── main.hwf                 # Main workflow orchestrating the ETL process
│   ├── dimensions/              # Dimension table pipelines
│   │   ├── actor-dimension.hpl
│   │   ├── customer-dimension.hpl
│   │   ├── date-dimension.hpl
│   │   ├── film-dimension.hpl
│   │   ├── staff-dimension.hpl
│   │   ├── store-dimension.hpl
│   │   └── time-dimension.hpl
│   ├── facts/                   # Fact table pipelines
│   │   └── rentals-fact.hpl
│   └── utilities/               # Utility pipelines
│       └── lookup-address.hpl
├── ddl/
│   └── postgres/                # Database schema files
│       ├── sakila-postgres-schema.sql
│       ├── sakila-postgres-data.sql
│       └── sakila-dwh-postgres-schema.sql
├── docker/
│   └── docker-compose.yml       # PostgreSQL database container
├── metadata/
│   └── rdbms/                   # Database connection metadata
└── project-config.json          # Apache Hop project configuration
```

## Features

- **Star Schema Design**: Implements a dimensional model with fact and dimension tables
- **Dimension Tables**:
  - Actor Dimension
  - Customer Dimension
  - Date Dimension
  - Film Dimension
  - Staff Dimension
  - Store Dimension
  - Time Dimension
- **Fact Tables**:
  - Rentals Fact
- **Automated ETL**: Complete workflow for data extraction, transformation, and loading

## Prerequisites

- Apache Hop (latest version recommended)
- PostgreSQL database (you can use your own PostgreSQL server or use the provided Docker setup)
- Docker and Docker Compose (optional, only if using the provided Docker setup)

## Getting Started

### 1. Set Up the Database

You have two options:

**Option A: Use Your Own PostgreSQL Server**

If you already have a PostgreSQL server running, you can skip to step 2 and use your existing server. Just make sure to note your connection details for the configuration step.

**Option B: Use Docker (Recommended for Quick Start)**

Start the PostgreSQL database using the provided Docker Compose configuration:

```bash
cd docker
docker-compose up -d
```

Set the required environment variables by creating a `.env` file in the `docker` directory:

```
POSTGRES_USER=your_user
POSTGRES_PASSWORD=your_password
POSTGRES_DB=sakila
POSTGRES_PORT=5432
```

### 2. Initialize the Database

First, create the required schemas:

```bash
psql -U your_user -d sakila -c "CREATE SCHEMA IF NOT EXISTS source;"
psql -U your_user -d sakila -c "CREATE SCHEMA IF NOT EXISTS dwh;"
```

Load the Sakila source schema and data:

```bash
psql -U your_user -d sakila -f ddl/postgres/sakila-postgres-schema.sql
psql -U your_user -d sakila -f ddl/postgres/sakila-postgres-data.sql
```

Create the data warehouse schema:

```bash
psql -U your_user -d sakila -f ddl/postgres/sakila-dwh-postgres-schema.sql
```

### 3. Set Up Apache Hop Project

1. Open Apache Hop
2. Create a new project named `sakila-hop`
3. Point the project home directory to this project's root directory (where [project-config.json](project-config.json) is located)
4. Apache Hop will automatically use the `project-config.json` file to configure the project

### 4. Set Up Apache Hop Environment

1. In Apache Hop, create a new environment called `development`
2. Point it to the [environments/development.json](environments/development.json) file in this project
3. Update your PostgreSQL server details in [environments/development.json](environments/development.json)

The database connections are already configured and parameterized - simply update the values to match your setup:

```json
{
  "variables": [
    {
      "name": "SAKILA_SOURCE_HOSTNAME",
      "value": "localhost"
    },
    {
      "name": "SAKILA_SOURCE_PORT",
      "value": "5432"
    },
    {
      "name": "SAKILA_SOURCE_USERNAME",
      "value": "your_user"
    },
    {
      "name": "SAKILA_SOURCE_PASSWORD",
      "value": "your_password"
    },
    {
      "name": "SAKILA_DWH_HOSTNAME",
      "value": "localhost"
    },
    {
      "name": "SAKILA_DWH_PORT",
      "value": "5432"
    },
    {
      "name": "SAKILA_DWH_USERNAME",
      "value": "your_user"
    },
    {
      "name": "SAKILA_DWH_PASSWORD",
      "value": "your_password"
    }
  ]
}
```

### 5. Run the ETL

Execute the main workflow:

```bash
./hop-run.sh --file=etl/main.hwf --project=sakila-hop --environment=development
```

Or open [etl/main.hwf](etl/main.hwf) in Apache Hop GUI and run it manually.

## Data Warehouse Schema

The project creates a star schema with:

- **Dimension Tables**: Store descriptive attributes (SCD Type 2 where applicable)
- **Fact Tables**: Store measurable events and metrics (rental transactions)

This design enables efficient analytical queries and reporting on rental patterns, customer behavior, film performance, and store operations.

## Contributing

Feel free to submit issues or pull requests to improve this project.

## License

This project is provided as-is for educational and demonstration purposes.

## Resources

- [Apache Hop Documentation](https://hop.apache.org/manual/latest/)
- [Sakila Database Documentation](https://dev.mysql.com/doc/sakila/en/)
