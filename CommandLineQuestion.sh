{\rtf1\ansi\ansicpg1252\cocoartf2580
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 .AppleSystemUIFontMonospaced-Regular;\f1\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red91\green100\blue110;\red255\green255\blue255;}
{\*\expandedcolortbl;;\cssrgb\c43137\c46667\c50588;\cssrgb\c100000\c100000\c100000;}
\paperw11900\paperh16840\margl1440\margr1440\vieww28540\viewh14800\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 #!/bin/bash
\f1 \cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 #READING FILE AND PREPROCESSING__________________________________________\
\
#import and show dataset with 3 columns: \'93placeAddress\'94, \'93numPeopleWant\'94\
cat cl_dataset.tsv\
\
#select first column "placeAddress"\
awk -F"\\t" '\{print $1\}' cl_dataset.tsv > address\
\
#For each line, look for country name in address string and then return just \
#country name if in the list of the countries we are interested in, otherwise return "other"\
#save everything in variable "address_cleaned"\
while IFS= read -r line; do\
if [[ $line == *"United States"* ]];\
then\
    echo "United-States"\
elif [[ $line == *"France"* ]];\
then\
    echo "France       "\
elif [[ $line == *"Italy"* ]];\
then\
    echo "Italy        "\
elif [[ $line == *"Spain"* ]];\
then\
    echo "Spain        "\
elif [[ $line == *"England"* ]];\
then\
    echo "England      "\
else\
    echo "other        "\
fi\
done < address > address_cleaned\
\
#rename column from "other" to "Location" and save it in variable "address_cleaned_renamed"\
cut -f1 address_cleaned | sed '1\{ s/other/Location/; \}' > address_cleaned_renamed \
\
#drop first column "placeAddress". File with columns 2 and 3 (numPeopleVisited and \
#numPeopleWant) is saved in variable "dataset_no_address"\
cut -f2,3 cl_dataset.tsv > dataset_no_address\
\
#Append column \'93address_cleaned_renamed\'94 to \'93dataset_no_address\'94\
paste address_cleaned_renamed dataset_no_address > definitive_dataset\
\
#drop rows that have "other" as value in the "Location" column. The resulting dataset is saved in \
#variable "dataset_EFISU", where "EFISU" are just the initials of the countries we are interested in.\
while IFS= read -r line; do\
if [[ $line != *"other"* ]];\
then\
    echo "$line"\
fi\
done < definitive_dataset > dataset_EFISU\
\
#QUESTION i.________________________________________________________________\
#How many places can be found in each country?\
bold=$(tput bold)\
normal=$(tput sgr0)\
echo "$\{bold\}Number of places which can be found in each country:"\
echo "$\{normal\}|Num.|  Country   |"\
echo "-------------------"\
cut -f 1 dataset_EFISU | sort | uniq -c\
echo "-------------------"\
\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 #QUESTION ii.________________________________________________________________\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 \
#How many people, on average, have visited the places in each country?\
bold=$(tput bold)\
normal=$(tput sgr0)\
echo "$\{bold\}Average number of people who visited locations in each country:"\
echo "$\{normal\}|Country| Avg. Num. |"\
echo "---------------------"\
awk '\{sum[$1]+=$2;count[$1]++;\}END\{for(i in sum)print i"  "sum[i]/count[i];\}' dataset_EFISU\
echo "---------------------"\
\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 #QUESTION iii.________________________________________________________________\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 \
#How many people in total want to visit the places in each country?\
bold=$(tput bold)\
normal=$(tput sgr0)\
echo "$\{bold\}Total number of people willing to visit locations in each country:"\
echo "$\{normal\}|Country| Num. People |"\
echo "-----------------------"\
awk '\{\
    arr[$1]+=$3\
   \}\
   END \{\
     for (key in arr) printf("%s\\t%s\\n", key, arr[key])\
   \}' dataset_EFISU \\\
   | sort -k1,1\
echo "-----------------------"}