#!/usr/bin/awk -f
# awk -f compare_files.awk file1.txt file2.txt > common_lines.txt

# Read the first file into an array
FNR == NR {
    lines[$0] = 1
    next
}

# If a line in the second file matches a line in the array, print it
$0 in lines {
    print
}
