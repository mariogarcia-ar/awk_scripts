#!/bin/bash
# -----------------------------------------------------------------------------
# 04

# Check if the current step matches the specified condition
if [ $run_step $comparison_operator 04 ]; then
    # Print step indicator in red
    printf "${RED} Step 04 ${NC}\n"

    # Download the beers dataset
    my_wget "https://raw.githubusercontent.com/plotly/datasets/master/beers.csv" "$TMP_DIR/beers.csv"

    # Separate beers into multiple files by style
    my_printf "Separate beers into multiple files by style"
    # Path to the script for unbundling beers by style
    script="$SCRIPTS_DIR/awk/book/chap04/unbundle.awk"
    # Execute awk script with ',' as field separator
    awk -F, -f "$script" "$TMP_DIR/beers.csv"    
fi
