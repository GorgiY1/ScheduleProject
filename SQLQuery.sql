
CREATE DATABASE Sending_Help
ON PRIMARY
(
	NAME = SH_WCDB,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\Sending_Help.mdf',
	SIZE = 12MB,
	MAXSIZE = 20MB,
	FILEGROWTH = 2MB

)
LOG ON
(
	NAME = SH_WCDB_Log,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\Sending_Help.ldf',
	SIZE = 2MB,
	MAXSIZE = 11MB,
	FILEGROWTH = 1MB
)
GO

USE Sending_Help
GO

CREATE TABLE Person (
    Id INT IDENTITY(1,1),
	Last_Name NVARCHAR(40) NOT NULL,
	First_Name NVARCHAR(40) NOT NULL,
	Midle_Name NVARCHAR(40) NOT NULL,
	Social_Status NVARCHAR(40) NULL,
	
	CONSTRAINT PK_Person_ID PRIMARY KEY(Id),
	CONSTRAINT CK_Person_Last_Name CHECK (LEN(Last_Name) > 0),
	CONSTRAINT CK_Person_First_Name CHECK (LEN(First_Name) > 0),
	CONSTRAINT CK_Person_Midle_Name CHECK (LEN(Midle_Name) > 0),

	CONSTRAINT UQ_Person_LastName UNIQUE(Last_Name)
);
GO

CREATE TABLE Received (
    Id INT IDENTITY(1,1),
	Date_Receiving Date default GETDATE() NOT NULL,
	Is_Received BIt default 'false' NOT NULL,
	PersonId INT,
	
	CONSTRAINT PK_Received_ID PRIMARY KEY(Id),
	CONSTRAINT CK_Received_Date_Receiving CHECK (Date_Receiving < GETDATE() OR Date_Receiving = GETDATE()),

	CONSTRAINT FK_Received_PersonId_To_Person FOREIGN KEY (PersonId) REFERENCES Person(Id)
);
GO

INSERT Person Values 
('qwer1','qwer2', 'qwer3', ''),
('asdf1','asdf2', 'asdf3', ''),
('zxcv1','zxcv2', 'zxcv3', 'invalid')

SELECT * FROM Person 

INSERT Received Values 
('2023-09-03', 1, 1),
('2023-09-03', 1, 3),
('2023-09-03', 0, 2),
('2023-09-02', 1, 1),
('2023-09-02', 1, 3),
('2023-09-02', 0, 2)

SELECT * FROM Received

SELECT * FROM Person JOIN Received ON Received.PersonId = Person.Id  WHERE Received.Date_Receiving = '2023-09-03' AND Person.Last_Name = 'qwer1' --WHERE Person.Last_Name = 'qwer1' --ND Customers.LastName = 'qwer';


