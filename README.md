# ETL using Linux Shell
An ETL process using Linux shell command and Postgres SQL


    Problem:

    Copy the data in the file ‘web-server-access-log.txt.gz’ to the table ‘access_log’ in the PostgreSQL database ‘template1’.

    The file is available at the location : “https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/web-server-access-log.txt.gz".

    The following are the columns and their data types in the file:

    a. timestamp - TIMESTAMP

    b. latitude - float

    c. longitude - float

    d. visitorid - char(37)

    and two more columns: accessed_from_mobile (boolean) and browser_code (int)

    The columns which we need to copy to the table are the first four coumns : timestamp, latitude, longitude and visitorid.

