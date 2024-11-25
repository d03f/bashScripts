#!/bin/bash
function lastBootLogs() {
	nLine=$(journalctl -u sshd | grep -n "^-- Boot.*" | tail -1 | cut -d ":" -f1)


	journalctl -u sshd | sed -n "${nLine},\$p"
}

function lastBootLogsAccept() {
	nLine=$(journalctl -u sshd | grep -n "^-- Boot.*" | tail -1 | cut -d ":" -f1)


	journalctl -u sshd | sed -n "${nLine},\$p" | grep "Accepted"
}

function lastBootLogsFailed() {
	nLine=$(journalctl -u sshd | grep -n "^-- Boot.*" | tail -1 | cut -d ":" -f1)


	journalctl -u sshd | sed -n "${nLine},\$p" | grep "Failed"
}


function secondMenu(){

	while true; do
	 
		clear
		echo "Last Boot Logs - d03f"
		echo
		echo "1. Show all logs"
		echo "2. Show Acepted logs"
		echo "3. Show Failed logs"
		echo "4. Exit"
		echo
		read -p "> " option

		  case $option in
		    1) lastBootLogs ; echo ; read  -p "Enter para salir" _  ;;
		    2) lastBootLogsAccept  ; echo ; read  -p "Enter para salir" _ ;;
		    3) lastBootLogsFailed  ; echo ; read  -p "Enter para salir" _ ;;
		    4) exit 0;;
		    *) echo "Invalid option" ;;
		  esac
		done
}


mainMenu


function mainMenu(){

	while true; do
	 
		clear
		echo "SSH LOGS - d03f"
		echo
		echo "1. Show all logs"
		echo "2. Show logs last boot"
		echo "3. Exit"
		echo
		read -p "> " option

		  case $option in
		    1) journalctl -u sshd; echo ; read -p "Enter para salir" _ ;;
		    2) secondMenu ;;
		    3) exit 0 ;;
		    *) echo "Invalid option" ;;
		  esac
		done
}


mainMenu
