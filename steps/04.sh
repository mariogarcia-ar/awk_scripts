#!/bin/bash
# -----------------------------------------------------------------------------
# 04

if [ $run_step $comparison_operator 04 ]; then
    printf "${RED} Step 04 ${NC}\n"

    my_wget "https://raw.githubusercontent.com/plotly/datasets/master/beers.csv" "$TMP_DIR/beers.csv"

    my_printf "Separate beers into multiple files by style"
    script="$ROOT_DIR/chap04/unbundle.awk"
    awk -F, -f "$script" "$TMP_DIR/beers.csv"    
fi