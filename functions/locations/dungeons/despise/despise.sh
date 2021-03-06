#!/bin/bash
clear

source locations/dungeons/despise/despise-level2.sh
source spawns/monsters/earthelemental.sh
source spawns/monsters/lizardman.sh
source spawns/monsters/ettin.sh

function map1z0i {
clear
echo -e '
      _______________
 [\\033[1;36m+\\033[m] [Dungeon Despise] Entrance: [EEE]
   \\033[1;36m+--\\033[m] [ MOBS ]
   \\033[1;36m|\\033[m]  \\033[1;36m+--\\033[m] None
   \\033[1;36m+--\\033[m] [ INFO ]
     \\033[1;36m+--\\033[m] [EEE] Entrance
     \\033[1;36m+--\\033[m] [,,][;][:] Start or end of zone.
     \\033[1;36m+--\\033[m] [UU] [UP] stairwell or ladder.
     \\033[1;36m+--\\033[m] [DD] [DOWN] stairwell or ladder.

'
completed=1
pause
}

function map0i {
clear
echo -e "
      _______________
 [\033[1;36m+\033[m] [Dungeon Despise] Level: [1 Down]
   \033[1;36m+--\033[m] [ MOBS ]
   \033[1;36m|\033[m]  \033[1;36m+--\033[m] Lizardmen
   \033[1;36m|\033[m]  \033[1;36m+--\033[m] Ettin
   \033[1;36m|\033[m]  \033[1;36m+--\033[m] Earth Elemental
   \033[1;36m+--\033[m] [ INFO ]
     \033[1;36m+--\033[m] [Z#] Zones
     \033[1;36m+--\033[m] [OO] Player location.
     \033[1;36m+--\033[m] [,,][;][:] Start or end of zone.
     \033[1;36m+--\033[m] [UU] [UP] stairwell or ladder.
     \033[1;36m+--\033[m] [DD] [DOWN] stairwell or ladder.
"
completed=1
pause
}

function map0i {
clear
echo -e '
  _______  __       __    ____
 |     DD||  |     |  | _|    |
 |  _____||  |___  |  ||_[Z4]_|
 |  """"""   :  |__|  |__|   |
 |[Z5]_________    __  ____  \
 |  |"""""""""||  |  \ \___\  \
 | _|   ____  ||__|  _| ______|
 |_ ;__|    | | ____|   |______
 |,,|       | ||   _; [Z2]__   |
 |  |_      | \/ |  |   |__|  |
 |_   |____ |[Z3] | _|,,,______|
| ||_____  ||_____| |   |
| |___  _| |________|   |
|[Z6] ||   :        [Z1]|__
|  _  \/  |---|UU|---      |
|  ||_____|   |__|  |______|
|__|
      _______________
 [\\033[1;36m+\\033[m] [Dungeon Despise] Level: [1 Up]
   \\033[1;36m+--\\033[m] [ MOBS ]
   \\033[1;36m|\\033[m]  \\033[1;36m+--\\033[m] Lizardmen
   \\033[1;36m|\\033[m]  \\033[1;36m+--\\033[m] Ettin
   \\033[1;36m|\\033[m]  \\033[1;36m+--\\033[m] Earth Elemental
   \\033[1;36m+--\\033[m] [ INFO ]
     \\033[1;36m+--\\033[m] [Z#] Zones
     \\033[1;36m+--\\033[m] [OO] Player location.
     \\033[1;36m+--\\033[m] [,,][;][:] Start or end of zone.
     \\033[1;36m+--\\033[m] [UU] [UP] stairwell or ladder.
     \\033[1;36m+--\\033[m] [DD] [DOWN] stairwell or ladder.
'
completed=1
pause
}

#function map2z0 {
# clear
# echo " "
# echo -e " [\\033[1;33m-\\033[m]  A rock slide prevents any further traveling..."
# pause
#}

function map0z4 {
 clear
if [[ $completed = 0 ]]; then
 randomint=`randomgen`
 if [[ $randomint -le 70 ]]; then
  spawn.earthelemental
 else
  spawn.ettin
 fi
 combatstage
 map0z4

fi
 completed=0
 map0z4m
 select menusel in "Walk In Area" "Left" "Right" "Info" "Inventory" "Return to Entrance"; do
  case $menusel in
   "Walk In Area")
    map0z4 ;;
   "Left")
    map0z2 ;;
   "Right")
    map0z1 ;;
   "Info")
    map0i ;;
   "Inventory")
    player.paperdoll ;;
   "Return to Entrance")
    map0z4 ;;
   *)
    screwup
    map0z4 ;;
  esac
  break
done
 map0z4
}

function map0z3 {
 clear
if [[ $completed = 0 ]]; then
 randomint=`randomgen`
 if [[ $randomint -le 40 ]]; then
  spawn.ettin
 elif [[ $randomint -ge 160 ]]; then
  spawn.lizardman
 else
  spawn.earthelemental
 fi
 combatstage
 map0z3
fi
 completed=0
 map0z3m
 select menusel in "Walk In Area" "Up" "Right" "Info" "Inventory" "Return to Entrance"; do
  case $menusel in
   "Walk In Area")
    map0z3 ;;
   "Up")
    map0z2 ;;
   "Right")
    map0z0 ;;
   "Info")
    map0i ;;
   "Inventory")
    player.paperdoll ;;
   "Return to Entrance")
    map1z0 ;;
   *)
    screwup
    map0z3 ;;
  esac
  break
done
map0z3
}

function map0z2 {
 clear
if [[ $completed = 0 ]]; then
 randomint=`randomgen`
 if [[ $randomint -le 40 ]]; then
  spawn.earthelemental
 elif [[ $randomint -ge 180 ]]; then
  spawn.lizardman
 else
  spawn.ettin
 fi
 combatstage
 map0z2
fi
 completed=0
 map0z2m
 select menusel in "Walk In Area" "Upper-Right" "Right" "Lower-Right" "Down" "Info" "Inventory" "Return to Entrance"; do
  case $menusel in
   "Walk In Area")
    map0z2 ;;
   "Upper-Right")
    map0z4 ;;
   "Right")
    map0z1 ;;
   "Lower-Right")
    map0z0 ;;
   "Down")
    map0z3 ;;
   "Info")
    map0i ;;
   "Inventory")
    player.paperdoll ;;
   "Return to Entrance")
    map1z0 ;;
   *)
    screwup
    map0z2 ;;
  esac
  break
done
map0z2
}

function map0z1 {
 clear
if [[ $completed = 0 ]]; then
 randomint=`randomgen`
 if [[ $randomint -le 40 ]]; then
  spawn.lizardman
 elif [[ $randomint -ge 160 ]]; then
  spawn.ettin
 else
  spawn.earthelemental
 fi
 combatstage
 map0z1
fi
 completed=0
 map0z1m
 select menusel in "Walk In Area" "Left" "Up" "Down" "Info" "Inventory" "Return to Entrance"; do
  case $menusel in
   "Walk In Area")
    map0z1 ;;
   "Left")
    map0z3 ;;
   "Up")
    map0z4 ;;
   "Down")
     map0z0 ;;
   "Info")
    map0i ;;
   "Inventory")
    player.paperdoll ;;
   "Return to Entrance")
    map1z0 ;;
   *)
    screwup
    map0z1 ;;
  esac
  break
done
map0z1
}



function map0z0 {
 clear
if [[ $completed = 0 ]]; then
 randomint=`randomgen`
 if [[ $randomint -le 130 ]]; then
  spawn.lizardman
 elif [[ $randomint -ge 150 ]]; then
  spawn.ettin
 fi 
 combatstage
 map0z0
fi
 completed=0
 map0z0m
 select menusel in "Walk In Area" "Left" "Upper-Left" "Up" "Info" "Inventory" "Return to Entrance"; do
  case $menusel in
   "Walk In Area")
    map0z0 ;;
   "Left")
    map0z3 ;;
   "Upper-Left")
    map0z2 ;;
   "Up")
    map0z1 ;;
   "Info")
    map0i ;;
   "Inventory")
    player.paperdoll ;;
   "Return to Entrance")
    map1z0 ;;
   *)
    screwup
    map0z0 ;;
  esac
  break
done
map0z0
}



function map1z0 {
 randomint=`randomgen`
 clear
 echo " "
 map1z0m
 select menusel in "Upper Level" "Lower Level" "Info" "Inventory" "Return to Trammel"; do
  case $menusel in
   "Upper Level")
    map0z0 ;;
   "Lower Level")
    map2z0 ;;
   "Info")
    map1z0i ;;
   "Inventory")
    player.paperdoll ;;
   "Return to Trammel")
    britannia.graveyard ;;
   *)
    screwup
    map1z0 ;;
  esac
  break
 done
 map1z0
}
    
