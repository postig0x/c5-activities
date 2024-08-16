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
    "\n\nYou dig deeper into the secret plan, uncovering a vast conspiracy that goes all the way to the top. The information you find is both exhilarating and terrifying."
    "\n\nYou make contact with the resistance and are welcomed into their ranks. You're given a codename and begin training for your first mission."
    "\n\nYou journey to the coordinates and discover a hidden entrance. Inside, you find a bustling underground city filled with rebels and advanced technology."
    "\n\nYou engage in a fierce battle with the IID agents. Your combat training pays off, and you manage to subdue them and escape."
    "\n\nYou gather the resistance leaders and start planning a daring assault on the government's main control center. The stakes are high, but the potential payoff is even higher."
    "\n\nYou stand your ground and fight alongside your fellow rebels. The battle is intense, but your determination gives you strength."
    "\n\nYou choose to continue the fight, knowing that true freedom is worth any sacrifice. Your experiences have made you a valuable asset to the resistance."
)

# list of responses if (b)
bs=(
    "\n\nYou report the message to the authorities. They thank you for your loyalty and ask you to keep an eye out for more suspicious activity."
    "\n\nYou delete the message and try to forget about it. However, you can't shake the feeling that you've missed an important opportunity."
    "\n\nYou delete the message, deciding it's safer not to get involved. You go about your daily life, but the thought of what might have been lingers."
    "\n\nYou surrender to the IID. They take you in for questioning, and you spend the next few hours in a stark interrogation room."
    "\n\nYou decide to lay low and gather resources. Over the next few weeks, you stockpile supplies and make valuable connections within the underground network."
    "\n\nYou choose to escape, using your knowledge of the city's layout to evade capture. You disappear into the shadows, leaving the battle behind."
    "\n\nYou decide to retire from the resistance and seek a peaceful life. You find a quiet corner of the world and try to put your past behind you, always looking over your shoulder."
)

# final outcome responses
zs=(
    "\n\nYour tireless efforts and sacrifices have paid off. The resistance movement, under your leadership, successfully overthrows the oppressive government. A new era of freedom and equality dawns for all citizens. You're hailed as a hero and play a key role in shaping the new, just society."
    "\n\nThe conflict between the resistance and the government reaches a stalemate. While you've managed to carve out some autonomy for a portion of the population, the larger power structure remains intact. Life continues with a mix of newfound freedoms and lingering oppression, leaving you with a sense of incomplete victory."
    "\n\nDespite your best efforts, the government crushes the resistance movement. You're captured and sentenced to life in a high-security prison. As you languish in your cell, you wonder if your actions made any difference at all, or if you've only made things worse for those you tried to help."
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
    dim=$(shuf -i 0-2 -n 1)
    context="${zs[$dim]}"
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
echo -e "\n\nGoodbye $NAME"

