- The python DB creation is a simple template that I made for database and tables creation using the mysql pyhton connector.
- This is a faster way to create a databse and table of choice.
- Code needs to be edited if one intends to reuse it, to fit given requirements, particularly the table contents to suit your project data.


### REQUIREMENTS TO BE ABLE TO USE THIS TEMPLATE : 
Most terminal commands used below are for kali linux, they also apply to debian ubuntu
  -  Download mysql.
       - I used kali linux and this comes with MariaDB installed, which should suffice hence if using Kali linux of Debian Ubuntu, skip this step.
  2. Download mysql connector for the latest version of python. In my case python 3.7 mysql connector 8.x
      use the command (for python3.x)  : 
       - pip3 install mysql-connector-python
      for other OS, find how to install it form https://pynative.com/install-mysql-connector-python/
     
  3. To be able to successifully create a DB and perfom operations, one needs to be logged in. From the terminal, type :
      - to start mysql : $ service start mysql
      - to check if mysql is active : $service mysql status
      - to login : $mysql -h "localhost" -u "type your username here" -p hit enter and 
      - type your password and you should be connected.
      
      
