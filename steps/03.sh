#!/bin/bash
# -----------------------------------------------------------------------------
# 03

# Check if the current step matches the specified condition
if [ $run_step $comparison_operator 03 ]; then
    # Print step indicator in red
    printf "${RED} Step 03 ${NC}\n"

    # Perform Exploratory Data Analysis (EDA) on the Titanic dataset
    my_printf "EDA Titanic"
    # Path to the script for reporting Titanic data by sex
    script="$SCRIPTS_DIR/awk/book/chap03/titanic_report_by_sex.awk"
    # Execute awk script with ',' as field separator
    awk -F, -f "$script" "$DATA_DIR/titanic.csv" 

    # Path to the script for reporting Titanic data by class
    script="$SCRIPTS_DIR/awk/book/chap03/titanic_report_by_class.awk"
    # Execute awk script with ',' as field separator
    awk -F, -f "$script" "$DATA_DIR/titanic.csv" 

    # Path to the script for reporting Titanic data by survival
    script="$SCRIPTS_DIR/awk/book/chap03/titanic_report_by_survival.awk"
    # Execute awk script with ',' as field separator
    awk -F, -f "$script" "$DATA_DIR/titanic.csv" 


    # Download the beers dataset
    my_wget "https://raw.githubusercontent.com/plotly/datasets/master/beers.csv" "$TMP_DIR/beers.csv"

    # Perform Exploratory Data Analysis (EDA) on the Beer Ratings dataset
    my_printf "EDA Beer Ratings"
    
    # Find the maximum ABV (Alcohol By Volume)
    my_printf "Max ABV"
    awk -F, ' NR > 1  && $3 ~ /[0-9.]/ && $3 > max { max = $3; maxpos = NR } END { print "Max ABV:", max, maxpos }' "$TMP_DIR/beers.csv"
    
    # Count the occurrences of NaN values in ABV (Alcohol By Volume)
    my_printf "ABV NaN"
    awk -F, ' NR > 1  && $3 !~ /[0-9.]/ { count++ } END { print "ABV NaN:", count }' "$TMP_DIR/beers.csv"
    
    # Perform Exploratory Data Analysis (EDA) on the beer styles
    my_printf "EDA beer, Style "
    awk -F, ' 
        NR > 1  {
            beers[$6]++; styles[$7]++;  
        } 
         
        END { 
            print "Types of beers:", length(beers)
            print "Types of styles:", length(styles)
        }' "$TMP_DIR/beers.csv"     
fi
