#!/bin/bash
# -----------------------------------------------------------------------------
# 10

if [ $run_step $comparison_operator 10 ]; then
    printf "${RED} Step 10 ${NC}\n"


    # -------------------------------------------------------------------------
    output=$TMP_DIR"/out_fake_data_generator.txt"

    my_printf "Generate Fake data"    
    script=$SCRIPTS_DIR"/python/fake_data_generator.py"
    python "$script" 1000   -o "$output" -n 20

    my_printf "Extrat money from utf-8"    
    script=$SCRIPTS_DIR"/awk/research/extract_money.awk"
    awk -f "$script" "$output"     

    my_printf "Extrat extract_date_time from utf-8"    
    script=$SCRIPTS_DIR"/awk/research/extract_date_time.awk"
    awk -f "$script" "$output" 

    exit 1
   # -------------------------------------------------------------------------
    output=$TMP_DIR"/out_fake_data_generator_suffle.txt"

    my_printf "Generate Fake data with suffle option"    
    script=$SCRIPTS_DIR"/python/fake_data_generator.py"
    python "$script" 1000   -o "$output" -s -n 20


    my_printf "Extrat money from utf-8"    
    script=$SCRIPTS_DIR"/awk/research/extract_money.awk"
    awk -f "$script" "$output"     

fi