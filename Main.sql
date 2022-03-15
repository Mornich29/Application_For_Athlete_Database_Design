
DROP DATABASE IF EXISTS SportScience;
CREATE DATABASE SportScience;
Use SportScience;

Create Table Sport_Team_Staff
(
Team_Name NVARCHAR(15) not null Primary Key,
Type_Of_Sport NVARCHAR(20),
Founded_Date Date
);


Create table Athlete
(
Athlete_ID VARCHAR(5) not null Primary Key,
FirstName NVARCHAR(15),
LastName NVARCHAR(15),
Ath_Height int,
Ath_Weight float,
Age int,
Gender Char(1),
Sport_Type NVARCHAR(10),
Nationality NVARCHAR(10),
Team_Name NVARCHAR(15) FOREIGN KEY REFERENCES Sport_Team_Staff(Team_Name)
);

Create Table Medical_Staff
(
Medical_Staff_ID VARCHAR(5) not null Primary Key,
FirstName NVARCHAR(15),
LastName NVARCHAR(15),
Branch NVARCHAR(40),
Position NVARCHAR(20),
Phone Varchar(13)
);

Create table Psycological_Case
(
Psyco_ID VARCHAR(5) not null Primary Key,
Athlete_ID VARCHAR(5) FOREIGN KEY REFERENCES Athlete(Athlete_ID),
Medical_Staff_ID VARCHAR(5) FOREIGN KEY REFERENCES Medical_Staff(Medical_Staff_ID),
Recovery_Started_Date Date,
Sleep_Quality INT,
I_PRRS_Score Float,
VAS_F Float,
Recovery_Ended_Date Date
);

Create Table Injury_Case
(
Injury_ID VARCHAR(5) not null Primary Key,
Athlete_ID VARCHAR(5) FOREIGN KEY REFERENCES Athlete(Athlete_ID),
Medical_Staff_ID VARCHAR(5) FOREIGN KEY REFERENCES Medical_Staff(Medical_Staff_ID),
Recovery_Started_Date Date,
Event_Injury NVARCHAR(30),
Body_Part NVARCHAR(30),
Abbreviated_Injury_Scale INT,
Cause_Of_Injury NVARCHAR(50),
Recovery_Ended_Date Date
);

Create Table Illness_Case
(
Illness_Case_ID VARCHAR(5) not null Primary Key,
Athlete_ID VARCHAR(5) FOREIGN KEY REFERENCES Athlete(Athlete_ID),
Medical_Staff_ID VARCHAR(5) FOREIGN KEY REFERENCES Medical_Staff(Medical_Staff_ID),
Recovery_Started_Date Date,
Diagnoses NVARCHAR(30),
Symptom NVARCHAR(50),
Recovery_Ended_Date Date
) ;


 
-- import the file
BULK INSERT Sport_Team_Staff
FROM 'C:\Users\Smart\Desktop\DB Design\Main\Sport_Team.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
GO

BULK INSERT Athlete
FROM 'C:\Users\Smart\Desktop\DB Design\Main\Athlete.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
GO

BULK INSERT Medical_Staff
FROM 'C:\Users\Smart\Desktop\DB Design\Main\Medical_Staff.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
GO

BULK INSERT Psycological_Case
FROM 'C:\Users\Smart\Desktop\DB Design\Main\Psycological_Case.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
GO

BULK INSERT Injury_Case
FROM 'C:\Users\Smart\Desktop\DB Design\Main\Injury.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
GO

BULK INSERT Illness_Case
FROM 'C:\Users\Smart\Desktop\DB Design\Main\Illness.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
GO

select * from Sport_Team_Staff
select * from Athlete
select * from Medical_Staff
select * from Psycological_Case
select * from Illness_Case
select * from Injury_Case
