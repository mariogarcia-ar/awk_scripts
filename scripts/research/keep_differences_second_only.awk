#!/usr/bin/awk -f
# awk -f keep_differences_second_only.awk file1.txt file2.txt > second_file_only.txt

# Read the first file into an array
FNR == NR {
    lines[$0] = 1
    next
}

# If a line in the second file does not match a line in the array, print it
FNR != NR && !($0 in lines)
