#!/usr/bin/env bash

#Compulsory argument
if [ "$#" == "0" ]; then
    echo "please enter a CMTP name" >> cmtp.log
    exit 1
else
    echo "$1"
fi

# Timeframe to store the CMTPs in

echo "Which time frame should CMTP be stored in? Enter 1, 2, 3, 4, 5 or 6. 
1) 0-1 Months
2) 1-3 Months
3) 3-12 Months
4) 12-24 Months
5) Optional
6) Exit "
read timeframe

case $timeframe in
    1) timeframe="0-1 Months";;
    2) timeframe="1-3 Months" ;;
    3) timeframe="3-12 Months";;
    4) timeframe="12-24 Months";;
    5) timeframe="Optional";;
    6) timeframe="Exit";;
    *) timeframe="Which time frame should CMTP be stored in? Enter 1, 2, 3, 4, 5 or 6. 
1) 0-1 Months
2) 1-3 Months 
3) 3-12 Months
4) 12-24 Months
5) Optional
6) Exit"
read timeframe;;
esac


if [[ "$timeframe" == "0-1 Months" || "$timeframe" == "1-3 Months"
|| "$timeframe" == "3-12 Months" || "$timeframe" == "12-24 Months" 
|| "$timeframe" == "optional" || "$timeframe" == "Exit" ]]; then
    echo "User selected an appropriate option" >> cmtp.log
else
    echo "User selected an option that is not listed" >> cmtp.log
fi


# Categorization of CMTP

echo "Select CMTP category T,C or F.
T) Technical
F) Finance
C) Consultancy
E) Exist "
read category

case $category in 
    T) category="Technical";;
    F) category="Finance";;
    C) category="Consultancy";;
    E) category="Exit";;
    *) category="Select CMTP category T,C or F.
T) Technical
F) Finance
C) Consultancy
E) Exist "
read category

esac


if [ "$category" == "Technical" ]; then
    echo " "$1" - (Technical)"
    echo "$1 - Technical is a new CMTP added" >> cmtp.log
elif [ "$category" == "Finance" ]; then
    echo " "$1" - (Finance)"
    echo "$1 - Finance is a new CMTP added" >> cmtp.log
elif [ "$category" == "Consulting" ]; then
    echo " "$1" - (Consulting)"
    echo "$1 - Finance is a new CMTP added" >> cmtp.log
elif [ "$category" == "Exit" ]; then
    exit 1
    echo "Exit option was selected" >> cmtp.log
else
    exit 1 
    echo "None of the options presented were selected" >> cmtp.log
fi


mkdir -p "$timeframe/$1 - ($category)"
touch "$timeframe/$1 - ($category)/studyNotes.docx"
touch "$timeframe/$1 - ($category)/testHistory.docx"
