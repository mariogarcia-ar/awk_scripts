# awk_scripts

# Summary
- https://quickref.me/awk.html

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


# Books

aws
- https://github.com/onetrueawk/awk
- The AWK Programming Language, Second Edition, by Al Aho, Brian Kernighan, and Peter Weinberger
