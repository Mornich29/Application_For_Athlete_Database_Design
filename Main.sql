
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


Create table question
(
QuestionID VARCHAR(5) not null Primary Key,
Question1 VARCHAR(300),
Question2 VARCHAR(300),
Question3 VARCHAR(300),
Question4 VARCHAR(300),
Question5 VARCHAR(300),
Question6 VARCHAR(300),
Question7 VARCHAR(300),
Question8 VARCHAR(300),
Question9 VARCHAR(300),
Question10 VARCHAR(300),
ans0 VARCHAR(100),
ans1 VARCHAR(100),
ans2 VARCHAR(100),
ans3 VARCHAR(100),
ans4 VARCHAR(100),
ans5 VARCHAR(100),
ans6 VARCHAR(100),
ans7 VARCHAR(100),
ans8 VARCHAR(100),
ans9 VARCHAR(100),
ans10 VARCHAR(100),
)

Create Table SleepAns
(
Sleep_Ans_ID VARCHAR(5) not null Primary Key,
Athlete_ID VARCHAR(5) FOREIGN KEY REFERENCES Athlete(Athlete_ID),
Score_Date Date,
firstscore int,
secondscore int,
thirdscore int,
forthscore int,
totalscore int,
Question_ID VARCHAR(5) FOREIGN KEY REFERENCES question(QuestionID)
) ;

Create Table I_PRRS_Score
(
I_PRRS_Score_ID VARCHAR(5) not null Primary Key,
Athlete_ID VARCHAR(5) FOREIGN KEY REFERENCES Athlete(Athlete_ID),
Score_Date Date,
firstscore int,
secondscore int,
thirdscore int,
forthscore int,
fifthscore int,
totalscore float,
Question_ID VARCHAR(5) FOREIGN KEY REFERENCES question(QuestionID)
) ;


Create Table Vas_F
(
Vas_F_Score_ID VARCHAR(5) not null Primary Key,
Athlete_ID VARCHAR(5) FOREIGN KEY REFERENCES Athlete(Athlete_ID),
Score_Date Date,
firstscore int,
secondscore int,
thirdscore int,
forthscore int,
fifthscore int,
sixthscore int,
seventhscore int,
eighthscore int,
ninthscore int,
tenthscore int,
totalscore int,
Question_ID VARCHAR(5) FOREIGN KEY REFERENCES question(QuestionID)
) ;


Create table Psycological_Case
(
Psyco_ID VARCHAR(5) not null Primary Key,
Athlete_ID VARCHAR(5) FOREIGN KEY REFERENCES Athlete(Athlete_ID),
Medical_Staff_ID VARCHAR(5) FOREIGN KEY REFERENCES Medical_Staff(Medical_Staff_ID),
Recovery_Started_Date Date,
Sleep_Quality INT ,
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

BULK INSERT SleepAns
FROM 'C:\Users\Smart\Desktop\DB Design\Main\SleepAns.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
GO

BULK INSERT I_PRRS_Score
FROM 'C:\Users\Smart\Desktop\DB Design\Main\IPANS.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
GO

BULK INSERT Vas_F
FROM 'C:\Users\Smart\Desktop\DB Design\Main\Vasfscore.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
GO

BULK INSERT question
FROM 'C:\Users\Smart\Desktop\DB Design\Main\Question.csv'
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
select * from SleepAns
select * from I_PRRS_Score
select * from Vas_F
select * from question

