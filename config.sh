#!/bin/bash

# -----------------------------------------------------------------------------
# constansts

ROOT_DIR="$(pwd)"
DATA_DIR=$ROOT_DIR/data
TMP_DIR=$ROOT_DIR/tmp
SCRIPTS_DIR=$ROOT_DIR/scripts

# ------------------------------------------------------------------
# colors
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux


# Define color variables
BLACK='\033[0;30m'
DARK_GRAY='\033[1;30m'
RED='\033[0;31m'
LIGHT_RED='\033[1;31m'
GREEN='\033[0;32m'
LIGHT_GREEN='\033[1;32m'
BROWN_ORANGE='\033[0;33m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
LIGHT_BLUE='\033[1;34m'
PURPLE='\033[0;35m'
LIGHT_PURPLE='\033[1;35m'
CYAN='\033[0;36m'
LIGHT_CYAN='\033[1;36m'
LIGHT_GRAY='\033[0;37m'
WHITE='\033[1;37m'

# Reset color
RESET='\033[0m'
NC='\033[0m' # No Color

