#!/bin/bash
# -----------------------------------------------------------------------------
# 01

# Check if the current step matches the specified condition
if [ $run_step $comparison_operator 01 ]; then
    # Print step indicator in red
    printf "${RED} Step 01 ${NC}\n"

    # Filter records where the third field is greater than 0 and perform calculations
    my_printf "Filter greater than 0"
    awk '$3 > 0 { print $1, $2, $3, $2 * $3 }' "$DATA_DIR/emp.data"
    
    # Filter records where the third field is equal to 0
    my_printf "Filter equals to 0"
    awk '$3 == 0 { print $1, $2, $3}' "$DATA_DIR/emp.data"

    # Print the number of fields in each record
    my_printf "NF number of fields"
    awk 'END { print "Number of fields " NF}' "$DATA_DIR/emp.data"
    
    # Print record numbers along with their contents
    my_printf "NR number of record"
    awk '{ print "#" NR " -", $0}' "$DATA_DIR/emp.data"

    # Use printf to format output and perform calculations
    my_printf "printf built-in"
    awk '{ printf("Total pay for %s is $%.2f\n", $1, $2 * $3) }' "$DATA_DIR/emp.data"

    # Sort output based on calculated values
    my_printf "sorting output"
    awk '{ printf("%6.2f %s\n", $2 * $3, $0) }' "$DATA_DIR/emp.data" | sort

    # Filter records based on a calculation
    my_printf "filter by calculation"
    awk ' $2 * $3 > 20 { printf("%6.2f %s\n", $2 * $3, $1) }' "$DATA_DIR/emp.data" 

    # Filter records based on content
    my_printf "filter by content"
    awk ' $1 == "Susie" { printf("%6.2f %s\n", $2 * $3, $1) }' "$DATA_DIR/emp.data" 

    # Filter records using regular expressions
    my_printf "filter by regexp"
    awk ' /Susie/ { printf("%6.2f %s\n", $2 * $3, $1) }' "$DATA_DIR/emp.data" 

    # Filter records based on multiple patterns
    my_printf "filter by multiple patterns"
    awk ' $2 > 20 || $3 > 20 { printf("%6.2f %s\n", $2 * $3, $1) }' "$DATA_DIR/emp.data" 

    # Evaluate multiple individual conditions using if-elseif-else
    my_printf "multiples individuals conditions (if elseif ...) "
    awk ' 
        NF != 3 { print "Nro of fields is not 3 : " $0}
        $2 < 15 { print "Rate lower than 15 : " $0}
        $2 > 15 { print "Rate greater than 25 : " $0}
        $3 <= 0  { print "Zero or Negative hours worked : " $0}
        $3 >= 12  { print "Too many hours worked : " $0}
    ' "$DATA_DIR/emp.data" 

    # Perform actions at the beginning and end of processing
    my_printf "Begin and End"
    awk ' 
    BEGIN   { printf "Name\tRate\tHours\t\n"}
            {print $1"\t"$2"\t"$3 }
    END     {printf("\nTotal records: %d \n", NR)}
    
    ' "$DATA_DIR/emp.data" 

    # Count the number of records where hours worked is more than 15
    my_printf "Counting: employee who have worked more than 15 hours"
    awk ' 
    BEGIN   { printf "Name\tRate\tHours\t\n"}
            $3 > 15 {print $1"\t"$2"\t"$3, total++ }
    END     {printf("\nTotal records: %d \n", total)}
    
    ' "$DATA_DIR/emp.data" 

    # Calculate sums and averages for employees who worked more than 15 hours
    my_printf "Sums and Avgs: Reports for employee who have worked more than 15 hours"
    awk ' 
    BEGIN   { printf "Name\tRate\tHours\t\n"}
            $3 > 15 {print $1"\t"$2"\t"$3; count++; total_hs += $3  }
    END     {
                printf("\nREPORT")
                printf("\n Total hs: %d ", total_hs)
                printf("\n Average hs: %d ", total_hs / count)
                printf("\n Total employee: %d \n", count)
            }
    ' "$DATA_DIR/emp.data" 

    # Control flow based on conditions
    my_printf "Flow control: Reports for employee who have worked more than 15 hours"
    awk ' 
    BEGIN   { printf "Name\tRate\tHours\t\n"}
            $3 > 100 {print $1"\t"$2"\t"$3; count++; total_hs += $3  }
    END     {
                if (count > 0){
                    printf("\nREPORT")
                    printf("\n Total hs: %d ", total_hs)
                    printf("\n Average hs: %d ", total_hs / count)
                    printf("\n Total employee: %d \n", count)
                } else {
                    printf("\nREPORT: No data")
                }
            }
    ' "$DATA_DIR/emp.data" 

    # Implement the Fizz Buzz algorithm
    my_printf "Fizz Buzz"
    awk ' 
    BEGIN   {
                for(i=0; i<=100; i++){
                    if( i%15 == 0) { print i, "FizzBuzz"; count_FB++ }
                    else if( i%5 == 0) { print i, "Buzz"; count_B++ }
                    else if( i%3 == 0) { print i, "Fizz"; count_F++ }
                    else  { print i; count_O++ }
                }

                printf("\nTotal of FizzBuzz:  %3.0f  ", count_FB)
                printf("\nTotal of Fizz:  %3.0f  ", count_F)
                printf("\nTotal of Buzz:  %3.0f  ", count_B)
                printf("\nTotal of Others:  %3.0f  ", count_O)
            }
    
    '  

    # Print the total number of lines in the file
    my_printf "Print nro lines"
    awk ' END {print NR }' "$DATA_DIR/emp.data" 

    # Print the first 5 lines of the file
    my_printf "Print first 5 lines"
    awk ' NR <= 5 { print $0 } END { print "\nFirst 5 lines of" NR }' "$DATA_DIR/emp.data" 

    # Print even-numbered lines of the file
    my_printf "Print even lines"
    awk ' NR % 2 == 0 { print NR, $0 }' "$DATA_DIR/emp.data" 

    # Print the last field of each record
    my_printf "Print last field"
    awk ' { print $NF } ' "$DATA_DIR/emp.data" 

    # Count occurrences of the name "Beth"
    my_printf "Count occurrences of Beth"
    awk ' /Beth/ { count++ } END { print count }' "$DATA_DIR/emp.data" 

    # Print the maximum hour value and its corresponding line
    my_printf "Print max hour value and position"
    awk ' $3 > max { max = $3; maxline = $0 } END { print max, maxline }' "$DATA_DIR/emp.data" 

    # Swap the first and last fields of each record
    my_printf "Flip the first and last fields"
    awk '  { temp_1 = $1; $1 = $NF; $NF = temp_1; print $0}' "$DATA_DIR/emp.data" 

fi
