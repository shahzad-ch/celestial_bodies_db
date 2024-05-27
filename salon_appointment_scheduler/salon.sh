#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n\n~~~~~ NextCare Salon ~~~~~\n\n"
MAIN_MENU() {

    if [[ $1 ]]
    then
      echo -e "\n$1\n"
    fi

    echo -e "How may I help you?\n"

    SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
    echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
    do 
      echo "$SERVICE_ID) $SERVICE_NAME"
    done
    echo -e "\nPress 0 to exit"

    read SERVICE_ID_SELECTED

    NUMBER_OF_SERVICES=$($PSQL "SELECT COUNT(*) FROM services")

    if [[  ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ || $SERVICE_ID_SELECTED -gt $NUMBER_OF_SERVICES ]]
    then 
    MAIN_MENU "Please enter a valid service number."
    elif [[ $SERVICE_ID_SELECTED == 0 ]]
    then
    EXIT
    fi
    # get service name
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    # get phone
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    # check if customer exists
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    # if not found
    if [[ -z $CUSTOMER_NAME ]] 
    then
      # get name
      echo -e "\nWhat's your name?"
      read CUSTOMER_NAME
      # insert customer data
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    echo -e "\nWhen do you want to book your appointment?"
    read SERVICE_TIME
    # get customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    INSERT_SERVCE_TIME_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME' )")
    
    echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -E 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')."
    exit 0
}

EXIT() {
  echo -e "\nThank you for stopping in.\n"
  exit 0
}
MAIN_MENU