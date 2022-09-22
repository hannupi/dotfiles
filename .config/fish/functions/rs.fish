function rs --wraps='systemctl reboot' --description 'alias rs systemctl reboot'
  systemctl reboot $argv; 
end
