# cp-access-log.sh
# This script downloads the file 'web-server-access-log.txt.gz'
# from "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/".

# The script then extracts the .txt file using gunzip.

# The .txt file contains the timestamp, latitude, longitude 
# and visitor id apart from other data.

# Transforms the text delimeter from "#" to "," and saves to a csv file.
# Loads the data from the CSV file into the table 'access_log' in PostgreSQL database.


# Download the access log file

wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/web-server-access-log.txt.gz"

#unzip the logfile

echo "Unzipping file"

gunzip -f web-server-access-log.txt.gz

# EXTRACT PHASE

echo "Extracting data"

#extract the fields mentioned above

cut -d"#" -f1-4 web-server-access-log.txt > wal-extracted-data.txt


# TRANSFORM PHASE

echo "Transforming data"

#read the extracted data and replace hashtag with comma then save it into a csv file
tr "#" "," < wal-extracted-data.txt > wal-transformed-data.csv 

# LOAD PHASE

echo "Loading data"


# Send the instructions to connect to 'template1' and
# copy the file to the table 'access_log' through command pipeline.

echo "\c template1;\COPY access_log FROM '/home/project/wal-transformed-data.csv' DELIMITERS ',' CSV HEADER;" | psql --username=postgres --host=localhost