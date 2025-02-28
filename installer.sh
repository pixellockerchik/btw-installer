#! /bin/bash
clear
# Начальный экран
while true;
do
	# При нажатии Enter мы переходим к выбору типа установки
	echo -e "Нажмите Enter чтобы продолжить.."
	read -n 1 -s  start
	if [ -z "$start" ]; then
		while true;
		do
			# Тут нам выводится меню с выбором типа установки
			clear
			echo -e "Выберите что бы хотите сделать: "
			echo -e "1) Полная установка "
			echo -e "2) Установка конфигов "
			echo -e "Q) Выход "
			read menu

			# Самая полная установка
			if [ "$menu" = "1" ]; then
				clear
				echo "Устанавливаем программы.. "
				sleep 1.
				# Скачивание bspwm sxhkd polybar alacritty feh jetbrains-mono-nerd
				sudo pacman -S --needed bspwm sxhkd polybar alacritty feh ttf-jetbrains-mono-nerd
				# Создание необходимых каталогов для файлов конфигурации
				mkdir -p .config/bspwm .config/sxhkd/ .config/alacritty .config/polybar .config/alacitty/themes/themes

				# Копирование файлов конфигурации
				cp ./config-files/bspwmrc ~/.config/bspwm/
				cp ./config-files/sxhkdrc ~/.config/sxhkd/
				cp ./config-files/config.ini ~/.config/polybar
				cp ./config-files/alacritty.toml ~/.config/alacritty
				cp -r ./config-files/themes ~/.config/alacritty

				# Делаем файлы исполняемыми
				echo -e "\nДелаем файлы исполняемыми.. "
				sleep 1.5
				sudo chmod +x ~/.config/bspwm/bspwmrc ~/.config/sxhkd/sxhkdrc
				echo -e "Готово!"
				exit


			# Установка скриптов для bspwmrc, sxhkdrc, polybar и alacritty
			elif [ "$menu" = "2" ]; then
				clear 
				echo -e "Копируем файла конфигураций.. "
				sleep 1
				cp ./config-files/bspwmrc ~/.config/bspwm/
				cp ./config-files/sxhkdrc ~/.config/sxhkd/
				cp ./config-files/config.ini ~/.config/polybar/
				cp ./config-files/alacritty.toml ~/.config/alacritty
				cp -r ./config-files/themes ~/.config/alacritty
				sudo chmod +x ~/.config/bspwm/bspwmrc ~/.config/sxhkd/sxhkdrc
				echo -e "Готово!"
				exit

			# Если мы хотим вернуться в прошлое меню
			elif [ "$menu" = "Q" ] || [ "$menu" = "q" ]; then
				clear
				break
			fi
		done
	# Если мы ввели Q или q то работа скрипта прекрашается
	elif [ "$start" = "Q" ] || [ "$start" = "q" ]; then
		clear
		echo "Bye!"
		sleep 1 && clear
		break
	fi
done
