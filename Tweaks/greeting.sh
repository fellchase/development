#!/bin/bash
HOUR=$(date +%H)
RED='\033[0;31m'
NC='\033[0m' # No Color

if (( "$HOUR" < 6 && "$HOUR" >= 0 ))
then
	printf '\e[31;40mGood night!\e[m\n'
elif (( "$HOUR" >= 6 && "$HOUR" < 12 ))
then
	printf '\e[31;40mGood morning!\e[m\n'
elif (( "$HOUR" >= 12 && "$HOUR" < 18 ))
then
	printf '\e[31;40mGood afternoon!\e[m\n'
elif (( "$HOUR" >= 18 && "$HOUR" < 24 ))
then
	printf '\e[31;40mGood evening!\e[m\n'
else
	echo "Hi there!"
fi
