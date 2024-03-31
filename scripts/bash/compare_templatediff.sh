#!/bin/bash
# ./templatediff.sh -d /path/to/directory -t my_template.txt -o /output/directory -a /path/to/templatecompare.awk

# Default values
directory_to_explore="."
template_file="template.txt"
output_directory="comparison_output"
template_compare_script="./templatecompare.awk"

# Function to display usage information
usage() {
    echo "Usage: $(basename "$0") [-d directory] [-t template_file] [-o output_directory] [-a templatecompare_script]"
    echo "Compare all files in a directory with a template file and save the output."
    echo "Options:"
    echo "  -d, --directory             Directory to explore (default: current directory)"
    echo "  -t, --template-file         Template file to compare against (default: template.txt)"
    echo "  -o, --output-directory      Output directory to save comparison files (default: comparison_output)"
    echo "  -a, --templatecompare-script Path to templatecompare.awk script (default: ./templatecompare.awk)"
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
        a|--templatecompare-script)
            template_compare_script="$OPTARG"
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
        
        # Run templatecompare.awk script
        "$template_compare_script" "$template_file" "$file" > "$output_directory/$filename.out"
        
        echo "Comparison for $filename is saved in $output_directory/$filename.out"
    fi
done

echo "All comparisons completed."
