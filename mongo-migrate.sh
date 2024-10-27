#!/bin/bash

# Check if docker and mongo are installed
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Please install Docker and try again."
    exit 1
fi

# Copy the JSON file into the MongoDB Docker container
docker cp tomato.json mongo:/tomato.json

# Import data into MongoDB inside the Docker container
docker exec -i mongo mongoimport --db tomato --collection <your_collection_name> --file /tomato.json --jsonArray

echo "Data import into MongoDB completed successfully."