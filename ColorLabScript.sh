#!/bin/bash

# Read file 
input_file="NamesAndColors1.txt"

# Read file line by line 
while IFS= read -r file; do

# Read first name, last name, and color
    FIRSTNAME=$(echo "$file" | awk '{print $1}' | awk '{print tolower($0)}' | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))>
    LASTNAME=$(echo "$file" | awk '{print $2}' | awk '{print tolower($0)}' | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}>
    COLOR=$(echo "$file" | awk '{print $3}' | sed 's/Uknown/Brown/')

# Echo first name, last night & favorite color
    echo "I am $FIRSTNAME $LASTNAME & my favorite color is $COLOR"
done < "$input_file"
