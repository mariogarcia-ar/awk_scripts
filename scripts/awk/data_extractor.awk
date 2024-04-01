#!/usr/bin/awk -f

BEGIN {
    # Precompile regular expressions
    date_regex = "(0[1-9]|[12][0-9]|3[01])[-./](0[1-9]|1[0-2])[-./](19|20)[0-9][0-9]"
    time_regex = "([01]?[0-9]|2[0-3]):([0-5][0-9])(:([0-5][0-9]))?( AM| PM)?"
    email_regex = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]+"
    money_regex = "(\$|€)[0-9]+([.,][0-9]+)?"
    print "type", "value", "line", "col", "length"
}

{
    line_length = length($0) # Store length of input line
    original_line = $0 # Store original line

    # Match dates
    while (match($0, date_regex)) {
        print "date", substr($0, RSTART, RLENGTH), NR, length(original_line) - length($0) + RSTART, RLENGTH
        $0 = substr($0, RSTART + RLENGTH)
    }

    $0 = original_line # Restore original line

    # Match times
    while (match($0, time_regex)) {
        print "time", substr($0, RSTART, RLENGTH), NR, length(original_line) - length($0) + RSTART, RLENGTH
        $0 = substr($0, RSTART + RLENGTH)
    }

    $0 = original_line # Restore original line

    # Match email addresses
    while (match($0, email_regex)) {
        print "email", substr($0, RSTART, RLENGTH), NR, length(original_line) - length($0) + RSTART, RLENGTH
        $0 = substr($0, RSTART + RLENGTH)
    }

    $0 = original_line # Restore original line

    # Match monetary values
    while (match($0, money_regex)) {
        print "money", substr($0, RSTART, RLENGTH), NR, length(original_line) - length($0) + RSTART, RLENGTH
        $0 = substr($0, RSTART + RLENGTH)
    }
}
