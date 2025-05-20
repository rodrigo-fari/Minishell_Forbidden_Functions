#!/bin/bash

# Cores ANSI
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BOLD="\033[1m"
BLINK="\033[5m"
RESET="\033[0m"

PROJECT_DIR="../src"
FORBIDDEN_FILE="testersrc"

# Verificação de existência do arquivo de funções proibidas
if [[ ! -f "$FORBIDDEN_FILE" ]]; then
	echo " "
	echo " "
	echo " "
	echo -e " ${RED}${BOLD}${BLINK}[ERRO]${RESET} Forbidden function list file not found: '$FORBIDDEN_FILE'"
	echo " "
	echo " "
	echo " "
	exit 1
fi

# Verificação da pasta do projeto
if [[ ! -d "$PROJECT_DIR" ]]; then
	echo " "
	echo " "
	echo " "
	echo -e " ${RED}${BOLD}${BLINK}[ERRO]${RESET} Project directory not found: '$PROJECT_DIR'"
	echo " "
	echo " "
	echo " "
	exit 1
fi

# Lê as funções proibidas para um array
mapfile -t FORBIDDEN_FUNCS < "$FORBIDDEN_FILE"
found=0

# Spinner com pontinhos
spinner=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')

# Esconde o cursor
tput civis
trap "tput cnorm; exit" INT

# Inicia o spinner
spin() {
    i=0
    while true; do
        printf "\r ${YELLOW}[WARNING]${RESET} Checking for forbidden functions in '$PROJECT_DIR'... %s" "${spinner[i]}"
        sleep 0.1
        ((i = (i + 1) % ${#spinner[@]}))
    done
}

# Inicia a animação
spin & SPIN_PID=$!

# Processo principal de verificação
find "$PROJECT_DIR" -type f -name "*.c" | while read -r file; do
	lineno=0
	while IFS= read -r line; do
		lineno=$((lineno + 1))
		for func in "${FORBIDDEN_FUNCS[@]}"; do
			if [[ "$line" =~ $func[[:space:]]*\( ]]; then
				# Pausa spinner para não interferir com a saída
				kill "$SPIN_PID" 2>/dev/null
				wait "$SPIN_PID" 2>/dev/null
				printf "\r"
				echo -e " ${RED}${BOLD}[ERRO]${RESET} Forbidden function '${func}' found in file '$file' at line $lineno:"
				echo "         $line"
				# Reinicia spinner
				spin & SPIN_PID=$!
				found=1
			fi
		done
	done < "$file"
done

# Finaliza animação
kill "$SPIN_PID" 2>/dev/null
wait "$SPIN_PID" 2>/dev/null
tput cnorm
printf "\r"

# Mensagem final
if [[ $found -eq 0 ]]; then
	echo -e " ${GREEN}[OK]${RESET} No forbidden functions found."
else
	echo -e " ${YELLOW}[WARNING]${RESET} Check completed. Forbidden functions were found."
fi