IF OBJECT_ID(N'dbo.Users', N'U') IS NOT NULL 
BEGIN
	DROP TABLE dbo.Users; 
END
CREATE TABLE dbo.Users
(
    UserNo INT NOT NULL,
    Username INT NOT NULL,
    Email INT NOT NULL,

    CONSTRAINT pk_Users PRIMARY KEY (UserNo)
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
    Email INT NOT NULL, 
    Password INT NOT NULL,     
    AboutMe INT,
    MemberLocation INT, 
    Units INT NOT NULL,     
    ActivityTimePreference INT NOT NULL,
    Height INT NOT NULL, 
    Weight INT NOT NULL,     
    Birthday INT NOT NULL,
    MarketingLanguage INT NOT NULL

CONSTRAINT PK_UserData PRIMARY KEY (Email) 
); 

INSERT INTO dbo.UserData(Email, Password, AboutMe, MemberLocation, Units, ActivityTimePreference, Height, Weight, Birthday, MarketingLanguage)
VALUES('grace@plymouth.ac.uk', 'ISAD123!');
INSERT INTO dbo.UserData(Email, Password, AboutMe, MemberLocation, Units, ActivityTimePreference, Height, Weight, Birthday, MarketingLanguage)
VALUES('tim@plymouth.ac.uk', 'COMP200!');
INSERT INTO dbo.UserData(Email, Password, AboutMe, MemberLocation, Units, ActivityTimePreference, Height, Weight, Birthday, MarketingLanguage)
VALUES('ada@plymouth.ac.uk', 'insercurePassword');

IF OBJECT_ID(N'dbo.FavouriteActivities', N'U') IS NOT NULL 
BEGIN
	DROP TABLE dbo.FavouriteActivities; 
END

CREATE TABLE dbo.FavouriteActivities
(
	ProductId INT IDENTITY(1,1) not null,
	Product_Details VARCHAR (Max) not null,
	Price FLOAT not null,
	Quantity int not null,
	CONSTRAINT PK_FavouriteActivities PRIMARY KEY (ProductId)
);

INSERT INTO dbo.FavouriteActivities(Product_Details, Price, Quantity)
VALUES('Pens - Black biro',0.30, 200);
INSERT INTO dbo.FavouriteActivities(Product_Details, Price, Quantity)
VALUES('Pens - Green biro',0.30, 200);
INSERT INTO dbo.FavouriteActivities(Product_Details, Price, Quantity)
VALUES('Pens - Red biro',0.30, 200);