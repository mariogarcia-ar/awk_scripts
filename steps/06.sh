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

    script=$SCRIPTS_DIR"/compare_files.awk"
    awk -f "$script" "$page_001" "$page_002" > "$out_file"
    my_printf "Files compared. See $out_file"

    # -------------------------------------------------------------------------
    # Detect lines that have a high probability of being static or template
    out_file=$TMP_DIR"/common_lines_blank_lines.txt"

    script=$SCRIPTS_DIR"/compare_files_blank_line.awk"
    awk -f "$script" "$page_001" "$page_002" > "$out_file"
    my_printf "Files compared. See $out_file"

 


fi


