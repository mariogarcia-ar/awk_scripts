#!/bin/bash

# bash run.sh only 1

# ------------------------------------------------------------------
# colors
RED='\033[0;31m'
NC='\033[0m' # No Color
                        
# -----------------------------------------------------------------------------
# constansts

# ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ROOT_DIR="$(pwd)"
DATA_DIR=$ROOT_DIR/data

# -----------------------------------------------------------------------------
# menu
direction="$1"
run_step="$2"

if [ -z "$run_step" ] || [ -z "$direction" ]; then
    echo "Usage: $0 <since/until/only> <run_step>" 
    exit 1
fi

if [ "$direction" == "since" ]; then
    comparison_operator="-le"
elif [ "$direction" == "until" ]; then
    comparison_operator="-ge"
elif [ "$direction" == "only" ]; then
    comparison_operator="-eq"
else
    echo "Invalid direction. Please specify 'since', 'until', or 'only'."
    exit 1
fi 

# if [ $run_step $comparison_operator 2 ]; then
# fi  


# -----------------------------------------------------------------------------
# Miscelaneous
my_printf() {
    local test=$1
    printf "\n> $test \n\n"
}

# -----------------------------------------------------------------------------
# 01

if [ $run_step $comparison_operator 1 ]; then
    printf "${RED} Step 01 ${NC}\n"
    
    my_printf "Filter grather than 0"
    awk '$3 > 0 { print $1, $2, $3, $2 * $3 }' "$DATA_DIR/emp.data"
    
    my_printf "Filter equals to 0"
    awk '$3 == 0 { print $1, $2, $3}' "$DATA_DIR/emp.data"

    my_printf "NF number of fields"
    awk 'END { print "Number of fields " NF}' "$DATA_DIR/emp.data"
    
    my_printf "NR number of record"
    awk '{ print "#" NR " -", $0}' "$DATA_DIR/emp.data"

    my_printf "printf build-in"
    awk '{ printf("Total pay for %s is $%.2f\n", $1, $2 * $3) }' "$DATA_DIR/emp.data"

    my_printf "sorting output"
    awk '{ printf("%6.2f %s\n", $2 * $3, $0) }' "$DATA_DIR/emp.data" | sort

    my_printf "filter by calculation"
    awk ' $2 * $3 > 20 { printf("%6.2f %s\n", $2 * $3, $1) }' "$DATA_DIR/emp.data" 

    my_printf "filter by content"
    awk ' $1 == "Susie" { printf("%6.2f %s\n", $2 * $3, $1) }' "$DATA_DIR/emp.data" 

    my_printf "filter by regexp"
    awk ' /Susie/ { printf("%6.2f %s\n", $2 * $3, $1) }' "$DATA_DIR/emp.data" 

    my_printf "filter by multiple patterns"
    awk ' $2 > 20 || $3 > 20 { printf("%6.2f %s\n", $2 * $3, $1) }' "$DATA_DIR/emp.data" 

    my_printf "multiples individuals conditions (if elseif ...) "
    awk ' 
        NF != 3 { print "Nro of fields is not 3 : " $0}
        $2 < 15 { print "Rate lower than 15 : " $0}
        $2 > 15 { print "Rate greather than 25 : " $0}
        $3 <= 0  { print "Zero or Negative hours worked : " $0}
        $3 >= 12  { print "Too many hours worked : " $0}
    ' "$DATA_DIR/emp.data" 


    my_printf "Begin and End"
    awk ' 
    BEGIN   { printf "Name\tRate\tHours\t\n"}
            {print $1"\t"$2"\t"$3 }
    END     {printf("\nTotal records: %d \n", NR)}
    
    ' "$DATA_DIR/emp.data" 


    my_printf "Counting: employee who have worked more than 15 hours"
    awk ' 
    BEGIN   { printf "Name\tRate\tHours\t\n"}
            $3 > 15 {print $1"\t"$2"\t"$3, total++ }
    END     {printf("\nTotal records: %d \n", total)}
    
    ' "$DATA_DIR/emp.data" 

    
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

    my_printf "Print nro lines"
    awk ' END {print NR }' "$DATA_DIR/emp.data" 

    my_printf "Print first 5 lines"
    awk ' NR <= 5 { print $0 } END { print "\nFirst 5 lines of" NR }' "$DATA_DIR/emp.data" 

    my_printf "Print even lines"
    awk ' NR % 2 == 0 { print NR, $0 }' "$DATA_DIR/emp.data" 

    my_printf "Print last field"
    awk ' { print $NF } ' "$DATA_DIR/emp.data" 

    my_printf "Count occurrences of Beth"
    awk ' /Beth/ { count++ } END { print count }' "$DATA_DIR/emp.data" 

    my_printf "Print max hour value and position"
    awk ' $3 > max { max = $3; maxline = $0 } END { print max, maxline }' "$DATA_DIR/emp.data" 

    my_printf "Flip the first and last fields"
    awk '  { temp_1 = $1; $1 = $NF; $NF = temp_1; print $0}' "$DATA_DIR/emp.data" 

fi  


# -----------------------------------------------------------------------------
# 02

if [ $run_step $comparison_operator 2 ]; then
    printf "${RED} Step 02 ${NC}\n"

    my_printf "Fizz Buzz"
    script="$ROOT_DIR/chap02/cf.awk"
    awk -v value=50 -f "$script" 


    my_printf "Replace text"
    awk '  { sub(/Kathy/,"Katherine"); print $0 }' "$DATA_DIR/emp.data" 


    my_printf "Custom gsub"
    script="$ROOT_DIR/chap02/rest.awk"
    awk -f "$script" "$DATA_DIR/emp.data" 
fi  


# -----------------------------------------------------------------------------
# 03

if [ $run_step $comparison_operator 3 ]; then
    printf "${RED} Step 03 ${NC}\n"
fi  

