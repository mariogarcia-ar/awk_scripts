#!/usr/bin/awk -f

# Regular expression to match date and time values in various formats
BEGIN {
    print "Report for extract data script"
    print "type", "count"
}
{
    report[$1]++
}
END {
    for ( k in report ) {
        print k, report[k]
    }
} 