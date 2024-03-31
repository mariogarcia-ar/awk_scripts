#!/usr/bin/awk -f

# If awk's index() function is returning incorrect positions when processing a UTF-8 encoded 
# file but works correctly after converting the file to Windows-1252 encoding, it's likely 
# because index() counts bytes rather than characters. Since UTF-8 characters can consist of 
# multiple bytes, their positions can be misinterpreted when using index() directly on UTF-8 text.

# Convert the file to Windows-1252 encoding before processing: This approach ensures that index() 
# behaves as expected since Windows-1252 characters are single-byte encoded.

# iconv -f UTF-8 -t WINDOWS-1252 filename | awk '{
#     # Your AWK script here
#     print $0  # For example, print each line
# }'


# Regular expression to match dollar and euro monetary values with comma or dot as decimal separator
BEGIN {
    regex = "(\$|€)[0-9]+([.,][0-9]+)?"
    print "value", "line", "col", "length"
}

{
    original_0 = $0
    # Loop through each occurrence of monetary value in the input line
    while (match($0, regex)) {
        # Extract the matched value
        value = substr($0, RSTART, RLENGTH)
      
        # Calculate the column position within the original line
        col = index(original_0, value)
        
        # Print the extracted monetary value along with its line, column, and length
        print value, NR, col, RLENGTH

        # Remove the extracted value from the input line
        $0 = substr($0, RSTART + RLENGTH)
    }
}
