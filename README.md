# Solution

You can import the data from .sql file.

Importing a database requires setting up a blank database first.

1. To create a blank database, launch the MySQL shell by entering:

    mysql –u root –p

2. Enter the root password when prompted.

    The command prompt should change to show that you’re working in MySQL.

3. Next, create a new database by entering the following:

    CREATE DATABASE new_db_name;

    The system should return with Query OK, 1 row affected (0.00 sec). Note:

    The command won’t run if the semicolon isn’t entered at the end of the command.

4. Exit the MySQL shell by pressing Ctrl-D.
    The command prompt should return to normal.

5. Enter the following command to import the dump file:

    mysql –u username –p new_db_name < dump_file.sql

    You’ll only see a response if there are errors.
    A successful import won’t display any comments on the screen.

6. To check the database, log back into the MySQL shell:

   mysql –u root –p

7. To load the database, enter:

    USE new_db_name

8. Display the contents of the database by typing:

    SHOW TABLES;

This above guide is taken from
https://phoenixnap.com/kb/import-and-export-mysql-database
