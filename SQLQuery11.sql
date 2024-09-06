USE HMAcademy; --Дописал HM т.к. у меня уже была БД с названием Academy

-- 1. Куратори (Curators)
CREATE TABLE Curators (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(MAX) NOT NULL CHECK (LEN(Name) > 0),
    Surname NVARCHAR(MAX) NOT NULL CHECK (LEN(Surname) > 0)
);

-- 2. Кафедри (Departments)
CREATE TABLE Departments (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Financing MONEY NOT NULL CHECK (Financing >= 0) DEFAULT 0,
    Name NVARCHAR(100) NOT NULL UNIQUE CHECK (LEN(Name) > 0),
    FacultyId INT NOT NULL FOREIGN KEY REFERENCES Faculties(Id)
);

-- 3. Факультети (Faculties)
CREATE TABLE Faculties (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Financing MONEY NOT NULL CHECK (Financing >= 0) DEFAULT 0,
    Name NVARCHAR(100) NOT NULL UNIQUE CHECK (LEN(Name) > 0)
);

-- 4. Групи (Groups)
CREATE TABLE Groups (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(10) NOT NULL UNIQUE CHECK (LEN(Name) > 0),
    Year INT NOT NULL CHECK (Year BETWEEN 1 AND 5),
    DepartmentId INT NOT NULL FOREIGN KEY REFERENCES Departments(Id)
);

-- 5. Групи та куратори (GroupsCurators)
CREATE TABLE GroupsCurators (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CuratorId INT NOT NULL FOREIGN KEY REFERENCES Curators(Id),
    GroupId INT NOT NULL FOREIGN KEY REFERENCES Groups(Id)
);

-- 6. Групи та лекції (GroupsLectures)
CREATE TABLE GroupsLectures (
    Id INT PRIMARY KEY IDENTITY(1,1),
    GroupId INT NOT NULL FOREIGN KEY REFERENCES Groups(Id),
    LectureId INT NOT NULL FOREIGN KEY REFERENCES Lectures(Id)
);

-- 7. Лекції (Lectures)
CREATE TABLE Lectures (
    Id INT PRIMARY KEY IDENTITY(1,1),
    LectureRoom NVARCHAR(MAX) NOT NULL CHECK (LEN(LectureRoom) > 0),
    SubjectId INT NOT NULL FOREIGN KEY REFERENCES Subjects(Id),
    TeacherId INT NOT NULL FOREIGN KEY REFERENCES Teachers(Id)
);

-- 8. Дисципліни (Subjects)
CREATE TABLE Subjects (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL UNIQUE CHECK (LEN(Name) > 0)
);

-- 9. Викладачі (Teachers)
CREATE TABLE Teachers (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(MAX) NOT NULL CHECK (LEN(Name) > 0),
    Salary MONEY NOT NULL CHECK (Salary > 0),
    Surname NVARCHAR(MAX) NOT NULL CHECK (LEN(Surname) > 0)
);


GO

-- 1. Куратори (Curators)
INSERT INTO Curators (Name, Surname) VALUES (N'John', N'Doe');
INSERT INTO Curators (Name, Surname) VALUES (N'Jane', N'Smith');
INSERT INTO Curators (Name, Surname) VALUES (N'Emily', N'Johnson');
INSERT INTO Curators (Name, Surname) VALUES (N'Michael', N'Williams');
INSERT INTO Curators (Name, Surname) VALUES (N'Chris', N'Brown');
INSERT INTO Curators (Name, Surname) VALUES (N'David', N'Martin');
INSERT INTO Curators (Name, Surname) VALUES (N'Linda', N'Taylor');
INSERT INTO Curators (Name, Surname) VALUES (N'James', N'Anderson');

GO

-- 2. Кафедри (Departments)
INSERT INTO Faculties (Financing, Name) VALUES (2000000, N'Faculty of Computer Science');
INSERT INTO Faculties (Financing, Name) VALUES (1500000, N'Faculty of Programming');
INSERT INTO Faculties (Financing, Name) VALUES (1000000, N'Faculty of Robotics');
INSERT INTO Faculties (Financing, Name) VALUES (1200000, N'Faculty of Artificial Intelligence');
INSERT INTO Faculties (Financing, Name) VALUES (1100000, N'Faculty of Data Science');
GO

-- 3. Факультети (Faculties)
INSERT INTO Subjects (Name) VALUES (N'Computer Science');
INSERT INTO Subjects (Name) VALUES (N'Programming');
INSERT INTO Subjects (Name) VALUES (N'Robotics');
INSERT INTO Subjects (Name) VALUES (N'Artificial Intelligence');
INSERT INTO Subjects (Name) VALUES (N'Database Theory');
INSERT INTO Subjects (Name) VALUES (N'Machine Learning');
INSERT INTO Subjects (Name) VALUES (N'Algorithms');
GO

-- 4. Групи (Groups)
INSERT INTO Teachers (Name, Surname, Salary) VALUES (N'Alex', N'Johnson', 70000);
INSERT INTO Teachers (Name, Surname, Salary) VALUES (N'Linda', N'Williams', 75000);
INSERT INTO Teachers (Name, Surname, Salary) VALUES (N'Robert', N'Miller', 80000);
INSERT INTO Teachers (Name, Surname, Salary) VALUES (N'Susan', N'Wilson', 72000);
INSERT INTO Teachers (Name, Surname, Salary) VALUES (N'Karen', N'Moore', 68000);
INSERT INTO Teachers (Name, Surname, Salary) VALUES (N'Paul', N'Thomas', 69000);
INSERT INTO Teachers (Name, Surname, Salary) VALUES (N'Mary', N'Taylor', 71000);
INSERT INTO Teachers (Name, Surname, Salary) VALUES (N'George', N'White', 76000);
GO

-- 5. Групи та куратори (GroupsCurators)
INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES (N'Room 101', 1, 1);
INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES (N'Room 102', 2, 2);
INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES (N'Room 103', 3, 3);
INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES (N'Room 104', 4, 4);
INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES (N'Room 105', 5, 5);
INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES (N'Room 106', 6, 6);
INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES (N'Room 107', 7, 7);
INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES (N'Room 108', 1, 8);
GO

-- 6. Групи та лекції (GroupsLectures)
INSERT INTO Departments (Financing, Name, FacultyId) VALUES (500000, N'Department of Software Engineering', 1);
INSERT INTO Departments (Financing, Name, FacultyId) VALUES (300000, N'Department of Applied Programming', 2);
INSERT INTO Departments (Financing, Name, FacultyId) VALUES (400000, N'Department of Robotics', 3);
INSERT INTO Departments (Financing, Name, FacultyId) VALUES (350000, N'Department of AI Systems', 4);
INSERT INTO Departments (Financing, Name, FacultyId) VALUES (450000, N'Department of Data Analysis', 5);
GO

-- 7. Лекції (Lectures)
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group CS1', 1, 1);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group PRG1', 2, 2);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group ROB1', 3, 3);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group AI1', 1, 4);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group DS1', 2, 5);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group CS2', 2, 1);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group PRG2', 3, 2);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group ROB2', 1, 3);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group AI2', 2, 4);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group DS2', 3, 5);
GO

-- 8. Дисципліни (Subjects)
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (1, 1);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (2, 2);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (3, 3);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (4, 4);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (5, 5);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (1, 6);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (6, 7);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (7, 8);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (8, 9);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (3, 10);
GO

-- 9. Викладачі (Teachers)
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (1, 1);
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (2, 2);
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (3, 3);
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (4, 4);
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (5, 5);
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (6, 1);
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (7, 6);
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (8, 7);
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (9, 3);
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (10, 4);

GO

SELECT Teachers.Name AS TeacherName, Teachers.Surname AS TeacherSurname, Groups.Name AS GroupName
FROM Teachers
CROSS JOIN Groups;

GO

SELECT 	Departments.Name AS DepartmentName, Faculties.Name AS FacultieName
FROM Departments
JOIN Faculties ON Departments.FacultyId = Faculties.Id
WHERE Faculties.Financing>Departments.Financing

GO

SELECT Curators.Surname AS CuratorSurname, Groups.Name AS GroupName
FROM Curators
JOIN GroupsCurators ON Curators.Id = GroupsCurators.CuratorId
JOIN Groups ON GroupsCurators.GroupId = Groups.Id;

GO

SELECT Teachers.Name, Teachers.Surname
FROM Teachers
JOIN Lectures ON Lectures.TeacherId = Teachers.Id
JOIN GroupsLectures ON GroupsLectures.LectureId = Lectures.Id
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
WHERE Groups.Name = 'Group DS2'

GO

SELECT DISTINCT Teachers.Surname AS TeacherSurname, Faculties.Name AS FacultyName
FROM Teachers
JOIN Lectures ON Teachers.Id = Lectures.TeacherId
JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
JOIN Departments ON Groups.DepartmentId = Departments.Id
JOIN Faculties ON Departments.FacultyId = Faculties.Id;

GO

SELECT Departments.Name AS DepartmentName, Groups.Name AS GroupName
FROM Groups
JOIN Departments ON Groups.DepartmentId = Departments.Id;
SELECT Departments.Name AS DepartmentName, Groups.Name AS GroupName
FROM Groups
JOIN Departments ON Groups.DepartmentId = Departments.Id;

GO

SELECT Subjects.Name AS SubjectName
FROM Teachers
JOIN Lectures ON Teachers.Id = Lectures.TeacherId
JOIN Subjects ON Lectures.SubjectId = Subjects.Id
WHERE Teachers.Name = 'Samantha' AND Teachers.Surname = 'Adams';

GO

SELECT DISTINCT Departments.Name AS DepartmentName
FROM Lectures
JOIN Subjects ON Lectures.SubjectId = Subjects.Id
JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
JOIN Departments ON Groups.DepartmentId = Departments.Id
WHERE Subjects.Name = 'Database Theory';

GO

SELECT Groups.Name AS GroupName
FROM Groups
JOIN Departments ON Groups.DepartmentId = Departments.Id
JOIN Faculties ON Departments.FacultyId = Faculties.Id
WHERE Faculties.Name = 'Computer Science';

GO

SELECT Groups.Name AS GroupName, Faculties.Name AS FacultyName
FROM Groups
JOIN Departments ON Groups.DepartmentId = Departments.Id
JOIN Faculties ON Departments.FacultyId = Faculties.Id
WHERE Groups.Year = 5;

GO

SELECT Teachers.Name AS TeacherName, Teachers.Surname AS TeacherSurname, 
       Subjects.Name AS SubjectName, Groups.Name AS GroupName
FROM Teachers
JOIN Lectures ON Teachers.Id = Lectures.TeacherId
JOIN Subjects ON Lectures.SubjectId = Subjects.Id
JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
WHERE Lectures.LectureRoom = 'B103';

