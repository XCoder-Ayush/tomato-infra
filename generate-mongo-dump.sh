#!/bin/bash

DB_NAME="tomato"

OUTPUT_DIR="./mongo_dump"
mkdir -p "$OUTPUT_DIR"

collections=$(mongosh "$DB_NAME" --quiet --eval "db.getCollectionNames().join(' ')")

for collection in $collections; do
    echo "Exporting collection: $collection"
    mongoexport --db "$DB_NAME" --collection "$collection" --out "$OUTPUT_DIR/$collection.json" --jsonArray
done

echo "All collections have been exported to the $OUTPUT_DIR directory."