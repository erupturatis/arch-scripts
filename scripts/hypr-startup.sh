# Pc large resolution monitor config


codeTestingEnv="google.com"
codeIndications="https://www.figma.com/file/1wjcZaKf1jLhoHF5dd5DZu/Navigo-%2F-designs?type=design&node-id=0-1&mode=design&t=Srr85w2IG1ZQBHil-0"

organize="notesnook.com"
AI="chat.openai.com"

spotify="spotify.com"
youtube="youtube.com"

hyprctl dispatch workspace 1 
hyprctl dispatch exec webstorm 
sleep 2

hyprctl dispatch workspace 2
sleep 0.5
hyprctl dispatch exec brave
sleep 0.5
hyprctl dispatch exec brave
sleep 2

hyprctl dispatch workspace 3  
sleep 0.5
hyprctl dispatch exec `brave --new-window "$AI"`
sleep 2

hyprctl dispatch workspace 4
sleep 0.5
hyprctl dispatch exec `brave --new-window "$organize"`

hyprctl dispatch workspace 5  
sleep 0.5	
hyprctl dispatch exec `brave --new-window "$youtube"`
#hyprctl dispatch exec `brave --new-window "$spotify"`
