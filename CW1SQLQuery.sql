IF OBJECT_ID('CW1.[Favourite_Activities]', 'V') IS NOT NULL
    DROP VIEW CW1.[Favourite_Activities];
GO

-- Drop the UsersData table if it exists
IF OBJECT_ID(N'CW1.UserData', N'U') IS NOT NULL 
BEGIN
    DROP TABLE CW1.UserData; 
END

-- Drop the FavouriteActivities table if it exists
IF OBJECT_ID(N'CW1.FavouriteActivities', N'U') IS NOT NULL 
BEGIN
    DROP TABLE CW1.FavouriteActivities; 
END

-- Drop the Users table if it exists
IF OBJECT_ID(N'CW1.Users', N'U') IS NOT NULL 
BEGIN
    DROP TABLE CW1.Users; 
END

-- Create Users table
CREATE TABLE CW1.Users
(
    UserNo INT NOT NULL IDENTITY(1,1),
    Username CHAR(81) NOT NULL,
    Email VARCHAR(320) NOT NULL,
    userPassword VARCHAR(Max) NOT NULL, 

    CONSTRAINT pk_Users PRIMARY KEY (UserNo),
    CONSTRAINT UQ_Email UNIQUE (Email) -- Assuming Email is unique for each user
);
SET IDENTITY_INSERT CW1.Users ON;


-- Insert into Users table
INSERT INTO CW1.Users (UserNo, Username, Email, userPassword)
VALUES (1, 'Grace Hopper', 'grace@plymouth.ac.uk', 'ISAD123!');
INSERT INTO CW1.Users (UserNo, Username, Email, userPassword)
VALUES (2, 'Tim Berners-Lee', 'tim@plymouth.ac.uk', 'COMP2000!');
INSERT INTO CW1.Users (UserNo, Username, Email, userPassword)
VALUES (3, 'Ada Lovelace', 'ada@plymouth.ac.uk', 'insecurePassword');

-- Create UserData table
CREATE TABLE CW1.UserData 
( 
    Email VARCHAR(320) NOT NULL,   
    AboutMe VARCHAR(720) DEFAULT NULL,
    MemberLocation VARCHAR(Max) NOT NULL DEFAULT 'Plymouth, Devon, England', 
    Units CHAR(255) NOT NULL DEFAULT 'Metric'
        CHECK (Units IN('Imperial', 'Metric')),     
    ActivityTimePreference CHAR(255) NOT NULL DEFAULT 'Pace'
        CHECK (ActivityTimePreference IN('Speed', 'Pace')),
    userHeight INT DEFAULT NULL
        CHECK (100 <= userHeight AND userHeight <= 299), 
    userWeight INT DEFAULT NULL
        CHECK (23 <= userWeight AND userWeight <= 407), 
    Birthday DATE DEFAULT NULL,
    MarketingLanguage CHAR(255) NOT NULL DEFAULT 'English(UK)'
        CHECK (MarketingLanguage IN('English (US)', 'English(UK)', 'Dansk (Danmark)','Deutsch (Deutschland)', 'Español (España)', 'Español (Latinoamérica)', 'Français (France)', 'Italiano (Italia)', 'Nederlands (Nederland)', 'Norsk bokmål (Norge)', 'Polski (Polska)', 'Português (Brasil)', 'Português (Portugal)', 'Svenska (Sverige)' )),  

    CONSTRAINT PK_UserData PRIMARY KEY (Email),
    CONSTRAINT FK_UserData_Users FOREIGN KEY (Email) REFERENCES CW1.Users (Email)
); 


-- Insert into UserData table
INSERT INTO CW1.UserData(Email)
VALUES('grace@plymouth.ac.uk');
INSERT INTO CW1.UserData(Email)
VALUES('tim@plymouth.ac.uk');
INSERT INTO CW1.UserData(Email)
VALUES('ada@plymouth.ac.uk');

-- SET IDENTITY_INSERT CW1.FavouriteActivities ON;

-- Create FavouriteActivities table
CREATE TABLE CW1.FavouriteActivities
(
    UserNo INT NOT NULL,
    Activities CHAR(255) NOT NULL DEFAULT 'Backpacking',
    CHECK (Activities IN('Backpacking', 'Bike Touring', 'Bird Watching','Camping', 'Cross-country Skiing', 'Fishing', 'Hiking', 'Horse Riding', 'Mountain Biking', 'OHV/Off-road Driving', 'Paddle Sports', 'Road Biking', 'Rock Climbing', 'Running', 'Scenic Driving', 'Skiing', 'Snowshoeing', 'Via Ferrata', 'Walking')),  
    FavouriteActivities BIT NOT NULL DEFAULT 0,
    CHECK (FavouriteActivities IN (0, 1)),
    CONSTRAINT PK_FavouriteActivities PRIMARY KEY (UserNo, Activities),
    CONSTRAINT FK_FavouriteActivities_Users FOREIGN KEY (UserNo) REFERENCES CW1.Users (UserNo)
);


-- Insert into FavouriteActivities table
INSERT INTO CW1.FavouriteActivities(UserNo, Activities, FavouriteActivities)
VALUES
(1,'Backpacking', 0),
(1,'Bike Touring', 1),
(1,'Bird Watching', 0),
(1,'Camping', 0),
(1,'Cross-country Skiing', 0),
(1,'Fishing', 0),
(1,'Hiking', 0),
(1,'Horse Riding', 0),
(1,'Mountain Biking', 0),
(1,'OHV/Off-road Driving', 0),
(1,'Paddle Sports', 0),
(1,'Road Biking', 0),
(1,'Running', 0),
(1,'Scenic Driving', 0),
(1,'Skiing', 0),
(1,'Snowshoeing', 0),
(1,'Via Ferrata', 0),
(1,'Walking', 0),

(2,'Backpacking', 0),
(2,'Bike Touring', 1),
(2,'Bird Watching', 0),
(2,'Camping', 0),
(2,'Cross-country Skiing', 1),
(2,'Fishing', 1),
(2,'Hiking', 0),
(2,'Horse Riding', 0),
(2,'Mountain Biking', 0),
(2,'OHV/Off-road Driving', 0),
(2,'Paddle Sports', 0),
(2,'Road Biking', 0),
(2,'Running', 0),
(2,'Scenic Driving', 0),
(2,'Skiing', 0),
(2,'Snowshoeing', 1),
(2,'Via Ferrata', 0),
(2,'Walking', 0),

(3,'Backpacking', 0),
(3,'Bike Touring', 0),
(3,'Bird Watching', 0),
(3,'Camping', 0),
(3,'Cross-country Skiing', 1),
(3,'Fishing', 0),
(3,'Hiking', 0),
(3,'Horse Riding', 0),
(3,'Mountain Biking', 0),
(3,'OHV/Off-road Driving', 0),
(3,'Paddle Sports', 0),
(3,'Road Biking', 0),
(3,'Running', 0),
(3,'Scenic Driving', 0),
(3,'Skiing', 0),
(3,'Snowshoeing', 1),
(3,'Via Ferrata', 0),
(3,'Walking', 0);

--Index

CREATE INDEX IX_UserNo_Email ON CW1.Users (UserNo, Email);

-- View

IF OBJECT_ID('CW1.[Favourite_Activities]', 'V') IS NOT NULL
    DROP VIEW CW1.[Favourite_Activities];
GO

CREATE VIEW CW1.[Favourite_Activities] AS
SELECT u.UserNo, u.Username, fa.Activities
FROM CW1.Users u
JOIN CW1.FavouriteActivities fa ON u.UserNo = fa.UserNo
WHERE fa.FavouriteActivities = 1;

--Triggers


