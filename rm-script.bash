#!/bin/bash

# Checking for the presence of an argument path.
if [ $# -eq 0 ]; then
    echo "ERROR :: The path is not specified"
    exit 1
fi

# Checking the existence of the path.
directory=$1
if [ ! -d "$directory" ]; then
    echo "ERROR :: Directory not exist."
    exit 1
fi

# Move to directory.
cd "$directory" || exit

# Creating an array of file extensions to delete.
extensions=("bak" "tmp" "backup")

# A variable for tracking file deletion.
deleted=false

# Go through all the files in the directory and delete the files with the specified extensions.
for extension in "${extensions[@]}"; do
    files=(*."$extension")
    if [ ${#files[@]} -gt 1 ]; then
        for file in "${files[@]}"; do
            rm "$file" && echo ">> Deleted file: $file"
            deleted=true
        done
    fi
done

# Checking if any files have been deleted
if [ "$deleted" = false ]; then
    echo "ERROR :: No exist files found."
else
    echo "OK :: All temporary files delete."
fi
