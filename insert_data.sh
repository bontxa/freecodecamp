#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat ./games.csv | while IFS="," read YEAR ROUND WINNER OPP WIN_G OPP_G
do
  if [[ $YEAR != 'year' ]]
  then
    #echo $WINNER $OPP
    #get team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ -z $TEAM_ID ]]
    then
      $PSQL "INSERT INTO teams(name) VALUES ('$WINNER')"
    fi
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP'")
    if [[ -z $TEAM_ID ]]
    then
      $PSQL "INSERT INTO teams(name) VALUES ('$OPP')"
    fi
  fi
done

cat ./games.csv | while IFS="," read YEAR ROUND WINNER OPP WIN_G OPP_G
do
  if [[ $YEAR != 'year' ]]
  then
    WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP'")
    $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
    VALUES ($YEAR, '$ROUND', $WIN_ID, $OPP_ID, $WIN_G, $OPP_G)"
  fi
done

