/*GOAL IS TO IMPLEMENT THE THINGS I HAVE LEARNT ABOUT SQL TODAY.
THE FIRST LESSONS COVERED WHERE CREATING A TABLE AND QUERYING.
SOME QUERIES WERE LEFT AS THEY ARE TRIVIAL, AND ONLY THOSE DEEMED NECCESSARY WILL BE
INCLUDED LATER */

CREATE TABLE students (
  --TABLE COLUMNS
    Student_ID int IDENTITY(1,1) PRIMARY KEY,
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
),-- row 4 ends

(--row 5 starts
    'Anotidaishe',
    'Mawire',
    7,
    'Primary School',
    'England'
); -- row 5 ends


--MORE STUDENT DATA

CREATE TABLE student_data(
  Student_ID int,
  Room_Number int,
  Graduation_Year int,
  GPA int,
  Age int
);

INSERT INTO student_data (
  Student_ID,
  Room_Number,
  Graduation_Year,
  GPA
)

VALUES (
  30001218,
  120,
  2020,
  2.00
),

(
  30001997,
  151,
  2019,
  1.33
),

(
  30001996,
  167,
  2024,
  1.67
),

(
  30002000,
  138,
  2018,
  4.33
),

(
  30001498,
  220,
  2020,
  1.67
);

--QUERYING
--entries of table
SELECT COUNT(*) AS Total_Entries FROM students;

--Display all data from students
SELECT  * FROM students;

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

--GORUPING AND ORDERING THE OUTPUT
SELECT COUNT(*) AS Number_Of_Students , Country
FROM students
GROUP BY Country
ORDER BY Number_Of_Students DESC;

--Check for existance
SELECT * FROM students
WHERE EXISTS
        (SELECT Student_ID
         FROM student_data
         WHERE Age > 20);

--Copy German Students to a new table for only German Students
/*
SELECT INTO creates an new table and backsup or copies the data into the new table
*/
SELECT * INTO German_Students
FROM students
WHERE Country = 'Germany';

--Display the Copy
SELECT * FROM German_Students;

--INSERT INTO SELECT
--Copies data between two existing tables
--Destination and depature data types should be a match for this to work
SET IDENTITY_INSERT students ON
INSERT INTO students (Student_ID )
SELECT Student_ID FROM student_data;

SELECT * FROM students;



/*
UPDATE
  students
  SET
    students.Student_ID = student_data.Student_ID
    FROM
      students INNER JOIN student_data
      ON students.Student_ID = student_data.Student_ID;
*/
