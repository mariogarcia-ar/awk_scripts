#!/bin/bash
# -----------------------------------------------------------------------------
# 12

if [ $run_step $comparison_operator 12 ]; then
    printf "${RED} Step 12 ${NC}\n"

    # -------------------------------------------------------------------------
    output_dir=$TMP_DIR"/fake_data_generator/"
    rm -rf "$output_dir"
    mkdir -p "$output_dir"


    # Date, Time, Timestamp, Number, Float, Boolean, IP Address, Email, URI, 
    # Credit Card, Phone Number, Zip Code, GUID, SKU, HTML, JSON, Serialized Data, 
    # Username, Password, Money, 

    # =========================================================================
    my_printf "Generate Fake Data"    
    script=$SCRIPTS_DIR"/python/generate_fake_data.py"

    python "$script" Date               101 -o "$output_dir/fake_Date.csv"
    python "$script" Time               102 -o "$output_dir/fake_Time.csv"
    python "$script" Timestamp          103 -o "$output_dir/fake_Timestamp.csv"
    python "$script" Email              104 -o "$output_dir/fake_Email.csv"
    python "$script" URI                105 -o "$output_dir/fake_URI.csv"
    python "$script" Money              106 -o "$output_dir/fake_Money.csv"
    python "$script" "Phone Number"     107 -o "$output_dir/fake_Phone_Number.csv"
    python "$script" "Credit Card"      108 -o "$output_dir/fake_Credit_Card.csv"
    


    # =========================================================================
    # python combine_csv_to_txt.py *.csv output_file.txt 5
    output_file=$TMP_DIR"/out_combine_csv_to_text.txt"

    my_printf "Combine CSV into TXT"    
    script=$SCRIPTS_DIR"/python/combine_csv_to_txt.py"
    python "$script" "$output_dir/*.csv" "$output_file"  10


    # =========================================================================
    output_data_extractor=$TMP_DIR"/out_data_extractor.csv"
    
    my_printf "Data Extractor"    
    script=$SCRIPTS_DIR"/awk/data_extractor.awk"
    gawk -f "$script" "$output_file" > "$output_data_extractor"
    echo "Data extractor: $output_data_extractor"
exit 1
    # -------------------------------------------------------------------------
    output_report=$TMP_DIR"/out_data_extractor_report.csv"

    my_printf "Report for Data Extractor"    
    script=$SCRIPTS_DIR"/awk/data_extractor_report.awk"
    awk -f "$script" "$output_data_extractor" > "$output_report"
    echo "Report Data extractor: $output_report"


    # =========================================================================
    output_data_extractor=$TMP_DIR"/CAT_out_data_extractor.csv"
    output_file=$TMP_DIR"/CAT_combine_csv_to_text.txt"

    cat "$TMP_DIR"/fake_data_generator/*.csv > "$output_file"

    my_printf "CAT Data Extractor"    
    script=$SCRIPTS_DIR"/awk/data_extractor.awk"
    gawk -f "$script" "$output_file" > "$output_data_extractor"
    echo "Data extractor: $output_data_extractor"

    # -------------------------------------------------------------------------
    output_report=$TMP_DIR"/CAT_out_data_extractor_report.csv"

    my_printf "Report for Data Extractor"    
    script=$SCRIPTS_DIR"/awk/data_extractor_report.awk"
    awk -f "$script" "$output_data_extractor" > "$output_report"
    echo "Report Data extractor: $output_report"   

fi