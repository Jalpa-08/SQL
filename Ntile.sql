/*-----------------------------NTILE-------------------------------*/

/* NTILE is a ranking function in SQL Server to distribute rows into a specified 
number of groups and assign a number to each group in incremental order starting with One. 
NTILE function works with ORDER BY clause to sort the rows in the specified order and splits them into groups,

Let us assume we have 10 rows in a table and using NTILE(5) function. 
Considering we have even number of rows in each group as 10 divided by NTILE(5) comes to 2 rows in each group. 
Thus NTILE function will distribute 2 rows in each group and assign them a number from 1 to 5.

In case of an odd number of rows in a table. Assuming we have 11 rows and using NTILE(5) function. 
NTILE function determines the number of rows in a table before splitting them into groups. 
Count of rows in a table divided by the number of groups specified with NTILE create groups with an 
unequal number of rows. Groups with a bigger number of rows will be listed ahead of groups with a small number of rows.

In case we have 11 rows divided by NTILE(5) comes to 3 rows in the first group followed by 2 rows in 
rest of the four groups */

CREATE DATABASE NTILE_PRACTICE;
USE NTILE_PRACTICE;

/* 1 NTILE-On Even Number Of Rows In Table

In the following example, 
we have created Student table with 10 rows having Id, Name and Percentage columns. 
Now using NTILE(5) function splits 10 rows into 5 groups and ordering the result by Percentage column. 
We have 10 rows and creating 5 groups using NTILE results in 2 rows in each group because 10 divided by 
NTILE(5) is 2 rows In each group. */

CREATE TABLE Student(
ID INT PRIMARY KEY, NAME VARCHAR(255) ,Percentage INT );

INSERT INTO Student
VALUES (1,'Atul',90),
(2,'Vishal',91),
(3,'Shailesh',3), 
(4,'Niraj',92),
(5,'Chetan',89),
(6,'Sangram',87),
(7,'Rohit',87),
(8,'Prashant',93), 
(9,'Ravi' ,91),
(10,'Akansha',94);

SELECT * FROM STUDENT
# Creates 5 groups with Even number of rows in each group -

SELECT ID, Name, Percentage, NTILE(5) OVER (ORDER BY Percentage DESC) as 
NTILEGROUP FROM Student;

/* 2. NTILE On Odd Number Of Rows In Table

In the following example, 
we have created Student table with 11 rows having Id, Name and Percentage columns. 
Using NTILE(5) function on 11 rows results in 3 rows in the first group and 2 rows in the rest of the 4 groups. 
Groups with a bigger number of rows will be listed ahead of groups with a small number of rows. 
We've ordered the result by Percentage column in NTILE function. */

CREATE TABLE Student1(
ID INT PRIMARY KEY, NAME VARCHAR(255) ,Percentage INT );

INSERT INTO Student1
VALUES (1,'Atul',90),
(2,'Vishal',91),
(3,'Shailesh',3), 
(4,'Niraj',92),
(5,'Chetan',89),
(6,'Sangram',87),
(7,'Rohit',87),
(8,'Prashant',93), 
(9,'Ravi' ,91),
(10,'Akansha',94),
(11,'Falak',86);

# Creates first group with 3 rows and four group with 2 rows each.

SELECT ID, Name, Percentage, NTILE(5) OVER (ORDER BY Percentage DESC) as
 NTILEGROUP1 FROM Student1;

/* 3. NTILE With Partition By Clause

Following example demonstrates the use of NTILE function with partition by clause. 
Most importantly this example uses partition by to divide the rows into different groups 
based on Subject column. 
Later applying NTILE(2) function to create groups inside each partition. 
Therefore we have created two partitions by Subject, "English" and "Math" then applying 
NTILE function to each partition dividing 6 rows into 2 different groups of 3 rows using NTILE(2) function. */ 

CREATE TABLE Student2(
ID INT,Name VARCHAR (255),Subject VARCHAR(20),Marks INT);

INSERT INTO Student2 VALUES
(1,'Atul','English',90),
(2,'Vishal','English',91), 
(3,'Shailesh', 'English',97),
(4,'Niraj','English',92), 
(5,'Chetan', 'English',89), 
(6,'Sangram', 'English',87), 
(7,'Rohit','Math' ,87), 
(8,'Prashant','Math' ,93), 
(9,'Ravi' ,'Math' ,91),
(10,'Akansha','Math' ,94), 
(11,'Falak','Math' ,86),
(12,'Avni','Math' ,73);

SELECT ID, Name,SUBJECT,MARKS, NTILE(2) OVER 
(PARTITION BY SUBJECT ORDER BY MARKS DESC) as 
NTILEGROUP2 FROM Student2;

/* 4. NTILE With Partition By Clause With Uneven Rows

We've created two partitions using Subject "English" and "Math" having 7 rows in each partition. 
Besides we apply NTILE(2) function to each individual partition of an odd number of rows, 
therefore, it creates two unequal groups. 
The first group has 4 rows and the second group has 3 rows in both the partition as per the rule, 
the bigger number of rows are placed in the first group followed by the lower number of rows in later groups. */

CREATE TABLE Student3(
ID INT,Name VARCHAR (255),Subject VARCHAR(20),Marks INT);

INSERT INTO Student3 VALUES
(1,'Atul','English',90),
(2,'Vishal','English',91), 
(3,'Shailesh', 'English',97),
(4,'Niraj','English',92), 
(5,'Chetan', 'English',89), 
(6,'Sangram', 'English',87), 
(7,'Rohit','Math' ,87), 
(8,'Prashant','Math' ,93), 
(9,'Ravi' ,'Math' ,91),
(10,'Akansha','Math' ,94), 
(11,'Falak','Math' ,86),
(12,'Avni','Math' ,73),
(13,'Aadesh','English' ,83),
(14,'Ranjana','Math' ,94);

SELECT ID, Name,SUBJECT,MARKS, NTILE(2) OVER (PARTITION BY SUBJECT ORDER BY MARKS DESC) as 
NTILEGROUP3 FROM Student3;

/*----------------- TRY DIFFERENT VALUES OF 'N' FOR BETTER UNDERSTANDING-----------------------*/