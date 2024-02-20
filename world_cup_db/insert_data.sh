#!/bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
    if [[ $WINNER == "winner" ]]
    then
      continue
    fi

    # Check if given team is already exist
    TEAM_ID=$($PSQL "SELECT team_id from teams WHERE name='$WINNER'")

    # If not found
    if [[ -z $TEAM_ID ]]
    then
      # Insert team
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) values('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
          echo Inserted into team, $WINNER
      fi
    fi

    # Check if the team is already exist
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # If not found
    if [[ -z $TEAM_ID ]]
    then
      # Insert team
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) values('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
          echo Inserted into team, $OPPONENT
      fi
    fi

    # Find out the team id of given winner and opponent
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    
    # Insert game
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into game
    fi
done
