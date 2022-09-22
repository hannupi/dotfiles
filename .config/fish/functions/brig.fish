function brig --wraps='brightnessctl set' --description 'alias brig brightnessctl set'
  brightnessctl set $argv; 
end
