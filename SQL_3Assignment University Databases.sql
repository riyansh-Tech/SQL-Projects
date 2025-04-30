-- University DataBase

/* create by Riyansh Pol   For submission to Coachex */

/*University Database Management System is one of the Fundamental and Intermediate level SQL project
Here in this Project you have to create an efficient DBMS for the any University .*/

--Inorder to create this system Perform the following task:-


Task 1:-
1.Create University Database give any University name you want

Create Database University

2. Under this University Create four tables and each table should have following three Column named as:-

A. College_Table
College_ID(PK)
College_Name
College_Area

Create College_Table(


B. Department_Table
Dept_ID(PK)
Dept_Name
Dept_Facility

C. Professor_Table
Professor_ID(PK)
Professor_Name
Professor_Subject


D. Student_Table
Student_ID(PK)
Student_Name
Student_Stream


3. Apply foreign key on Department key from College_table

ALTER TABLE College_Table
ADD CONSTRAINT fk_department_college
FOREIGN KEY (Department_key)
REFERENCES Department_Table(Dept_ID);

4. Apply foreign Key on Student_Table from Professor_Table

ALTER TABLE Student_Table
ADD CONSTRAINT fk_student_professor
FOREIGN KEY (Professor_ID)
REFERENCES Professor_Table(Professor_ID);

5. Insert atleast 10 Records in each table


INSERT INTO College_Table (College_ID, College_Name, College_Area) VALUES
(1, 'Green Valley College', 'Mumbai'),
(2, 'Oceanic Institute', 'Pune'),
(3, 'Skyline University', 'Delhi'),
(4, 'Summit College', 'Bangalore'),
(5, 'Horizon Academy', 'Hyderabad'),
(6, 'Metro College', 'Chennai'),
(7, 'Heritage University', 'Kolkata'),
(8, 'Sunrise College', 'Jaipur'),
(9, 'Pioneer Institute', 'Ahmedabad'),
(10, 'Elite Academy', 'Lucknow');


INSERT INTO Department_Table (Dept_ID, Dept_Name, Dept_Facility) VALUES
(1, 'Computer Science', 'AI Lab'),
(2, 'Mechanical Engineering', 'Workshop'),
(3, 'Electrical Engineering', 'Power Systems Lab'),
(4, 'Civil Engineering', 'Concrete Lab'),
(5, 'Biotechnology', 'Biotech Research Center'),
(6, 'Management', 'Business Simulation Lab'),
(7, 'Mathematics', 'Math Resource Center'),
(8, 'Physics', 'Quantum Physics Lab'),
(9, 'Chemistry', 'Organic Chemistry Lab'),
(10, 'Literature', 'Library and Archives');


INSERT INTO Professor_Table (Professor_ID, Professor_Name, Professor_Subject) VALUES
(1, 'Dr. Sharma', 'Data Science'),
(2, 'Prof. Iyer', 'Thermodynamics'),
(3, 'Dr. Gupta', 'Circuit Design'),
(4, 'Prof. Rao', 'Structural Engineering'),
(5, 'Dr. Verma', 'Biochemistry'),
(6, 'Prof. Mehta', 'Corporate Finance'),
(7, 'Dr. Bose', 'Probability Theory'),
(8, 'Prof. Das', 'Astrophysics'),
(9, 'Dr. Sen', 'Polymer Chemistry'),
(10, 'Prof. Nair', 'Modern Literature');


INSERT INTO Student_Table (Student_ID, Student_Name, Student_Stream) VALUES
(1, 'Aarav Patel', 'Computer Science'),
(2, 'Meera Sharma', 'Mechanical Engineering'),
(3, 'Kabir Gupta', 'Electrical Engineering'),
(4, 'Ishita Rao', 'Civil Engineering'),
(5, 'Rohan Verma', 'Biotechnology'),
(6, 'Sanya Mehta', 'Management'),
(7, 'Vikram Bose', 'Mathematics'),
(8, 'Tanvi Das', 'Physics'),
(9, 'Arjun Sen', 'Chemistry'),
(10, 'Simran Nair', 'Literature');




Task 2:-
1. Give the information of College_ID and College_name from College_Table

Select College_ID, College_Name
from College_Table

2. Show Top 5 rows from Student table.

Select TOP 5 * from Student_Table
OR
SELECT * FROM Student_Table
LIMIT 5;

3. What is the name of professor whose ID is 5

Select Professor_name from Professor_Table
where Professor_ID = 5

4. Convert the name of the Professor into Upper case 


5. Show me the names of those students whose name is start with a

Select * from Student_Table WHERE Student_Name LIKE 'a%'

6. Give the name of those colleges whose end with a

Select * from College_Table WHERE College_Name LIKE '%a'

7. Add one Salary Column in Professor_Table

ALTER TABLE Professor_Table
ADD Salary DECIMAL(10,2);

8. Add one Contact Column in Student_table

ALTER TABLE Student_Table
ADD Contact varchar(max);

9. Find the total Salary of Professor 
10. Change datatype of any one column of any one Table


Task 3:-
1. Show first 5 records from Students table and Professor table Combine

SELECT TOP 5 Student_ID,Student_Name FROM Student_Table
UNION ALL
SELECT TOP 5 Professor_ID, Professor_Name FROM Professor_Table

2. Apply Inner join on all 4 tables together(Syntax is mandatory)

SELECT 
    s.Student_ID, s.Student_Name, s.Student_Stream,
    p.Professor_Name, p.Professor_Subject, p.Salary,
    d.Dept_Name, d.Dept_Facility,
    c.College_Name, c.College_Area
FROM Student_Table s
INNER JOIN Professor_Table p ON s.Student_ID = p.Professor_ID
INNER JOIN Department_Table d ON p.Professor_ID = d.Dept_ID
INNER JOIN College_Table c ON d.Dept_ID = c.College_ID;

3. Show Some null values from Department table and Professor table.

SELECT d.Dept_ID, d.Dept_Name, d.Dept_Facility, 
       p.Professor_Name, p.Professor_Subject, p.Salary
FROM Department_Table d
LEFT JOIN Professor_Table p ON d.Dept_ID = p.Professor_ID
WHERE d.Dept_Name IS NULL 
   OR d.Dept_Facility IS NULL
   OR p.Professor_Name IS NULL
   OR p.Professor_Subject IS NULL
   OR p.Salary IS NULL;

4. Create a View from College Table and give those records whose college name starts with C

CREATE VIEW College_View_C AS
SELECT * FROM College_Table
WHERE College_Name LIKE 'C%';

--To fetch records from this view:

SELECT * FROM College_View_C;

5. Create Stored Procedure of Professor table whatever customer ID will be given by user it should show whole records of it.



6. Rename the College_Table to College_Tables_Data .

EXEC sp_rename 'College_Table', 'College_Tables_Data';




