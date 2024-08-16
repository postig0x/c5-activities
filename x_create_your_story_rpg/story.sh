#!/bin/bash

# Create Your Own Adventure Story
# 08.15.24

# formalities
echo -n "What is your name? "
read NAME
echo -e "\nHello $NAME\n"

# text to set the context of the game at the intro, and variable to display end scene
context="In a dystopian future, you are a hacker fighting against an oppressive regime. Your only weapon is your powerful laptop.\nOne day, you receive a mysterious message...\n"

# list of possible paths
paths=(
  "\nThe message reveals a secret plan to overthrow the government. Do you want to:\n(a) investigate further OR (b) report it to the authorities? "
  "\nThe message contains information about a hidden resistance movement. Do you want to:\n(a) join them OR (b) ignore it? "
  "\nThe message gives you coordinates to a secret underground base. Do you want to:\n(a) investigate OR (b) delete the message? "
  "\nYou are caught by the IID (Internal Internet Department) while investigating. Do you want to:\n(a) fight OR (b) surrender? "
  "\nYou successfully destroyed your ops and and joined the resistance movement. Do you want to:\n(a) plan a rebellion OR (b) lay low and gather resources? "
  "\nYou are cornered by the IID during a rebellion. Do you want to:\n(a) fight OR (b) escape? "
  "\nYou successfully escape the IID and live to fight another day. Do you want to:\n(a) continue fighting OR (b) retire and live a peaceful life? "
)

# list of choices
choices=(
  "a b"
  "a b"
  "a b"
  "a b"
  "a b"
  "a b"
  "a b"
)

# list of responses if (a)
as=(
  "\n\nYou uncover more information about the government's weaknesses and plan a successful rebellion. Congratulations, you have saved the world!"
  "\n\nYou are hailed as a hero by the resistance movement and become a leader in the fight against the oppressive regime. Good Luck!"
  "\n\nYou find the secret underground base abandoned, but you discover valuable resources that help you in your fight against the government. Keep going!"
  "\n\nYou are sentenced to life in prison, but your actions inspire others to join the resistance. The fight continues without you, but you have made a difference."
  "\n\nYou become a valuable member of the resistance movement and help plan many successful rebellions. The government is weakened and eventually overthrown. Well done!"
  "\n\nYou manage to escape, but the rebellion fails. You go into hiding and plan your next move. The fight is not over yet."
  "\n\nYou retire and live a peaceful life, but you can't help but feel guilty for not continuing the fight. The world is still in the hands of the oppressive regime, but you have earned your rest."
)

# list of responses if (b)
bs=(
  "\n\nB You uncover more information about the government's weaknesses and plan a successful rebellion. Congratulations, you have saved the world!"
  "\n\nB You are hailed as a hero by the resistance movement and become a leader in the fight against the oppressive regime. Good Luck!"
  "\n\nB You find the secret underground base abandoned, but you discover valuable resources that help you in your fight against the government. Keep going!"
  "\n\nB You are sentenced to life in prison, but your actions inspire others to join the resistance. The fight continues without you, but you have made a difference."
  "\n\nB You become a valuable member of the resistance movement and help plan many successful rebellions. The government is weakened and eventually overthrown. Well done!"
  "\n\nB You manage to escape, but the rebellion fails. You go into hiding and plan your next move. The fight is not over yet."
  "\n\nB You retire and live a peaceful life, but you can't help but feel guilty for not continuing the fight. The world is still in the hands of the oppressive regime, but you have earned your rest."
)

zs=(
  "1"
  "2"
  "3"
)

# init end signal
end=0
length=${#paths[@]}

# show intro
echo -e "$context"

# until loop
# (( ... )) makes arithmetic comparisons
until [[ $end == -1 ]]
do
  if [[ $end == 7 ]]
  then
    context="ending number: ${zs[1]}"
    let end=-1
    continue
  fi

  echo -e "${paths[$end]}"
  read -n 1 choice
  case "$choice" in
    "a")
      echo -e "${as[$end]}"
      let end+=1
      ;;
    "b")
      echo -e "${bs[$end]}"
      let end+=1
      ;;
    "q")
      echo -e "\n\nGoodbye $NAME"
      exit 0
      ;;
    *)
      echo "Please try again"
      continue
      ;;
  esac
done

echo -e "$context"

