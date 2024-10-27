# Check if Docker is installed
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Output "Docker is not installed. Please install Docker and try again."
    exit 1
}

# Copy the SQL file into the Docker container
docker cp tomato.sql mysql:/tomato.sql

# Import data into MySQL inside the Docker container
Get-Content .\tomato.sql | docker exec -i mysql mysql -u root -proot tomato

Write-Output "Data import completed successfully."