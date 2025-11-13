#!/bin/bash

# This command stops containers AND removes volumes
# associated with this docker-compose.yaml file.
docker compose down -v

# Recreate everything
docker compose up --build -d
