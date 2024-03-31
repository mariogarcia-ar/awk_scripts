#!/bin/bash
# -----------------------------------------------------------------------------
# 02

# Check if the current step matches the specified condition
if [ $run_step $comparison_operator 02 ]; then
    # Print step indicator in red
    printf "${RED} Step 02 ${NC}\n"

    # Execute Fizz Buzz script
    my_printf "Fizz Buzz"
    # Path to the Fizz Buzz script
    script="$SCRIPTS_DIR/awk/book/chap02/cf.awk"
    # Execute awk script with a predefined value
    awk -v value=50 -f "$script" 


    # Replace text "Kathy" with "Katherine"
    my_printf "Replace text"
    awk '  { sub(/Kathy/,"Katherine"); print $0 }' "$DATA_DIR/emp.data" 


    # Execute custom gsub script
    my_printf "Custom gsub"
    # Path to the custom gsub script
    script="$SCRIPTS_DIR/awk/book/chap02/rest.awk"
    # Execute awk script with custom gsub
    awk -f "$script" "$DATA_DIR/emp.data"     
fi
