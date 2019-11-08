#!/usr/bin/env python3
import mysql.connector
from mysql.connector import Error
from mysql.connector import errorcode


try:
    my_connection = mysql.connector.connect(
        host = "localhost", #change this to the desired hostname
        user = "Michael",#set this to the username desired
        passwd = "Magaisa",#change this to the password set for the user above
        database = "TryOne" #change this to the database you wish to connect to
    )
    if my_connection.is_connected():
        print()
        print("Connection to database ICFT established!!!...")
        print()

        mycursor =  my_connection.cursor()

        #create a table for account holders
        #change this to any table desired
        People = """
                            CREATE TABLE Users (
                                username VARCHAR(255),
                                password VARCHAR(255)
                            )
                        """
        mycursor.execute(People)
        mycursor.execute("use TryOne") #chose the database to use
        mycursor.execute("SHOW TABLES")#tell user something
        print()
        print("the table was created...")
        print("Below are all the tables found in the database \"TryOne\" : ") #change TryOne to the name of database chosen above
        print()
        for x in mycursor:
            print(x)

        print()

except Error as err:
    print()
    print("An error occured...")
    print()
    print(err)
    print()

finally:#disconnect from the server and release resources
    if my_connection.is_connected():
        mycursor.close()
        my_connection.close()
        print()
        print("Disconnected successfully!...")
        print()
