#!/usr/bin/awk -f

# The awk utility's match() function uses POSIX Extended Regular Expressions (ERE), 
# which don't support the {n,} quantifier directly. However, you can achieve similar 
# functionality by repeating the pattern explicitly.

# Regular expression to match email addresses
BEGIN {
    regex="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+"

    print "email", "line", "col", "length"
}

regex {
    original_0 = $0
    # Loop through each occurrence of email address in the input line
    while (match($0, regex)) {
        # Extract the matched email address
        email = substr($0, RSTART, RLENGTH)
      
        # Calculate the column position within the original line
        col = index(original_0, email)
        
        # Print the extracted email address along with its line, column, and length
        print email, NR, col, RLENGTH

        # Remove the extracted email address from the input line
        $0 = substr($0, RSTART + RLENGTH)
    }
}
