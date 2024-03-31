#!/usr/bin/awk -f
# awk -f compare_files_blank_line.awk file1.txt file2.txt > output.txt

# Read the first file into an array
FNR == NR {
    lines[$0] = 1
    next
}

# If a line in the second file matches a line in the array, print it; otherwise, print a blank line
{
    if ($0 in lines) {
        print
    } else {
        print ""
    }
}
