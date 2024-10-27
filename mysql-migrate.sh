#!/bin/bash

# Check if docker and mysql are installed
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Please install Docker and try again."
    exit 1
fi

# Copy the SQL file into the Docker container
docker cp tomato.sql mysql:/tomato.sql

# Import data into MySQL inside the Docker container
docker exec -i mysql mysql -u root -proot tomato < tomato.sql

echo "Data import completed successfully."