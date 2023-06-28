#!/bin/bash

docker compose --file docker-compose.yml build --no-cache
docker compose --file docker-compose.yml --file .integration-test/docker-compose.test.yml run testcontainer-verification-tss
docker compose --file docker-compose.yml --file .integration-test/docker-compose.test.yml run testcontainer-verification-pis
