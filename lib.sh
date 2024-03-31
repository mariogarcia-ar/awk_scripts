#!/bin/bash

# bash run.sh only 1
  
# -----------------------------------------------------------------------------
# menu
direction="$1"
run_step="$2"

if [ -z "$run_step" ] || [ -z "$direction" ]; then
    echo "Usage: $0 <since/until/only> <run_step>" 
    exit 1
fi

if [ "$direction" == "since" ]; then
    comparison_operator="-le"
elif [ "$direction" == "until" ]; then
    comparison_operator="-ge"
elif [ "$direction" == "only" ]; then
    comparison_operator="-eq"
else
    echo "Invalid direction. Please specify 'since', 'until', or 'only'."
    exit 1
fi 

# -----------------------------------------------------------------------------
# Miscelaneous
my_printf() {
    local test=$1
    printf "\n> $test \n\n"
}

# Function to check if a file exists
file_exists() {
    local file="$1"
    [ -f "$file" ]
}


my_wget(){
    # URL of the file to download
    file_url="$1"

    # Local path where you want to save the file
    local_file="$2"    

    # Check if the file already exists
    if file_exists "$local_file"; then
        echo "File already exists. Skipping download."
    else
        # Download the file if it doesn't exist
        echo "Downloading file..."
        wget -q "$file_url" -O "$local_file"
        echo "Download completed."
    fi
}
