#!/bin/bash 

release_file=/etc/os-release

if grep -q "Arch" $release_file
then 
	sudo pacman -Syu
fi

if grep -q "kali" $release_file || grep -q "Upuntu" $release_file 
then 
	sudo apt update 
	sudo apt upgrade
fi 
