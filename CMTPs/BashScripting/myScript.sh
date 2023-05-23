#!/usr/bin/env bash

#create a log file called cmtp.log in the CMTPs directory.

touch cmtp.log

#output raw data

data=$(<rawText.txt)

#format the data so that there is one line per entry

format1=${data//$'*'/$'\n'} #Issues with tab key on the raw
#text file once converted to gitHub, tabs on the raw text file
#were converted to *. If tab key worked the line of code
#would look like this >>> format1=${data//$'\t'/$'\n'}

#format data to have no abbreviation
format2=${format1//$'(T)'/$'(Technical)'}
format3=${format2//$'(F)'/$'(Finance)'}
format4=${format3//$'(C)'/$'(Consultancy)'}

#create directories for each time frame and sub directories for each cmtp

echo "$format4" > formattedRawText.txt


while read line; do
if [[ $line =~ ^[0-9] || $line = "Optional" ]]; then
        mkdir -p "$line"
        directory="$line"
else
        mkdir -p "$directory/$line"
        touch "$directory/$line/studyNotes.docx"
        touch "$directory/$line/testHistory.docx"

fi

done<formattedRawText.txt


#log timestamp for each directory

while read line; do
        datestamp=$(date +%Y%m%d)
        timestamp=$(date +%T)
        echo "$line" ": Created on $datestamp at $timestamp"
done<formattedRawText.txt>cmtp.log
