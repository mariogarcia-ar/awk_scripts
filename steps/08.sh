#!/bin/bash
# -----------------------------------------------------------------------------
# 08

if [ $run_step $comparison_operator 08 ]; then
    printf "${RED} Step 08 ${NC}\n"

    # =========================================================================
    # ./compare_diff.sh -d /path/to/directory -t my_template.txt -o /output/directory -a /path/to/templatecompare.awk
    script_bash=$SCRIPTS_DIR"/bash/compare_diff.sh"

    # -------------------------------------------------------------------------
    directory=$DATA_DIR"/out_pdftotext_join/"
    template=$DATA_DIR"/out_pdftotext_join/template.tpl"
    output_directory=$TMP_DIR"/compare_diff_output/"
    script=$SCRIPTS_DIR"/awk/diff.awk"
    
    mkdir -p "$output_directory"
    # -------------------------------------------------------------------------
    my_printf "Running compare_diff"    
    "$script_bash" -d "$directory" -t "$template" -o "$output_directory" -a "$script"


    # =========================================================================
    # ./compare_templatediff.sh -d /path/to/directory -t my_template.txt -o /output/directory -a /path/to/templatecompare.awk
    script_bash=$SCRIPTS_DIR"/bash/compare_templatediff.sh"
    # -------------------------------------------------------------------------
    directory=$DATA_DIR"/out_pdftotext_join/"
    template=$DATA_DIR"/out_pdftotext_join/template.tpl"
    output_directory=$TMP_DIR"/compare_templatediff_output/"
    script=$SCRIPTS_DIR"/awk/templatediff.awk"
    
    mkdir -p "$output_directory"
    # -------------------------------------------------------------------------
    my_printf "Running compare_templatediff"    
    "$script_bash" -d "$directory" -t "$template" -o "$output_directory" -a "$script"    
fi