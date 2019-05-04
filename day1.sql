/*GOAL IS TO IMPLEMENT THE THINGS I HAVE LEARNT ABOUT SQL TODAY.
THE FIRST LESSONS COVERED WHERE CREATING A TABLE AND QUERYING.
SOME QUERIES WERE LEFT AS THEY ARE TRIVIAL, AND ONLY THOSE DEEMED NECCESSARY WILL BE
INCLUDED LATER */

CREATE TABLE students (
  --TABLE COLUMNS
    Name varchar(60) ,
    Surname varchar (50) ,--varchar is to specify the input type to be alphabetical characters
    Age int,--the number inside the brackets specify the maximum number of contents
    Major varchar (30),
    Country varchar(100)
  );

--COLUMN NAMES
INSERT INTO students(
   Name,
   Surname,
   Age,
   Major,
   Country
)

--COLUMN VALUES
VALUES (
   'Michael',
   'Magaisa',
    22,
   'ECE',
   'ZIMBABWE'
), -- END of row one

(--Row 2 starts
   'Magaisa',
   'Michael',
   23,
   'CS',
   'Germany'
), -- END of row two

(--Row 3 starts
   'Malena',
   'Schmidt',
   19,
   'Politics',
   'Germany'
),--end row 3

(--start row 4
   'Laura',
   'Ribeiro',
   22,
   'Law',
   'Portugal'
); -- row 4 ends

--QUERYING
--entries of table
SELECT COUNT(*) FROM students;

--check for null entries
SELECT * FROM students
WHERE  Major IS NULL;

/* TRY TO PRINT THE STATEMENTS ABOVE THE TABLE
DECLARE @nothing INT = COUNT(Major IS NULL)
PRINT 'NULL ELEMENTS = ' + CAST (@nothing AS VARCHAR(100));
*/

--name and age of German students
SELECT Name, Age FROM students
WHERE Country = 'Germany';

--name and country of students studying ECE or CS
SELECT Name, Country FROM students
WHERE Major = 'ECE' OR Major = 'CS';

--name and age of students above 18
SELECT Name, Age FROM students
WHERE Age > 19 ;

-- age>20 , CS major
SELECT * FROM students
WHERE Age > 20 AND Major = 'CS';

--not Germany
SELECT * FROM students
WHERE NOT Country = 'Germany';

-- Select the top 2 elements
SELECT TOP 2 * FROM students;

--SELECT the minimum and the maximum age
SELECT MAX(Age) AS Oldest , MIN(Age) AS Youngest
FROM students;

--What is the average Age
SELECT AVG(Age) AS Average_Age
FROM students;
