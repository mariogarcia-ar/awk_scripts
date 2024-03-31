#!/usr/bin/awk -f
# awk -f diff.awk file1.txt file2.txt > replaced.txt

# Read the first file into an array
FNR == NR {
    lines[$0] = 1
    next
}

# If a line in the second file does not match a line in the array, print a blank line
FNR != NR && !($0 in lines) {
    print ""
}

# If a line in the first file does not match a line in the second file, print a blank line
FNR != NR && !($0 in lines)
