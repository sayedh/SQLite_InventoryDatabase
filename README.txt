Here is a basic usage of sqlite. Move onto inventory.sql for practice with the full project.

Open VSCode

open folder in VSCode consisting of sqlite3.exe and dev.db

open terminal in VSCode, I used powershell

go to directory of the folder:
>cd C:\Users\....


then open database using this command, my databse is dev.db:
> ./sqlite3.exe .\dev.db




Now entering sqlite terminal
sqlite>
sqlite>
sqlite>



Now create a table:
sqlite> CREATE TABLE parts (
   ...>     id integer,
   ...>     description character varying,
   ...>     code character varying,
   ...>     manufacturer_id  integer
   ...> );




Now search for the schema structure of your database
sqlite> 
sqlite> .schema



Import data into the table via a .csv file
sqlite> .mode csv
sqlite> .import parts.csv parts



View the contents of the table:
SELECT * FROM parts;


