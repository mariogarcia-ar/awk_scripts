#!/usr/bin/awk -f

# Function to read a file and store its lines in an array
function read_file(file) {
    while ((getline < file) > 0) {
        lines[file][$0] = 1
    }
    close(file)
}

# Read each input file and store its lines in an array
BEGIN {
    for (i = 1; i < ARGC; i++) {
        # read_file(ARGV[i])
        print i
    }
}

# Iterate through lines of the first file and check if they exist in all other files
{
    common = 1
    for (file in lines) {
        if (!($0 in lines[file])) {
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
