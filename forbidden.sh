#!/bin/bash

#                          Hey there! How you doing ?

#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ Quick tutorial ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#
# [1]PROJECT_DIR → Put the path to your project's source folder. If you already
# cloned on your source folder, you can leave it has it is.
#
# [2]EXTENSION → Put the file extension you want.
#
# [3]FORBIDDEN_FILE → You can edit this file to place all the things you want 
# to search on your project such as functions, keywords or whatever you want.
#
# [4] → Feel free to fork this small project! Any kind of help/improvement is
# welcome! Thank you! (pls leave a star on the repo *-*)
#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PROJECT_DIR="../"

EXTENSION=".c"

FORBIDDEN_FILE="testersrc"

#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ Script ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BOLD="\033[1m"
BLINK="\033[5m"
RESET="\033[0m"

cleanup() {
	tput cnorm
	echo
	echo -e "${RED}${BOLD}${BLINK} [CRITICAL] ${RESET}${RED}Script interrupted by user.${RESET}"
	exit 1
}

trap cleanup INT

if [[ ! -f "$FORBIDDEN_FILE" ]]; then
	echo
	echo
	echo
	echo -e " ${RED}${BOLD}${BLINK}[ERRO]${RESET} Forbidden function list file not found: '$FORBIDDEN_FILE'"
	echo
	echo
	echo
	exit 1
fi

if [[ ! -d "$PROJECT_DIR" ]]; then
	echo
	echo
	echo
	echo -e " ${RED}${BOLD}${BLINK}[ERRO]${RESET} Project directory not found: '$PROJECT_DIR'"
	echo
	echo
	echo
	exit 1
fi

mapfile -t FORBIDDEN_FUNCS < "$FORBIDDEN_FILE"
found_global=0
total_files=0
clean_files=0

tput civis

while IFS= read -r file; do
	total_files=$((total_files + 1))
	found_in_file=0
	lineno=0
	while IFS= read -r line; do
		lineno=$((lineno + 1))
		for func in "${FORBIDDEN_FUNCS[@]}"; do
			if [[ "$line" =~ [[:space:]]$func[[:space:]]*\( || "$line" =~ ^$func[[:space:]]*\( ]]; then
				echo -e " ${RED}${BOLD}[KO]${RESET} Found ${RED}${BOLD}${func}${RESET} at ${YELLOW}${BOLD}$file${RESET} [line: ${YELLOW}${BOLD}$lineno${RESET}]"
				printf "\n"
				found_in_file=1
				found_global=1
			fi
		done
	done < "$file"
	if [[ $found_in_file -eq 0 ]]; then
		clean_files=$((clean_files + 1))
		echo -e " ${GREEN}${BOLD}[OK] File $file"
		printf "\n"
	fi
done < <(find "$PROJECT_DIR" -type f -name "*$EXTENSION")

tput cnorm

if [[ $found_global -eq 0 ]]; then
	clear
	printf "\n\n\n"
	echo -e "\n${GREEN}${BOLD}[ALL DONE!]${RESET} No forbidden functions found in any file. ${BLINK}[${GREEN}${BOLD}${BLINK}$clean_files/$total_files${RESET}${BLINK}]${RESET}"
	printf "\n\n\n"
else
	echo -e "\n${YELLOW}${BOLD}${BLINK}[WARNING]${RESET} Check completed. Forbidden functions were found! [${YELLOW}${BOLD}$clean_files/$total_files${RESET}]\n"
fi
