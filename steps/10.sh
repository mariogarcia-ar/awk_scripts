#!/bin/bash
# -----------------------------------------------------------------------------
# 10

if [ $run_step $comparison_operator 10 ]; then
    printf "${RED} Step 10 ${NC}\n"

    # ========================================================================
    # en_US
    # -------------------------------------------------------------------------
    output=$TMP_DIR"/out_fake_data_generator.txt"

    my_printf "Generate Fake data"    
    script=$SCRIPTS_DIR"/python/fake_data_generator.py"
    python "$script" 1000   -o "$output" -n 20


    # -------------------------------------------------------------------------
    output=$TMP_DIR"/out_fake_data_generator_shuffle.txt"

    my_printf "Generate Fake data with shuffle option"    
    script=$SCRIPTS_DIR"/python/fake_data_generator.py"
    python "$script" 1000   -o "$output" -n 20 -s
 

    # ========================================================================
    # es_ES
    # -------------------------------------------------------------------------
    output=$TMP_DIR"/out_fake_data_generator_es_ES.txt"

    my_printf "Generate Fake data with locale equal to es_ES"    
    script=$SCRIPTS_DIR"/python/fake_data_generator.py"
    python "$script" 1000   -o "$output" -n 20 -l "es_ES"


    # -------------------------------------------------------------------------
    output=$TMP_DIR"/out_fake_data_generator_es_ES_shuffle.txt"

    my_printf "Generate Fake data with shuffle option and locale equal to es_ES"    
    script=$SCRIPTS_DIR"/python/fake_data_generator.py"
    python "$script" 1000   -o "$output" -n 20 -s -l "es_ES"
 

fi