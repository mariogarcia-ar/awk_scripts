#!/bin/bash
# -----------------------------------------------------------------------------
# 05

if [ $run_step $comparison_operator 05 ]; then
    printf "${RED} Step 05 ${NC}\n"


    mkdir -p /tmp/test/source

    my_printf "Touch files with report"
    script="$ROOT_DIR/chap100/create_file.awk"
    awk -F, -f "$script" "$DATA_DIR/file_list.csv"

    my_printf "Backup with repport"
    script="$ROOT_DIR/chap100/backup.awk"
    awk -F, -v toDir=$TMP_DIR -f "$script" "$DATA_DIR/file_list.csv"

    my_printf "File info with repport"
    script="$ROOT_DIR/chap100/get_file_info.awk"
    awk -F, -f "$script" "$DATA_DIR/file_list.csv"

    my_printf "Create md5"
    script="$ROOT_DIR/chap100/md5.awk"
    awk -F, -f "$script" "$DATA_DIR/file_list.csv"    
fi