#!/bin/bash

# Step 1: Ask for a directory
read -p "Enter the directory path: " directory

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Directory does not exist. Aborting."
    exit 1
fi

# Change to the specified directory
cd "$directory" || exit 1

# Step 2 and 3: Identify and list audio files (excluding mp3)
echo "Identifying audio files in the directory:"
audio_files=()
count=1

for file in *.{wav,flac,ogg,opus,m4a}; do
    if [ -f "$file" ] && [ "${file##*.}" != "mp3" ]; then
        echo "$count. $file"
        audio_files+=("$file")
        ((count++))
    fi
done

# Step 4: Save audio file names in a list
if [ ${#audio_files[@]} -eq 0 ]; then
    echo "No suitable audio files found. Aborting."
    exit 1
fi

# Step 5: Ask whether to continue
read -p "Do you want to continue and convert these files? (y/n): " response

if [ "$response" != "y" ]; then
    echo "Aborting."
    exit 1
fi

# Step 6: Convert files to mp3 and delete the original files
echo "Converting files to mp3..."

total_files=${#audio_files[@]}
files_remaining=$total_files

for file in "${audio_files[@]}"; do
    output_file="${file%.*}.mp3"

    # Hide detailed ffmpeg output, only display the current file being processed
    echo -n "Converting $file... "

    # Redirect stdout and stderr to /dev/null
    ffmpeg -i "$file" -b:a 192K "$output_file" > /dev/null 2>&1

    # Check if ffmpeg was successful
    if [ $? -eq 0 ]; then
        echo "Done"
        rm "$file"
    else
        echo "Failed"
    fi

    # Update and display the counter
    ((files_remaining--))
    echo "Files remaining: $files_remaining of $total_files"
done

echo "Conversion completed. Original files have been deleted."

exit 0
