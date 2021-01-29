#! /bin/bash

# Este script te hace commit de tus últimos cambios en un repositorio y lo sube a GitHub
# Ejecuta el script desde cualquier directorio sólo introduciendo la ruta del repositorio

VAR1="y"
VAR2="n"
clear
read -p "$(printf "\e[32m¿Quieres hacer commit? [y/n] --> \e[m")" VAR
echo
if [[ "$VAR" == "$VAR1" ]]; then
	read -p "$(printf "\e[34mEscribe la dirección de la ruta donde quieres trabajar --> \e[m")" RUTA
	cd "$RUTA"
	echo
	if [[ -d .git ]]; then

		git status
		echo
		echo
		read -p "$(printf "\e[35m¿Quieres recordar tus últimos commits antes de seguir? [y/n] -->\e[m")" REMIND
		if [[ "$REMIND" == "$VAR1" ]]; then
			echo
			git log --oneline --graph
		elif [[ "$REMIND" != "$VAR1" ]]; then
			if [[ "$REMIND" != "$VAR2" ]]; then
				echo
				printf "\e[31mAsumo que has dicho que no\e[m\n"
			fi
		fi
		echo
		read -p "$(printf "\e[33m¿Qué nombre quieres darle al commit? --> \e[m")" COMMIT
		clear
		printf "\e[36mSe está subiendo...\e[m\n"
		echo
		git add * &> /dev/null && git commit -m "$COMMIT" &> /dev/null && git push -u origin master &> /dev/null
		git log --oneline --graph
		echo
		printf "\e[32mSe ha subido correctamente\e[m\n"
	else
		printf "\e[31mLa ruta introducida no es un repositorio de GitHub\e[m\n"
	fi
elif [[ "$VAR" != "$VAR1" ]]; then
	printf "\e[31mVuelve a ejecutar el script cuando lo necesites\e[m\n"
fi
