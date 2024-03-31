#!/bin/bash
# -----------------------------------------------------------------------------
# 06 

if [ $run_step $comparison_operator 06 ]; then
    printf "${RED} Step 06 ${NC}\n"

    # -------------------------------------------------------------------------
    page_001=$DATA_DIR"/out_pdftotext_join/page_001.txt"
    page_002=$DATA_DIR"/out_pdftotext_join/page_002.txt"
    page_003=$DATA_DIR"/out_pdftotext_join/page_003.txt"
    
    out_file=$TMP_DIR"/common_lines.txt"

    script=$SCRIPTS_DIR"/awk/research/compare_files.awk"
    awk -f "$script" "$page_001" "$page_002" > "$out_file"
    my_printf "Files compared. See $out_file"

    # -------------------------------------------------------------------------
    # Detect lines that have a high probability of being static or template
    out_file=$TMP_DIR"/common_lines_blank_lines.txt"

    script=$SCRIPTS_DIR"/awk/research/compare_files_blank_line.awk"
    awk -f "$script" "$page_001" "$page_002" > "$out_file"
    my_printf "Files compared. See $out_file"

 
    # -------------------------------------------------------------------------
    # Detect lines that have a high probability of being static or template
    out_file=$TMP_DIR"/keep_differences.txt"

    script=$SCRIPTS_DIR"/awk/research/keep_differences.awk"
    awk -f "$script" "$page_001" "$page_002" > "$out_file"
    my_printf "Files compared. See $out_file"

 
    # -------------------------------------------------------------------------
    # Detect lines that have a high probability of being static or template
    out_file=$TMP_DIR"/keep_differences_second_only.txt"

    script=$SCRIPTS_DIR"/awk/research/keep_differences_second_only.awk"
    awk -f "$script" "$page_001" "$page_002" > "$out_file"
    my_printf "Files compared. See $out_file"
 
    # -------------------------------------------------------------------------
    # Detect lines that have a high probability of being static or template
    out_file=$TMP_DIR"/keep_differences_blank_line.txt"

    script=$SCRIPTS_DIR"/awk/research/keep_differences_blank_line.awk"
    awk -f "$script" "$page_001" "$page_002" > "$out_file"
    my_printf "Files compared. See $out_file"


# keep_differences_second_only

fi


