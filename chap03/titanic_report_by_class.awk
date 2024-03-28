BEGIN { print "\nUnique Class" } 

NR > 1 && !x[$2]++ {print $2}

END { 
    print "\nREPORT" 
    for ( k in x ) {
        print k, x[k]
    }
} 
