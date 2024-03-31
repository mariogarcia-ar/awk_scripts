#!/bin/bash
# -----------------------------------------------------------------------------
# 02

if [ $run_step $comparison_operator 02 ]; then
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