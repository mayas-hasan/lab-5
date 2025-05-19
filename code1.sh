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


lessons_per_day=$((total_lessons / remaining_days))
extra_lessons=$((total_lessons % remaining_days)) 


output_file="study_plan.txt" 

echo "Study plan for $total_lessons lessons over $remaining_days days" > "$output_file"
awk -v total="$total_lessons" -v days="$remaining_days" 'BEGIN{print "Average lessons per day: " total / days }'>> "$output_file"

for (( day=1; day<=remaining_days; day++ )); do
if [ $day -le "$extra_lessons" ]; then
lessons=$((lessons_per_day + 1))
else 
lessons=$lessons_per_day
fi
echo "Day $day: --> Study $lessons lesson(s)"
echo "Day $day: --> Study $lessons lessons(s)" >> "$output_file"
done 
echo ""
echo "Lines formatted with SED:"
sed 's/lesson(s)/lesson(s) - stay focused!/' "$output_file"
echo "good luck with your study!"
echo "Days with more than two lessons:"
grep -E "Study [3-9]" "$output_file"
 
echo ""
echo "summary using cut command:"
cut -d":" -f1,3 "$output_file" | grep "Study"

