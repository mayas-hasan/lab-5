#!/bin/bash

#Print an empty line for spacing
echo""

#Inform the user that sed is used to format lines
echo "Lines formatted with SED:"

#Use sed to add a motivational message after the word 'lesson(s)' in each line
sed 's/lesson(s)/lesson(s) - stay focused!/' "$output_file"

#an empty lin for spacing
echo ""

#Print a motivational message
echo "Good luck with your studi!"

echo ""

#Show the days that have more than two lessons (3 or more)
echo "Days with more than two lessons:"
grep -E "study [3-9]" "$output_file"

echo ""

#Show a summary using cut command
echo "Summary using cut command:"

#Extract only the day and lesson count columns from the file
cut -d":" -f1,3 "$output_file" | grep "Study"
