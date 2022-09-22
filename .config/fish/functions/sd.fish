function sd --wraps='systemctl shutdown 0' --wraps='systemctl shut down 0' --wraps='systemctl poweroff 0' --wraps='systemctl poweroff -n now' --wraps='systemctl poweroff -n' --wraps='systemctl poweroff' --description 'alias sd systemctl poweroff'
  systemctl poweroff $argv; 
end
