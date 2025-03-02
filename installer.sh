#!/bin/bash

while true;
do
	start=$(whiptail --title "btw-installer" --menu "Что делать:" 10 35 2 \
		"1" "Продолжить установку" \
		"2" "О программе" \
		--ok-button "Enter" --cancel-button "Выход" \
		3>&1 1>&2 2>&3)
	# Возврашается 1 если пользователь нажимает кнопку "Выход" и программа закрывается
	if [ $? -eq 1 ]; then
		break
	fi
	case $start in
		1)
			{
				# Создаем директори для bspwm sxhkd polybar alacritty nvim
				mkdir -p ~/.config/bspwm ~/.config/sxhkd ~/.config/polybar ~/.config/alacritty ~/.config/nvim 
				sleep 0.5
				echo "15"
				# Bspwm
				cp ./config-files/bspwmrc ~/.config/bspwm
				sleep 1
				echo "23"
				# Shkd
				cp ./config-files/sxhkdrc ~/.config/sxhkd
				sleep 0.5
				echo "48"
				# Alacritty
				cp ./config-files/alacritty.toml ~/.config/alacritty
				sleep 0.5
				echo "60"
				# Polybar
				cp ./config-files/config.ini ~/.config/polybar
				sleep 0.5
				echo "76"
				# NeoVim
				cp ./config-files/init.vim ~/.config/nvim/
				sleep 0.5
				echo "100"
				sleep 1
				exit
			} | whiptail --title "btw-installer" --gauge "Идет установка файлов конфигурации.." 6 40 0
			whiptail --title "btw-installer" --msgbox --ok-button "Выход" "Установка завершена! Приятного пользования системой. " 7 46
			clear
			exit
			;;
		# Окно с текстом о скрипте
		2)
			whiptail --title "btw-installer" --msgbox "Это мой первый скрипт написанный для быстрой установки конфигурационных файлов bspwm sxhkd polybar nvim alacritty. Не думаю что кто-нибудь будет пользоваться этим скриптом помимо меня, поэтому список программ будет меняться только под мои нужды.



			Version 2.0 " 13 70 --ok-button "Назад"
			;;
	esac
done
