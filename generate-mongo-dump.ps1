$DB_NAME = "tomato"

$OUTPUT_DIR = "./mongo_dump"
New-Item -ItemType Directory -Path $OUTPUT_DIR -Force | Out-Null

$collections = mongosh $DB_NAME --quiet --eval "db.getCollectionNames().join(' ')"

foreach ($collection in $collections -split ' ') {
    Write-Output "Exporting collection: $collection"
    mongoexport --db $DB_NAME --collection $collection --out "$OUTPUT_DIR\$collection.json" --jsonArray
}

Write-Output "All collections have been exported to the $OUTPUT_DIR directory."