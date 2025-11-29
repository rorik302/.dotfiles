#!/usr/bin/env bash

SELECTION="$(printf "󰐥  Выключение\n󰑐  Перезагрузка\n󰈆  Выход" | vicinae dmenu -s "Действия")" || exit 0 

case $SELECTION in
	*"Выключение")
		systemctl poweroff;;
  *"Перезагрузка")
  systemctl reboot;;
  *"Выход")
    niri msg action quit;;
esac
