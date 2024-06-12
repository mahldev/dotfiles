#!/bin/sh

#Informacion del sistema
 
kernel="$(uname -r)"
os="$(awk -F'"' '/PRETTY/ {print ($2)}' /etc/os-release)"
cpu="$(lscpu | awk '/Nombre/ {print $4, $5}')"
cpuinfo="$(lscpu | awk '/Nombre/ {print $6, $7, $8, $9}')"
name="${USER:-`id -nu`}@${HOSTNAME:-`hostname`}"
sys="$(echo $(uname) | awk '{print toupper($0)}')"
st=$(df -h / | awk '/dev/{print $3" / "$2}')
sh=$(df -h /home | awk '/dev/{print $3" / "$2}')
mem=$(free -m | awk '/^Mem:/ {print $3 "M / " $2 "M"}')
sw=$(swapon | awk '/dev/{print $4" / "$3}')
shell=$(printf "$(basename $SHELL)" | awk '{print ($0)}')
init=$(awk '{print ($0)}' /proc/1/comm)
pkg="$(xbps-query -l | wc -l)"
manager=$(which xbps-query 2>/dev/null) && manager=${manager##*/}
wm="$(awk 'END {print $2}' "$HOME"/.xinitrc)"
tr="$(printf "$TERM" | awk '{print ($0)}')"
uptime="$(uptime -p | sed 's/up //')"
iv="$(printf "$IMAGEVIEWER" | awk '{print($0)}')"
file="$(printf "$FILE" | awk '{print($0)}')"
ed="$(printf "$EDITOR" | awk '{print($0)}')"
br="$(printf "$BROWSER" | awk '{print($0)}')"
mn="$(printf "$MENU" | awk '{print($0)}')"


echo "
\033[1;36m\033[34mHost..........\033[00m ${name}                                
\033[1;36m\033[34mOs............\033[00m ${os}                                 
\033[1;36m\033[34mCpu...........\033[00m ${cpu}                  
\033[1;36m\033[34mCpu info......\033[00m ${cpuinfo}                  
\033[1;36m\033[34mWm............\033[00m ${wm}                                       
\033[1;36m\033[34mPackages......\033[00m ${pkg} (${manager})                                       
\033[1;36m\033[34mTerminal......\033[00m ${tr}                                       
\033[1;36m\033[34mKernel........\033[00m ${kernel}                         
\033[1;36m\033[34mShell.........\033[00m ${shell}                                       
\033[1;36m\033[34mInit..........\033[00m ${init}                              
\033[1;36m\033[34mRam used......\033[00m ${mem}                    
\033[1;36m\033[34mSwap used.....\033[00m ${sw}                    
\033[1;36m\033[34mStore root....\033[00m ${st}                    
\033[1;36m\033[34mStore home....\033[00m ${sh}                    
\033[1;36m\033[34mImagen Viewer.\033[00m ${iv} 
\033[1;36m\033[34mFile viewer...\033[00m ${file}
\033[1;36m\033[34mEditor........\033[00m ${ed}
\033[1;36m\033[34mBrowser.......\033[00m ${br}
\033[1;36m\033[34mMenu..........\033[00m ${mn}
\033[1;36m\033[34mUptime........\033[00m ${uptime}                
"
