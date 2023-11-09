IF OBJECT_ID(N'dbo.Users', N'U') IS NOT NULL 
BEGIN
	DROP TABLE dbo.Users; 
END
CREATE TABLE dbo.Users
(
    UserNo INT NOT NULL,
    Username CHAR(81) NOT NULL,
    Email VARCHAR(320) NOT NULL,

    CONSTRAINT pk_Users PRIMARY KEY (UserNo),
    FOREIGN KEY (Email) REFERENCES UserData(Email)
);

INSERT INTO dbo.Users (UserNo, Username, Email)
VALUES (1, 'Grace Hopper', 'grace@plymouth.ac.uk');
INSERT INTO dbo.Users (UserNo, Username, Email)
VALUES (2, 'Tim Berners-Lee', 'tim@plymouth.ac.uk');
INSERT INTO dbo.Users (UserNo, Username, Email)
VALUES (3, 'Ada Lovelace', 'ada@plymouth.ac.uk');

IF OBJECT_ID(N'dbo.UserData', N'U') IS NOT NULL 
BEGIN
	DROP TABLE dbo.UserData; 
END

CREATE TABLE dbo.UserData 
( 
    Email VARCHAR(320) NOT NULL, 
    userPassword VARCHAR(Max) NOT NULL,     
    AboutMe VARCHAR(720),
    MemberLocation VARCHAR(Max) NOT NULL, 
    Units CHAR(255) NOT NULL 
        CHECK (Units IN('Imperial', 'Metric')),     
    ActivityTimePreference CHAR(255) NOT NULL
        CHECK (Units IN('Speed', 'Pace')),  
    userHeight INT
        CHECK (100 <= userHeight AND userHeight <= 299), 
    userWeight INT,
        CHECK (23 <= userWeight AND userWeight <= 407), 
    Birthday DATE,
    MarketingLanguage CHAR(255) NOT NULL
        CHECK (Units IN('English (US)', 'English(UK)', 'Dansk (Danmark)','Deutsch (Deutschland)', 'Español (España)', 'Español (Latinoamérica)', 'Français (France)', 'Italiano (Italia)', 'Nederlands (Nederland)', 'Norsk bokmål (Norge)', 'Polski (Polska)', 'Português (Brasil)', 'Português (Portugal)', 'Svenska (Sverige)' )),  

CONSTRAINT PK_UserData PRIMARY KEY (Email) 
); 

INSERT INTO dbo.UserData(Email, userPassword, AboutMe, MemberLocation, Units, ActivityTimePreference, userHeight, userWeight, Birthday, MarketingLanguage)
VALUES('grace@plymouth.ac.uk', 'ISAD123!', NULL , 'Plymouth, Devon, England', 'Metric', 'Pace', NULL, NULL, NULL, 'English(UK)');
INSERT INTO dbo.UserData(Email, userPassword, AboutMe, MemberLocation, Units, ActivityTimePreference, userHeight, userWeight, Birthday, MarketingLanguage)
VALUES('tim@plymouth.ac.uk', 'COMP200!', NULL , 'Plymouth, Devon, England', 'Metric', 'Pace', NULL, NULL, NULL, 'English(UK)');
INSERT INTO dbo.UserData(Email, userPassword, AboutMe, MemberLocation, Units, ActivityTimePreference, userHeight, userWeight, Birthday, MarketingLanguage)
VALUES('ada@plymouth.ac.uk', 'insecurePassword', NULL , 'Plymouth, Devon, England', 'Metric', 'Pace', NULL, NULL, NULL, 'English(UK)');

IF OBJECT_ID(N'dbo.FavouriteActivities', N'U') IS NOT NULL 
BEGIN
	DROP TABLE dbo.FavouriteActivities; 
END

CREATE TABLE dbo.FavouriteActivities
(
	UserNo INT NOT NULL,
	Activities CHAR(255) NOT NULL,
        CHECK (Units IN('Backpacking', 'Bike Touring', 'Bird Watching','Camping', 'Cross-country Skiing', 'Fishing', 'Hiking', 'Horse Riding', 'Mountain Bikiing', 'OHV/Off-road Driving', 'Paddle Sports', 'Road Biking', )),  
	FavouriteActivities FLOAT NOT NULL,

	CONSTRAINT PK_FavouriteActivities PRIMARY KEY (UserNo, Activities)
);

INSERT INTO dbo.FavouriteActivities(UserNo, Activities, FavouriteActivities)
VALUES(1);
INSERT INTO dbo.FavouriteActivities(UserNo, Activities, FavouriteActivities)
VALUES(2);
INSERT INTO dbo.FavouriteActivities(UserNo, Activities, FavouriteActivities)
VALUES(3);