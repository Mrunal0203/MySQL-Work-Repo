CREATE DATABASE college;
USE college;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    HeadOfDepartment VARCHAR(100),
    Location VARCHAR(100),
    StaffCount int not null
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Gender CHAR(1),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Course_duration_year char(1),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Email VARCHAR(100),
    foreign key(departmentID) references departments(departmentID)
);

CREATE TABLE Library (
    BookID INT PRIMARY KEY,
    Book_Name VARCHAR(100),
    Writer VARCHAR(100),
    StudentID INT,
    DepartmentID INT,
    Foreign key (studentID) references Students(StudentID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Semester VARCHAR(100),
    Division VARCHAR(1),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Classrooms (
    RoomID INT PRIMARY KEY,
    Building VARCHAR(50),
    Floor INT,
    Capacity INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    EnrollmentID INT,
    Date DATE,
    Status VARCHAR(10),
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID)
);

CREATE TABLE Placement (
Placement INT primary key,
StudentID INT,
Company varchar(100),
Location varchar(100),
Gender char(1),
Foreign key (studentID) references Students(StudentID)
);

INSERT INTO Students VALUES
(1, 'Rupesh', 'Despande', 'Rdespande@gmail.com', 'F', 5),
(2, 'Amit', 'Saratkar', 'Asaratkar@gmail.com', 'M', 4),
(3, 'Ganesh', 'Deshmukh', 'Gdeshmukh@gmail.com', 'M', 2),
(4, 'Ganpat', 'Unpat', 'Gunpat@gmail.com', 'F', 3),
(5, 'Amol', 'Barde', 'Abarde@gmail.com', 'M', 1
);

INSERT INTO Departments VALUES
(1, 'Electrical Engineering', 'Mr. Vaishnav', 'Block A', 5),
(2, 'Mechanical Engineering', 'Miss. Kajal', 'Block B', 4),
(3, 'Civil Engineering', 'Mr. Runal', 'Block C', 2),
(4, 'Information Technology', 'Mr. Rathod', 'Block D', 3),
(5, 'Instrumentation Engineering', 'Mr. Rajesh', 'Block E', 1
);

insert into courses values
(1, 'Electrical Drawing', '1', 1),
(2, 'Mechanical Drawing', '1', 2),
(3, 'Civil Drawing', '1', 3),
(4, 'Full stack', '2', 4),
(5, 'Automation', '1', 5
);

INSERT INTO Faculty VALUES 
(1, 'Gaurav', 'Mohite', 11, 'Mohite@gmail.com'),
(2, 'Shanshank', 'Patel', 12, 'Patel@gmail.com'),
(3, 'Kannur', 'Rahul', 13, 'Rahul@gmail.com'),
(4, 'Sharukh', 'Khan', 14, 'Khan@gmail.com'),
(5, 'Rahul', 'Tewatia', 15, 'Tewatia@gmail.com'
);

INSERT INTO Library VALUES
(1, 'The 1990', 'Gopi 1', 100, 1),
(2, 'The 1984', 'Gopi 2', 102, 2),
(3, 'The 1995', 'Gopi 3', 103, 3),
(4, 'The 1996', 'Gopi 4', 104, 1),
(5, 'The 1980', 'Gopi 5', 105, 2),
(6, 'The 1976', 'Gopi 6', 106, 4),
(7, 'The 1998', 'Gopi 7', 107, 3),
(8, 'The 2001', 'Gopi 8', 108, 2
);

INSERT INTO Enrollments VALUES
(1, 1, 101, 'Winter2023', 'A'),   
(2, 2, 103, 'Winter2023', 'B'),   
(3, 3, 105, 'Summer2023', 'A'), 
(4, 4, 107, 'Summer2023', 'B'), 
(5, 5, 109, 'Winter2023', 'A'
);

INSERT INTO Classrooms (RoomID, Building, Floor, Capacity, DepartmentID)
VALUES
(10, 'Building 1', 1, 40, 1),  
(12, 'Building 2', 2, 50, 2),  
(13, 'Building 3', 1, 30, 3),  
(14, 'Building 4', 3, 20, 4
);

INSERT INTO Attendance VALUES
(1, 11, '2023-09-01', 'Present'),   
(2, 12, '2023-09-01', 'Absent'),    
(3, 22, '2023-09-01', 'Present'),   
(4, 33, '2023-03-01', 'Absent'),   
(5, 44, '2023-09-01', 'Present'),
(6, 55, '2023-09-01', 'Present'
);

INSERT INTO Placement VALUES
(1, 11, 'TCS', 'Mumbai', 'M'),    
(2, 22, 'Mahindra', 'Pune', 'F'),   
(3, 33, 'Godrej', 'Navi Mumbai', 'F'),  
(4, 44, 'Quess', 'Andheri', 'M'
);

-- select queries

SELECT * FROM Students;

-- Find HOD by department name
SELECT DepartmentName, Headofdepartment FROM Departments;

-- Find Male genders from students
SELECT * FROM Students WHERE Gender = 'M';

-- Find email from faculty
SELECT FirstName, LastName, Email FROM Faculty;

-- Count of enrollments by semester
SELECT Semester, COUNT(*) AS TotalEnrollments
FROM Enrollments
GROUP BY Semester;

-- List books written by Gopi 1
SELECT * FROM Library WHERE writer = 'Gopi 1';

-- Get number of books by author
SELECT writer, COUNT(*) AS BooksWritten
FROM Library
GROUP BY writer;

-- select faculty emails
SELECT Email FROM Faculty;

-- select students with ID greater than 2
SELECT * FROM Students WHERE StudentID > 2;

-- select classrooms with capacity more than 30
SELECT * FROM Classrooms WHERE Capacity > 30;

-- select only present attendance
SELECT * FROM Attendance WHERE Status = 'Present';

-- drop query
DROP TABLE Attendance;

-- truncate query
TRUNCATE TABLE enrollments;

-- update queries

-- Update a student email
UPDATE Students
SET Email = 'rupesh.despande@newemail.com'
WHERE StudentID = 1;

-- Update the department head
UPDATE Departments
SET HeadOfDepartment = 'Dr. Sharma'
WHERE DepartmentID = 1;

-- Update the staff count in a department
UPDATE Departments
SET Staffcount = 6
WHERE DepartmentID = 2;

-- Update a student's gender
UPDATE Students
SET Gender = 'M'
WHERE StudentID = 3;

-- Update course duration
UPDATE Courses
SET Course_duration_year = '2'
WHERE CourseID = 1;

-- Update the classroom capacity
UPDATE Classrooms
SET Capacity = 45
WHERE RoomID = 101;

-- Update the placement information
UPDATE Placement
SET Company = 'Infosys', Location = 'Pune'
WHERE StudentID = 1;

-- Update enrollment division
UPDATE Enrollments
SET Division = 'B'
WHERE EnrollmentID = 1;

-- delete queries

-- delete a specific student
DELETE FROM Students WHERE StudentID = 3;

-- safe mode

-- delete a specific department
DELETE FROM Departments WHERE DepartmentName = 'Civil Engineering';

-- delete attendance for a specific date
DELETE FROM Attendance WHERE Date = '2023-09-01';

-- delete a faculty member by email
DELETE FROM Faculty WHERE Email = 'Tewatia@gmail.com';

-- safe mode

set sql_safe_updates = 0;

set sql_safe_updates = 1;

-- alter queries



























































