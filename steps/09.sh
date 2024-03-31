#!/bin/bash
# -----------------------------------------------------------------------------
# 09

if [ $run_step $comparison_operator 09 ]; then
    printf "${RED} Step 09 ${NC}\n"

    # -------------------------------------------------------------------------
    page_001=$DATA_DIR"/out_pdftotext_join/page_001.txt"

    # Define regular expression to match monetary values
    regex='\$[0-9]+(\.[0-9]+)?'

    # Extract and print monetary values from the input text file
    # grep -boP "$regex" "$page_001"
    # echo "$page_001"
    # grep -b -o -P "$regex" "$page_001" | awk -F ':' '{print "Line:", NR, "Column:", $1, "Position:", $2}'

    # windows 1252
    my_printf "Extrat money from utf-8"    
    script=$SCRIPTS_DIR"/awk/research/extract_money.awk"
    awk -f "$script" "$page_001" 

    
    my_printf "Extrat money from WINDOWS-1252"    
    script=$SCRIPTS_DIR"/awk/research/extract_money.awk"
    iconv -f UTF-8 -t WINDOWS-1252 "$page_001"  | awk -f "$script" 
 
fi