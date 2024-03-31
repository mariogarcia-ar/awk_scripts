#!/bin/bash
# -----------------------------------------------------------------------------
# 03

if [ $run_step $comparison_operator 03 ]; then
    printf "${RED} Step 03 ${NC}\n"

 # Survived,Pclass,Name,Sex,Age,Siblings/Spouses Aboard,Parents/Children Aboard,Fare

    my_printf "EDA Titanic"
    script="$ROOT_DIR/chap03/titanic_report_by_sex.awk"
    awk -F, -f "$script" "$DATA_DIR/titanic.csv" 

    script="$ROOT_DIR/chap03/titanic_report_by_class.awk"
    awk -F, -f "$script" "$DATA_DIR/titanic.csv" 

    script="$ROOT_DIR/chap03/titanic_report_by_survival.awk"
    awk -F, -f "$script" "$DATA_DIR/titanic.csv" 


    # awk -F, 'BEGIN { print "\nUnique Sex" } !x[$4]++ {print $4}' "$DATA_DIR/titanic.csv" 
    # awk -F, 'BEGIN { print "\nUnique Class" } !x[$2]++ {print $2}' "$DATA_DIR/titanic.csv" 

    # https://github.com/plotly/datasets/tree/master
    my_wget "https://raw.githubusercontent.com/plotly/datasets/master/beers.csv" "$TMP_DIR/beers.csv"

    my_printf "EDA Beer Ratings"
    # "","count.x","abv","ibu","id","beer","style","brewery_id","ounces","style2","count.y","brewery","city","state","label"

    # awk -F, ' NR > 1 { print $3 } ' "$TMP_DIR/beers.csv"
    
    my_printf "Max ABV"
    awk -F, ' NR > 1  && $3 ~ /[0-9.]/ && $3 > max { max = $3; maxpos = NR } END { print "Max ABV:", max, maxpos }' "$TMP_DIR/beers.csv"
    
    my_printf "ABV NaN"
    awk -F, ' NR > 1  && $3 !~ /[0-9.]/ { count++ } END { print "ABV NaN:", count }' "$TMP_DIR/beers.csv"
    
    my_printf "EDA beer, Style "
    awk -F, ' 
        NR > 1  {
            beers[$6]++; styles[$7]++;  
        } 
         
        END { 
            print "Types of beers:", length(beers)
            print "Types of styles:", length(styles)
            # for(beer in beers)
            #     print beer, beers[beer]

        }' "$TMP_DIR/beers.csv"     
fi