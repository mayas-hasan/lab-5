#!/bin/bash

echo "Study Time Organizer"
#Maya Hassan Abualfaraj      445006876
read -p "Enter total number of lessons: " total_lessons
read -p "Enter number of remaining days: " remaining_days 

#Maya Hassan Abualfaraj      445006876
# Check if either input is not a positive integer using regex
if ! [[ "$total_lessons" =~ ^[0-9]+$ ]] || ! [[ "$remaining_days" =~ ^[0-9]+$ ]]; then
echo "please enter valid numbers only"       # Print error message for invalid input
exit 1         # Exit the script with an error code
fi


#Mayas Hassan Abualfaraj    445006876
# Check if the number of remaining days is zero to avoid division by zero
if [ "$remaining_days" -eq 0 ]; then
echo "Remaining days cannot be zero"    # Print warning if user enters 0 for remaining days
exit 1       # Exit the script to prevent further execution
fi
