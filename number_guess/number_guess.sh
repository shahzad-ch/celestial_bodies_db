#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=games -t --no-align -c"

echo -e "\n\n~~~ Number Guessing Game ~~~\n\n"

RANDOM_NUMBER=$(($RANDOM % 1001))

#echo $RANDOM_NUMBER

echo Enter your username:
read USERNAME
# CHECK IF USERNAME EXISTS IN THE DATABASE
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
if [[ -z $USER_ID ]]
then
  INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  GET_USER_DATA=$($PSQL "SELECT COUNT(*), MIN(tries) FROM games INNER JOIN users USING (user_id) WHERE username='$USERNAME'")
  IFS="|" read -r GAMES_PLAYED BEST_GAME <<< $GET_USER_DATA
    
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

TRIES=0

echo -e "\nGuess the secret number between 1 and 1000:"
read USER_GUESS

((TRIES++))

while [[ $USER_GUESS != $RANDOM_NUMBER ]]
do
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    read USER_GUESS
  elif [[ $USER_GUESS -gt $RANDOM_NUMBER ]]
  then
    echo -e "\nIt's lower than that, guess again:"
    read USER_GUESS
  else
    echo -e "\nIt's higher than that, guess again:"
    read USER_GUESS
  fi
  ((TRIES++))
done

INSERT_GAME=$($PSQL "INSERT INTO games ( tries, user_id ) VALUES ($TRIES, $USER_ID)")

echo -e "\nYou guessed it in $TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!\n"
