#!/bin/bash
# -----------------------------------------------------------------------------
# 05

# Check if the current step matches the specified condition
if [ $run_step $comparison_operator 05 ]; then
    # Print step indicator in red
    printf "${RED} Step 05 ${NC}\n"

    # Create a directory for testing purposes
    mkdir -p /tmp/test/source

    # Touch files with report
    my_printf "Touch files with report"
    # Path to the script for creating files
    script="$ROOT_DIR/chap100/create_file.awk"
    # Execute awk script with ',' as field separator
    awk -F, -f "$script" "$DATA_DIR/file_list.csv"

    # Backup files with report
    my_printf "Backup with report"
    # Path to the script for backing up files
    script="$ROOT_DIR/chap100/backup.awk"
    # Execute awk script with ',' as field separator and provide destination directory
    awk -F, -v toDir=$TMP_DIR -f "$script" "$DATA_DIR/file_list.csv"

    # Get file information with report
    my_printf "File info with report"
    # Path to the script for getting file information
    script="$ROOT_DIR/chap100/get_file_info.awk"
    # Execute awk script with ',' as field separator
    awk -F, -f "$script" "$DATA_DIR/file_list.csv"

    # Create md5 checksums with report
    my_printf "Create md5"
    # Path to the script for creating md5 checksums
    script="$ROOT_DIR/chap100/md5.awk"
    # Execute awk script with ',' as field separator
    awk -F, -f "$script" "$DATA_DIR/file_list.csv"    
fi
