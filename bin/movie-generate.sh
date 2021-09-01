#!/usr/bin/env bash
set -e
INPUT_DIR=$1
OUTPUT_DIR=$2
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"
while read INPUT_FILE; do
    OUTPUT_FILE=$(basename "$INPUT_FILE")
    OUTPUT_FILE="${OUTPUT_FILE%.*}"
    echo "${INPUT_FILE} -> ${OUTPUT_FILE}"
    /pixterm ${INPUT_FILE} > "${OUTPUT_DIR}/${OUTPUT_FILE}"
done < <(find "$INPUT_DIR" -type f -name "*.jpg" | sort -n)
echo "Done"
exit 0