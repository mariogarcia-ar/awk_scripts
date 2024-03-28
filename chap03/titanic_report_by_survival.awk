BEGIN { print "\nUnique Sex, Class" } 

NR > 1 && !x[$4,$2]++ {print $4, $2}


END { 
    print "\nREPORT: Total passangers ", NR - 1
    for ( k in x ) {
        split(k,sep,SUBSEP);
        printf("\tSex: %s, Class: %s, Total %s, Percentage: %3.2f%%\n", sep[1], sep[2], x[k], x[k]/(NF-1))
    }
} 
