#!/usr/bin/awk -f
# awk -f compare_files_blank_line_wildcard.awk file*.txt > output.txt

# Function to read a file and store its lines in an array
function read_file(file) {
    while ((getline < file) > 0) {
        lines[$0] = 1
    }
    close(file)
}

# Read each input file and store its lines in an array
BEGIN {
    for (i = 1; i < ARGC; i++) {
        files[ARGV[i]] = 1
    }
    for (file in files) {
        read_file(file)
    }
}

# Iterate through lines of the first file and check if they exist in all other files
{
    common = 1
    for (file in files) {
        if (!($0 in lines)) {
            common = 0
            break
        }
    }
    if (common) {
        print
    } else {
        print ""
    }
}
