#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
MOVES=0
NUM=$(($RANDOM % 1000 + 1))
echo "Enter your username:"
read NAME

GET_USERNAME=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username = '$NAME'")
if [[ -z $GET_USERNAME ]]
then
  echo "Welcome, $NAME! It looks like this is your first time here."
else
  IFS="|"
  read USERNAME GAMES_PLAYED BEST_GAME <<< $GET_USERNAME
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
echo "Guess the secret number between 1 and 1000:"
read INPUT_NUM
while [[ $INPUT_NUM != $NUM ]]
do
  if ! [[ $INPUT_NUM =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:" 
    let "MOVES=MOVES+1"
  elif [[ $INPUT_NUM -gt $NUM ]]
  then
    echo "It's lower than that, guess again:"
    ((MOVES++))
  elif [[ $INPUT_NUM -lt $NUM ]]
  then
    echo "It's higher than that, guess again:"
    ((MOVES++))
  fi
  read INPUT_NUM
done
((MOVES++))
echo "You guessed it in $MOVES tries. The secret number was $NUM. Nice job!"
if [[ -z $GET_USERNAME ]]
then
  INSERT_USER=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES ('$NAME', 1, $MOVES)")
elif [[ $MOVES -lt $BEST_GAME ]]
then
  UPDATE_MOVES=$(psql --username=freecodecamp --dbname=number_guess -t --no-align -c "UPDATE users SET games_played = games_played + 1, best_game = $MOVES WHERE username = '$NAME'")
else
  UPDATE_GAMES=$(psql --username=freecodecamp --dbname=number_guess -t --no-align -c "UPDATE users SET games_played=games_played + 1 WHERE username='$NAME'")
fi
