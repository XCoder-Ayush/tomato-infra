$DB_NAME = "tomato"                        
$CONTAINER_NAME = "mongo"                  
$OUTPUT_DIR = "./mongo_dump"              
$USERNAME = "root"                
$PASSWORD = "root"                 

if (-Not (Test-Path $OUTPUT_DIR)) {
    Write-Output "Output directory $OUTPUT_DIR does not exist. Please run the export script first."
    exit
}

docker cp "${OUTPUT_DIR}" "${CONTAINER_NAME}:/dump"

# Import the collections into the MongoDB database
$collections = Get-ChildItem -Path $OUTPUT_DIR -Filter "*.json"

foreach ($file in $collections) {
    $collectionName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    Write-Output "Importing collection: $collectionName"
    
    docker exec -i $CONTAINER_NAME mongoimport --username $USERNAME --password $PASSWORD --db $DB_NAME --collection $collectionName --file /dump/$($file.Name) --jsonArray --authenticationDatabase admin
}

docker exec -i $CONTAINER_NAME rm -r /dump

Write-Output "All collections have been successfully imported into the $DB_NAME database in the Docker container."