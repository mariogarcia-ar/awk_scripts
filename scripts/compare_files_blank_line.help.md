Sure, let's break down how the script works:

1. `#!/usr/bin/awk -f`: This line specifies the location of the `awk` interpreter. When you run the script, it tells the system to use `awk` to interpret and execute the script.

2. `FNR == NR { lines[$0] = 1; next }`: This block of code executes for the first file being processed. `FNR` represents the record number in the current file, and `NR` represents the total record number across all files. When `FNR` is equal to `NR`, it means `awk` is reading the first file. It creates an associative array called `lines`, where each line of the file is stored as a key. The value associated with each key is set to `1`. The `next` statement ensures that `awk` immediately proceeds to the next record without processing any further rules.

3. `{ if ($0 in lines) { print } else { print "" } }`: This block of code executes for the second file being processed. It checks if the current line (`$0`) is present in the `lines` array. If it is, meaning the line is present in both files, it prints the line. If it's not present, it prints a blank line instead.

Here's how it works when you run the script with two files, `file1.txt` and `file2.txt`:

- `awk` reads `file1.txt` first and stores each line in the `lines` array.
- Then, `awk` reads `file2.txt`. For each line in `file2.txt`, it checks if that line exists in the `lines` array.
- If the line exists in `file1.txt`, meaning it's common to both files, `awk` prints the line.
- If the line doesn't exist in `file1.txt`, meaning it's unique to `file2.txt`, `awk` prints a blank line instead.

The result is a file where each line corresponds to a line in one of the input files, with blank lines representing lines that are not present in both files.