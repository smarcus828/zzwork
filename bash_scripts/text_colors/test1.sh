#!/bin/bash
#Black       0;30     Dark Gray     1;30
#Blue        0;34     Light Blue    1;34
#Green       0;32     Light Green   1;32
#Cyan        0;36     Light Cyan    1;36
#Red         0;31     Light Red     1;31
#Purple      0;35     Light Purple  1;35
#Brown       0;33     Yellow        1;33
#Light Gray  0;37     White         1;37

NORMAL="\e[1;49;0m"
GREEN="\e[1;49;32m"
RED="\e[1;49;31m"
BLUE="\e[1;49;34m"
CYAN="\e[1;49;36m"
PURPLE="\e[1;49;35m"
BROWN="\e[1;49;33m"
LTGRAY="\e[1;49;37m"
DKGRAY="\e[1;49;30m"
LTBLUE="\e[1;49;34m"
LTGREEN="\e[1;49;32m"
LTRED="\e[1;49;31m"
LTPURPLE="\e[1;49;35m"
YELLOW="\e[1;49;33m"
WHITE="\e[1;49;37m"


echo -e "${WHITE} WHITE ${GREEN} Green ${RED} RED ${BLUE} Blue ${NORMAL} are all colors"
