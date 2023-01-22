#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi
ALL_ELEM=$($PSQL "SELECT * FROM elements FULL JOIN properties USING (atomic_number)")
echo "$ALL_ELEM" | while IFS="|" read AT_NUM SYMBOL NAME TYPE AT_MASS MELT BOIL TYPE_ID
do
  if [[ $1 == $AT_NUM ]] || [[ $1 == $SYMBOL ]] || [[ $1 == $NAME ]]
  then
    echo "The element with atomic number $AT_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $AT_MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
    exit 1
  fi
done
[ $? == 1 ] && exit
echo I could not find that element in the database.
