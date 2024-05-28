#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only --no-align -c"

EXIT() {
  if [[ -z $GET_DATA ]]
  then
    echo I could not find that element in the database.
  else
    echo "$GET_DATA" | while IFS="|" read AN N S AM MP BP T
    do
      echo "The element with atomic number $AN is $N ($S). It's a $T, with a mass of $AM amu. $N has a melting point of $MP celsius and a boiling point of $BP celsius".
    done
  fi
}

if [[ $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    GET_DATA=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
    EXIT
  else 
    GET_DATA=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1' OR name='$1'")
    EXIT
  fi
else 
  echo Please provide an element as an argument.
fi

