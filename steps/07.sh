#!/bin/bash
# -----------------------------------------------------------------------------
# 07 

if [ $run_step $comparison_operator 07 ]; then
    printf "${RED} Step 07 ${NC}\n"

    # -------------------------------------------------------------------------
    page_001=$DATA_DIR"/out_pdftotext_join/page_001.txt"
    page_002=$DATA_DIR"/out_pdftotext_join/page_002.txt"
    page_003=$DATA_DIR"/out_pdftotext_join/page_003.txt"
    
    # -------------------------------------------------------------------------
    out_file=$TMP_DIR"/diff.txt"

    script=$SCRIPTS_DIR"/diff.awk"
    awk -f "$script" "$page_001" "$page_002" > "$out_file"
    my_printf "Files compared. See $out_file"
    
    # -------------------------------------------------------------------------
    out_file=$TMP_DIR"/templatediff.txt"

    script=$SCRIPTS_DIR"/templatediff.awk"
    awk -f "$script" "$page_001" "$page_002" > "$out_file"
    my_printf "Files compared. See $out_file"

fi


