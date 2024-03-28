#!/bin/bash

# bash run.sh only 1

# ------------------------------------------------------------------
# colors
RED='\033[0;31m'
NC='\033[0m' # No Color
                        
# -----------------------------------------------------------------------------
# constansts

# ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ROOT_DIR="$(pwd)"
DATA_DIR=$ROOT_DIR/data

# -----------------------------------------------------------------------------
# menu
direction="$1"
run_step="$2"

if [ -z "$run_step" ] || [ -z "$direction" ]; then
    echo "Usage: $0 <since/until/only> <run_step>" 
    exit 1
fi

if [ "$direction" == "since" ]; then
    comparison_operator="-le"
elif [ "$direction" == "until" ]; then
    comparison_operator="-ge"
elif [ "$direction" == "only" ]; then
    comparison_operator="-eq"
else
    echo "Invalid direction. Please specify 'since', 'until', or 'only'."
    exit 1
fi 

# if [ $run_step $comparison_operator 2 ]; then
# fi  


# -----------------------------------------------------------------------------
# 01

if [ $run_step $comparison_operator 1 ]; then
    printf "${RED} Step 01 ${NC}\n"
    # cat "$DATA_DIR/emp.data"
    awk '$3 > 0 { print $1, $2, $3, $2 * $3 }' "$DATA_DIR/emp.data"
fi  


# -----------------------------------------------------------------------------
# 02

if [ $run_step $comparison_operator 2 ]; then
    printf "${RED} Step 02 ${NC}\n"
fi  


# -----------------------------------------------------------------------------
# 03

if [ $run_step $comparison_operator 3 ]; then
    printf "${RED} Step 03 ${NC}\n"
fi  

