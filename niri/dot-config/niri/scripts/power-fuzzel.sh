action=$(printf '%s\n' 'Lock' 'Suspend' 'Hibernate' 'Reboot' 'Poweroff' 'Logout' | fuzzel --dmenu -p 'System') && case "$action" in
  Lock) swaylock ;;
  Suspend) swaylock --daemonize && systemctl suspend ;;
  Hibernate) systemctl hibernate ;;
  Reboot) systemctl reboot ;;
  Poweroff) systemctl poweroff ;;
  Logout) niri msg action quit ;;
esac