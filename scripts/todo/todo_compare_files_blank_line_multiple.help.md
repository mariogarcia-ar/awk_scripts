Sure, let's break down how the extended script works:

1. `#!/usr/bin/awk -f`: This line specifies the location of the `awk` interpreter.

2. `function read_file(file) { ... }`: This defines a function `read_file` that reads a file and stores its lines in an array.

3. `BEGIN { ... }`: This block of code executes before processing any input files. It loops through each input file specified on the command line and calls the `read_file` function to read each file and store its lines in an array.

4. `for (file in lines) { ... }`: This loop iterates through each line of the first file and checks if that line exists in all other files. It sets the variable `common` to `1` if the line is common to all files, and `0` otherwise.

5. `if (common) { ... } else { ... }`: This conditional statement prints the line if it is common to all files. If the line is not common to all files, it prints a blank line instead.

Here's how it works when you run the script with multiple files:

- The script reads each input file and stores its lines in separate arrays, one for each file.
- Then, for each line of the first file, it checks if that line exists in all other files.
- If the line is common to all files, it prints the line.
- If the line is not common to all files, it prints a blank line instead.

The result is a file where each line corresponds to a line present in all input files, with blank lines representing lines that are not common to all files.