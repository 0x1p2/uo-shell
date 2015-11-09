#!/bin/bash

function skillgain.meditation {
 if [[ $player_skill_meditation_status == "ulocked" ]]; then
  player_skill_total=$[ $player_skill_meditation + 0 ]
  randomint=`randomgen`
  if [[ $player_skill_total -le 30 ]]; then
   player_skill_chance=60
  elif [[ $player_skill_total -gt 30 && $player_skill_total -le 40 ]]; then
   player_skill_chance=40
  elif [[ $player_skill_total -gt 40 && $player_skill_total -le 50 ]]; then
   player_skill_chance=20
  elif [[ $player_skill_total -gt 50 && $player_skill_total -le 60 ]]; then
   player_skill_chance=8
  elif [[ $player_skill_total -gt 60 && $player_skill_total -le 70 ]]; then
   player_skill_chance=6
  elif [[ $player_skill_total -gt 70 && $player_skill_total -le 80 ]]; then
   player_skill_chance=4
  elif [[ $player_skill_total -gt 80 && $player_skill_total -lt 90 ]]; then
   player_skill_chance=2
  else
   player_skill_chance=1
  fi
 skillgaincontrol
 fi
}


function skillgaincontrol {
 if [[ $randomint -le $player_skill_chance ]]; then
  player_skill_meditation=$[ $player_skill_meditation + 1 ]
  echo -e " [\033[1;36m+\033[m]  \033[1;33mYou gained [\033[1;36m+1\033[m\033[1;33m] to \033[1;34mMeditation\033[m \033[1;33m[\033[m\033[1;36m$player_skill_meditation\033[m\033[1;33m]\033[m"
  if [[ $player_skill_meditation -ge 120 ]]; then
   player_skill_meditation=120
   player_skill_meditation_status=locked
  fi
 fi
}
