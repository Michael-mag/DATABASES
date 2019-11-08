#!/usr/bin/env python3

'''SCRIPT TO CREATE ANY DATABASE'''

import mysql.connector
from mysql.connector import Error

def creation():

    try :
        my_connection = mysql.connector.connect(
                host = "localhost", #replace this with the provided host name
                user = "Michael", #replace this with the user for your access
                passwd = "Magaisa" #change this to your password
            )
        if my_connection.is_connected():
            print()
            print("CONNECTED!!!")
            print()
            mycursor = my_connection.cursor()
            print()
            print("Below is a list of all the databases on this server : ")
            mycursor.execute("SHOW DATABASES") #check if the database was created
            for x in mycursor:
                print()
                print(x)
                print()
            #ask user for db name and create the db
            dbname = input("what would you like to call your new database ? \n")
            create_this = '''CREATE DATABASE %s''' %(dbname) #pass a variable to the database query
            mycursor.execute(create_this) #perfom the creation in sql using python variable

            #show user the new list of databases and confirm Creation
            mycursor.execute("SHOW DATABASES")
            print()#empty line
            for x in mycursor:
                print(x)#show the databases

            print()
            created = input("Was database created successfully? (Y/N) : \n")
            if created == "Y" or "y":
                print()
                print("You may proceed!!!")
            else:
                print()
                print("Creation failed...Please try again.")
                print()
    except Error as err:
        print()
        print("ERROR...please read the message below : ")
        print(err)
        print()

    finally:#disconnect from the server and release resources
        if my_connection.is_connected():
            mycursor.close()
            my_connection.close()
            print()
            print("Disconnected successfully!...")
            print()

creation()
