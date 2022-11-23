#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n-Welcome to Melon Salon-\n"

MAIN_MENU(){
SERVICES=$($PSQL "select service_id, name from services order by service_id")
echo -e "\nHere are our services:"
echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
  echo "$SERVICE_ID) $NAME"
  done

echo -e "\nWhich services would you like? Choose by typing a number (type 6 to exit)"
read SERVICE_ID_SELECTED

case $SERVICE_ID_SELECTED in
1) HAIRCUT ;;
2) WASH ;;
3) BLOW_DRY;;
4) CURLS ;;
5) COLORING ;;
6) EXIT ;;
*) MAIN_MENU "Sorry we don't have your selected services. Please pick a valid option." ;;
esac
}

HAIRCUT(){
  SERVICE=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")
  echo -e "\nThis is the $SERVICE service. Please enter your phone number:"
read CUSTOMER_PHONE

CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
 echo -e "\nWe don't have your name yet. Enter your name please:"
 read CUSTOMER_NAME
 
 INSERT_CUSTOMER_NAME=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
fi

echo -e "\nHi $CUSTOMER_NAME, please write your time of reservation (e.g. 10.30 am):"
read SERVICE_TIME

CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
APPOINTMENT=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
}

WASH(){
  SERVICE=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")
  echo -e "\nThis is the $SERVICE service. Please enter your phone number:"
read CUSTOMER_PHONE

CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
 echo -e "\nWe don't have your name yet. Enter your name please:"
 read CUSTOMER_NAME
 
 INSERT_CUSTOMER_NAME=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
fi

echo -e "\nHi $CUSTOMER_NAME, please write your time of reservation (e.g. 10.30 am):"
read SERVICE_TIME

CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
APPOINTMENT=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
}

BLOW_DRY(){
  SERVICE=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")
  echo -e "\nThis is the $SERVICE service. Please enter your phone number:"
read CUSTOMER_PHONE

CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
 echo -e "\nWe don't have your name yet. Enter your name please:"
 read CUSTOMER_NAME
 
 INSERT_CUSTOMER_NAME=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
fi

echo -e "\nHi $CUSTOMER_NAME, please write your time of reservation (e.g. 10.30 am):"
read SERVICE_TIME

CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
APPOINTMENT=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
}

CURLS(){
  SERVICE=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")
  echo -e "\nThis is the $SERVICE service. Please enter your phone number:"
read CUSTOMER_PHONE

CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
 echo -e "\nWe don't have your name yet. Enter your name please:"
 read CUSTOMER_NAME
 
 INSERT_CUSTOMER_NAME=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
fi

echo -e "\nHi $CUSTOMER_NAME, please write your time of reservation (e.g. 10.30 am):"
read SERVICE_TIME

CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
APPOINTMENT=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
}

COLORING(){
  SERVICE=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")
  echo -e "\nThis is the $SERVICE service. Please enter your phone number:"
read CUSTOMER_PHONE

CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
 echo -e "\nWe don't have your name yet. Enter your name please:"
 read CUSTOMER_NAME
 
 INSERT_CUSTOMER_NAME=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
fi

echo -e "\nHi $CUSTOMER_NAME, please write your time of reservation (e.g. 10.30 am):"
read SERVICE_TIME

CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
APPOINTMENT=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
}

EXIT(){
  echo -e "\nThank you for stopping by. Hope to see you again in the near future.\n"
}

MAIN_MENU