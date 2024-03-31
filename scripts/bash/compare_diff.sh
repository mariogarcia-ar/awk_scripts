#!/bin/bash

# Default values
directory_to_explore="."
template_file="template.txt"
output_directory="comparison_output"
diff_script="./diff.awk"

# Function to display usage information
usage() {
    echo "Usage: $(basename "$0") [-d directory] [-t template_file] [-o output_directory] [-a diff_script]"
    echo "Compare all files in a directory with a template file and save the output."
    echo "Options:"
    echo "  -d, --directory         Directory to explore (default: current directory)"
    echo "  -t, --template-file     Template file to compare against (default: template.txt)"
    echo "  -o, --output-directory  Output directory to save comparison files (default: comparison_output)"
    echo "  -a, --diff-script       Path to diff.awk script (default: ./diff.awk)"
    exit 1
}

# Parse command-line options
while getopts ":d:t:o:a:" opt; do
    case $opt in
        d|--directory)
            directory_to_explore="$OPTARG"
            ;;
        t|--template-file)
            template_file="$OPTARG"
            ;;
        o|--output-directory)
            output_directory="$OPTARG"
            ;;
        a|--diff-script)
            diff_script="$OPTARG"
            ;;
        *)
            usage
            ;;
    esac
done

# Create output directory if it doesn't exist
mkdir -p "$output_directory"

# Iterate over each file in the directory
for file in "$directory_to_explore"/*; do
    # Check if the file is a regular file
    if [ -f "$file" ]; then
        # Get the filename without path
        filename=$(basename -- "$file")
        
        # Run diff.awk script
        "$diff_script" "$template_file" "$file" > "$output_directory/$filename.out"
        
        echo "Comparison for $filename is saved in $output_directory/$filename.out"
    fi
done

echo "All comparisons completed."
