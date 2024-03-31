BEGIN { print "\nUnique Sex" } 

NR > 1 && !x[$4]++ {print $4}

END { 
    print "\nREPORT" 
    for ( k in x ) {
        print k, x[k]
    }
} 
