# awk_scripts

# Summary
- https://quickref.me/awk.html
- https://awk.js.org/  for regular expressions
- https://www.baeldung.com/linux/awk-call-external-program

## Program
```awk
BEGIN          {<initializations>} 
   <pattern 1> {<program actions>} 
   <pattern 2> {<program actions>} 
   ...
END            {< final actions >}
```

## Build-in variables
- $0	                Whole line
- $1, $2...$NF	        First, second… last field
- NR	                Number of Records
- NF	                Number of Fields
- OFS	                Output Field Separator      (default " ")
- FS	                input Field Separator       (default " ")
- ORS	                Output Record Separator     (default "\n")
- RS	                input Record Separator      (default "\n")
- FILENAME	            Name of the file

## Variable
```awk
awk -v var1="Hello" -v var2="Wold" '
    END {print var1, var2}
' </dev/null
```

## Evironment Variables

- ARGC	            Number or arguments
- ARGV	            Array of arguments
- FNR	            File Number of Records
- OFMT	            Format for numbers                      (default "%.6g")
- RSTART	        Location in the string
- RLENGTH	        Length of match
- SUBSEP	        Multi-dimensional array separator       (default "\034")
- ARGIND	        Argument Index

# Regular Expression
```awk
/regex/	                # Line matches
!/regex/	            # Line not matches
$1 ~ /regex/	        # Field matches
$1 !~ /regex/	        # Field not matches
```

## Awk Functions

- index(s,t)	        Position in string s where string t occurs, 0 if not found
- length(s)	            Length of string s (or $0 if no arg)
- rand	                Random number between 0 and 1
- substr(s,index,len)	Return len-char substring of s that begins at index (counted from 1)
- srand	                Set seed for rand and return previous seed
- int(x)	            Truncate x to integer value
- split(s,a,fs)	        Split string s into array a split by fs, returning length of a
- match(s,r)	        Position in string s where regex r occurs, or 0 if not found
- sub(r,t,s)	        Substitute t for first occurrence of regex r in string s (or $0 if s not given)
- gsub(r,t,s)	        Substitute t for all occurrences of regex r in string s
- system(cmd)	        Execute cmd and return exit status
- tolower(s)	        String s to lowercase
- toupper(s)	        String s to uppercase
- getline	            Set $0 to next input record from current input file.

## User defined function

```awk
 awk '
    # Returns minimum number
    function find_min(num1, num2){
       if (num1 < num2)
       return num1
       return num2
    }
    # Returns maximum number
    function find_max(num1, num2){
       if (num1 > num2)
       return num1
       return num2
    }
    # Main function
    function main(num1, num2){
       result = find_min(num1, num2)
       print "Minimum =", result
      
       result = find_max(num1, num2)
       print "Maximum =", result
    }
    # Script execution starts here
    BEGIN {
       main(10, 60)
    }
'

```

# Call External Programs
- awk + sendmail: Read a CSV file containing email addresses and messages, and process and send each message
- awk + cp: Read input of a file list, and copy the files to a required destination with a defined name pattern
- awk + md5sum: Read input containing a list of filenames, output the filename and the MD5 hash of the file

# Notes:

Awk, Sed, and Grep are command-line tools commonly used in Unix and Unix-like operating systems for text processing. Here's a brief overview of when to use each:

- **Grep**: Use Grep to search for specific patterns in text files. It's great for quickly finding lines that match a certain pattern or regular expression.
- **Sed**: Sed is a stream editor used to perform basic text transformations on an input stream. It's useful for tasks like search and replace, inserting or deleting lines, and more complex text manipulations.
- **Awk**: Awk is a versatile programming language designed for pattern scanning and processing. It's useful for processing and analyzing text files, especially when dealing with structured data.

In summary, use Grep for searching, Sed for basic text transformations, and Awk for more complex text processing and analysis. Each tool has its strengths, and they can also be used together in more complex text processing tasks.

# Gensub
`gensub` is a function in Awk used for substitution in text processing. It allows you to perform more complex string substitutions than what can be achieved with the basic `sub` and `gsub` functions.

The syntax of `gensub` is:

```awk
gensub(regexp, replacement, how, target)
```

- `regexp`: Regular expression pattern to search for.
- `replacement`: The string to replace the matched part of the `target` with.
- `how`: Specifies how many substitutions to make.
  - Use `'G'` to replace all occurrences (like `gsub`).
  - Use `'1'` or nothing to replace the first occurrence (like `sub`).
- `target`: The string to perform the substitution on.

Here's a breakdown of its parameters:

- **`regexp`**: This is the regular expression pattern you want to match in the target string.

- **`replacement`**: This is the string that will replace the matched part of the `target`. You can include backreferences to capture groups from the regular expression.

- **`how`**: This specifies how many substitutions to perform. It can take the following values:
  - `'G'`: Replace all occurrences (global).
  - `'1'` or nothing: Replace only the first occurrence.

- **`target`**: This is the string that `gensub` will operate on.

Here's a simple example of how `gensub` can be used:

```awk
# Replace all occurrences of "foo" with "bar" in the string
result = gensub(/foo/, "bar", "G", "foo foo foo")
print result  # Output: bar bar bar
```

`gensub` is particularly useful when you need more control over the substitution process or when working with more complex patterns.

To extract money from a string using `gensub` in Awk, you would typically use a regular expression to match the monetary value, and then use backreferences in the replacement string to extract the matched value. Here's an example of how you could do this:

```awk
# Sample input string containing monetary values
input_string = "The total cost is $50.75 and the discount is $10.50."

# Regular expression to match monetary values
regex = /(\$[0-9]+(\.[0-9]{2})?)/

# Use gensub to extract monetary values
while (match(input_string, regex)) {
    # Extract the matched value and print
    money = gensub(regex, "\\1", "1", input_string)
    print "Found money:", money
    
    # Remove the extracted value from input_string
    input_string = substr(input_string, RSTART + RLENGTH)
}
```

This script will search for monetary values (e.g., $50.75) in the input string and extract them one by one using `gensub`. The regular expression `(\$[0-9]+(\.[0-9]{2})?)` matches a dollar sign followed by one or more digits, optionally followed by a decimal point and exactly two digits (for cents).

In the `gensub` call:
- The regular expression `regex` is used to match the monetary value.
- The replacement string `"\\1"` uses a backreference (`\\1`) to refer to the entire matched value.

The script will loop through the input string, extracting each monetary value and printing it until no more matches are found.


# Books

aws
- https://github.com/onetrueawk/awk
- The AWK Programming Language, Second Edition, by Al Aho, Brian Kernighan, and Peter Weinberger

# Notes:
```awk
    # # Replace non-alphanumeric ASCII characters with underscores
    gsub(/[^[:alnum:]]/, "_", $0)

    # Replace non-ASCII characters with underscores
    gsub(/[^\x00-\x7F]/, "_")

    # Replace non-ASCII American characters with underscores
    gsub(/[^[:print:]]|[^\x20-\x7E]/, "_")
```


date, time, timestamp 
number, float, boolean,
ip, email, uri, 
credit card, 
phonenumber, zip code, 
guid, sku, 
html, json, serialize 
username, password
