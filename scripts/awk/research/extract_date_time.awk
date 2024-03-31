#!/usr/bin/awk -f

# Regular expression to match date and time values in various formats
BEGIN {
    # Match formats like: 2024-03-31, 03/31/2024, 31-03-2024, 31/03/2024, 2024/03/31, 31.03.2024
    # date_regex = "(0[1-9]|1[0-2])[-./](0[1-9]|[12][0-9]|3[01])[-./](19|20)[0-9][0-9]"
    date_regex = "(0[1-9]|[12][0-9]|3[01])[-./](0[1-9]|1[0-2])[-./](19|20)[0-9][0-9]"
    
    # Match formats like: 10:30, 10:30 AM, 10:30 PM, 10:30:45, 10:30:45 AM, 10:30:45 PM
    time_regex = "([01]?[0-9]|2[0-3]):([0-5][0-9])(:([0-5][0-9]))?( AM| PM)?"

    print "type", "value", "line", "col", "length"
}

date_regex {
    original_0 = $0

    # Loop through each occurrence of date value in the input line
    while (match($0, date_regex)) {
        value = substr($0, RSTART, RLENGTH)
        col = index(original_0, value)
        print "date", value, NR, col, RLENGTH
        $0 = substr($0, RSTART + RLENGTH)
    }
}    

time_regex {
    original_0 = $0

    # Loop through each occurrence of time value in the input line
    while (match($0, time_regex)) {
        value = substr($0, RSTART, RLENGTH)
        col = index(original_0, value)
        print "time", value, NR, col, RLENGTH
        $0 = substr($0, RSTART + RLENGTH)
    }
}
