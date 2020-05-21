#!/usr/bin/env bash
data_file="/Users/swasuman/Anmol/data_correction"
email_file="/Users/swasuman/Anmol/anniversary.email"
today_month=$(date +%b)
echo "current_month="$today_month
today_day=$(date +%d)
echo "current_date="$today_day
today_date="$today_month,$today_day"
echo "today's date="$today_date
all_friends="$(grep $today_date $data_file)"
echo "Logging matched data="$all_friends

for friend in $all_friends
do
email_addr=$(echo $friend | cut -d, -f5)
echo "will log email addr="$email_addr
if [ -z $email_addr ]; then
continue
fi
first_name=$(echo $friend|cut -d, -f 1)
echo "first_name="$first_name
last_name=$(echo $friend|cut -d, -f 2)
echo "last_name="$last_name
full_name="$first_name $last_name"
echo "logging full name="$full_name

sed "s/_:/$full_name/g" $email_file| mailx -s "Happy Anniversary : $full_name" -c "anmol.is18@bmsce.ac.in" $email_addr

done
exit 0

