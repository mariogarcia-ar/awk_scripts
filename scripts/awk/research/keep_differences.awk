#!/usr/bin/awk -f
# awk -f keep_differences.awk file1.txt file2.txt > differences.txt


# Read the first file into an array
FNR == NR {
    lines[$0] = 1
    next
}

# If a line in the second file does not match a line in the array, print it
!($0 in lines)

# If a line in the first file does not match a line in the second file, print it
FNR != NR && !($0 in lines)
