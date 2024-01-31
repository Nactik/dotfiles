#!/bin/sh

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#3949AB' 
# 3949AB deep blue
# 8B0063 pink
TEXT='#5C6BC0'
# 5C6BC0 deep blue
# CF0395 pink 
WRONG='#880000bb'
VERIFYING='#5C6BC0'
# 5C6BC0 deep blue
# CF0395 pinkm

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--screen 1                   \
--blur 5                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %d-%m-%Y"       \
# --keylayout 1                \ Langue du clavier
