#!/bin/bash

if [[ ! -d "$1" ]]; then
 echo "Directory not exist."
 exit 1
fi

find "$1" -type f \( -name '*.bak' -o -name '*.tmp' -o -name '*.backup' \) -delete -print

if [[ $? -eq 0 ]]; then
 echo "Finished. All temporary files deleted."
else
 echo "No exist files found."
fi