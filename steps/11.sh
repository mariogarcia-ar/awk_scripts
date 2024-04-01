#!/bin/bash
# -----------------------------------------------------------------------------
# 11

if [ $run_step $comparison_operator 11 ]; then
    printf "${RED} Step 11 ${NC}\n"

    # -------------------------------------------------------------------------
    input_data=$DATA_DIR"/fake_data/fake_data_generator_es_ES_shuffle.txt"
    input_data=$DATA_DIR"/fake_data/fake_data_generator.txt"
    output_data=$TMP_DIR"/fake_data_generator.csv"

    # =========================================================================
    my_printf "Data Extractor"    
    script=$SCRIPTS_DIR"/awk/data_extractor.awk"
    awk -f "$script" "$input_data" > "$output_data"
    echo "$output_data"

    my_printf "Report for Data Extractor"    
    script=$SCRIPTS_DIR"/awk/data_extractor_report.awk"
    awk -f "$script" "$output_data" 


fi