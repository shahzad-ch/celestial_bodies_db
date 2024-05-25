#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    # ADDING INTO TEAMS
    # Checking if team already exists
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    if [[ -z $TEAM_ID ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
      then 
        echo A team inserted, $WINNER
      fi
    fi
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    if [[ -z $TEAM_ID ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
      then
        echo A team is inserted, $OPPONENT
      fi
    fi

    # ADDING INTO GAMES
    WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    # Insert into games
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games ( year, round, winner_id, opponent_id, winner_goals, opponent_goals ) VALUES ($YEAR, '$ROUND', $WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_GAME_RESULT == 'INSERT 0 1' ]]
    then
      echo Inserted into games, $YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS
    fi
  fi
done