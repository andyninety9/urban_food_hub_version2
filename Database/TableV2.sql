CREATE DATABASE URBAN_FOOD_HUB_V2

--Authentication
CREATE TABLE RoleAccount(
	roleID INT PRIMARY KEY,
	roleName VARCHAR(50),
)

--============================================================================
CREATE TABLE StatusAccount(
	statusID INT PRIMARY KEY,
	statusName VARCHAR(50),
)

--============================================================================
CREATE TABLE Account (
    accID VARCHAR(255) PRIMARY KEY,
    firstname NVARCHAR(255),
    lastname NVARCHAR(255),
    birthday DATE,
    email VARCHAR(255),
    phone VARCHAR(50),
    avatar IMAGE,
    statusID INT DEFAULT 1,
    createdDate DATE,
    email_unique AS (CASE WHEN email IS NULL THEN accID ELSE email END),
    phone_unique AS (CASE WHEN phone IS NULL THEN accID ELSE phone END),
    CONSTRAINT FK_AccInFo_AccStatus FOREIGN KEY (statusID) REFERENCES StatusAccount (statusID),
    CONSTRAINT UQ_email UNIQUE (email_unique),
    CONSTRAINT UQ_phone UNIQUE (phone_unique)
);

--============================================================================
CREATE TABLE [USER](
	accID VARCHAR(255) PRIMARY KEY,
	username VARCHAR(255) UNIQUE,
	[password] VARCHAR(255) UNIQUE,
	roleID INT DEFAULT 2,
	CONSTRAINT FK_User_Account FOREIGN KEY(accID) REFERENCES Account(accID),
	CONSTRAINT FK_User_RoleAccount FOREIGN KEY(roleID) REFERENCES RoleAccount(roleID)
)


--=============================================================================
CREATE TABLE StatusMaterial(
	StatusID INT PRIMARY KEY,
	StatusName VARCHAR(50),
)

--=============================================================================
CREATE TABLE CategoryMaterial(
	CateID VARCHAR(255) PRIMARY KEY,
	CateName NVARCHAR(255),
	CatgeImg IMAGE,
	CateStatus BIT DEFAULT 1
)

--=============================================================================
DROP TABLE Material
CREATE TABLE Material(
	MateSKU VARCHAR(255) PRIMARY KEY,
	CateID VARCHAR(255),
	MateName NVARCHAR(255),
	MateDesc NVARCHAR(255),
	Price FLOAT,
	PackagingSpec NVARCHAR(255),
	Stock FLOAT,
	CreatedDate DATE,
	MateImg IMAGE,
	MateStatus INT,
	CONSTRAINT FK_Mate_MateStatus FOREIGN KEY(MateStatus) REFERENCES StatusMaterial(StatusID),
	CONSTRAINT FK_Mate_MateCate FOREIGN KEY(CateID) REFERENCES CategoryMaterial(CateID),
)


CREATE TABLE StatusMeal(
	statusID INT PRIMARY KEY,
	statusName VARCHAR(50) NOT NULL,
)

CREATE TABLE CategoryMeal(
	cateID VARCHAR(255) PRIMARY KEY,
	cateName NVARCHAR(255) UNIQUE,
	CatgeImg IMAGE,
	CateStatus BIT DEFAULT 1
)


DROP TABLE Meal
CREATE TABLE Meal(
	mealID VARCHAR(255) PRIMARY KEY,
	CateID VARCHAR(255),
	mealName NVARCHAR(255), 
	mealDesc NVARCHAR(1000),
	nutritionValue NVARCHAR(1000),
	shelfLife NVARCHAR(1000),
	preparationTime NVARCHAR(1000),
	price DECIMAL(10, 2) NOT NULL,
	stock INT, 
	createdDate DATE,
	mealImg IMAGE,
	statusID INT,
	CONSTRAINT FK_Meal_CateMeal FOREIGN KEY(CateID) REFERENCES CategoryMeal(cateID),
	CONSTRAINT FK_Meal_StatusMeal FOREIGN KEY(statusID) REFERENCES StatusMeal(statusID)
)

SELECT * FROM Meal


DROP TABLE [dbo].[MealDetail]
CREATE TABLE [dbo].[MealDetail](
	[detailID] [varchar](255) NOT NULL,
	[mealID] [varchar](255) NULL,
	[materialID] [varchar](255) NULL,
	[quantity] [float] NULL,
	[unitMaterial] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MealDetail]  WITH CHECK ADD  CONSTRAINT [FK_MealDetail_Material] FOREIGN KEY([materialID])
REFERENCES [dbo].[Material] ([MateSKU])
GO

ALTER TABLE [dbo].[MealDetail] CHECK CONSTRAINT [FK_MealDetail_Material]
GO

ALTER TABLE [dbo].[MealDetail]  WITH CHECK ADD  CONSTRAINT [FK_MealDetail_Meal] FOREIGN KEY([mealID])
REFERENCES [dbo].[Meal] ([mealID])
GO

ALTER TABLE [dbo].[MealDetail] CHECK CONSTRAINT [FK_MealDetail_Meal]
GO
SELECT * FROM Material


CREATE TABLE IntructionMeal(
	instID VARCHAR(255) PRIMARY KEY,
	mealID VARCHAR(255),
	instrName NVARCHAR(255),
	instrDesc NVARCHAR(MAX),
	createdDate DATE,
	CONSTRAINT FK_InstrMeal_Meal FOREIGN KEY(mealID) REFERENCES Meal(mealID)
)

CREATE TABLE MealPlanStatus(
	statusID INT PRIMARY KEY,
	statusName VARCHAR(255) NOT NULL UNIQUE
)

CREATE TABLE CategoryMealPlan(
	cateID VARCHAR(255) PRIMARY KEY,
	cateName NVARCHAR(255) NOT NULL UNIQUE,
	cateImg VARCHAR(MAX)
)



CREATE TABLE MealPlan(
	mealPlanID VARCHAR(255) PRIMARY KEY,
	cateID VARCHAR(255),
	planName NVARCHAR(255),
	planDesc NVARCHAR(1000),
	startDate DATE,
	endDate DATE, 
	planImg VARCHAR(255),
	statusID INT,
	CONSTRAINT FK_MealPlan_CateMealPlan FOREIGN KEY(cateID) REFERENCES CategoryMealPlan(cateID),
	CONSTRAINT FK_MealPlan_MealPlanStatus FOREIGN KEY(statusID) REFERENCES MealPlanStatus(statusID),
)

CREATE TABLE MealTimes (
    id INT PRIMARY KEY,
    time_name NVARCHAR(10) NOT NULL  -- Ví dụ: 'Sáng', 'Trưa', 'Tối'
);




CREATE TABLE MealPlanDetail(
	detailID VARCHAR(255) PRIMARY KEY,
	mealPlanID VARCHAR(255), 
	mealID VARCHAR(255), 
	mealTimeID INT, 
	mealDate DATE,
	CONSTRAINT FK_PlanDetail_MealPlan FOREIGN KEY(mealPlanID) REFERENCES MealPlan(mealPlanID),
	CONSTRAINT FK_PlanDetail_Meal FOREIGN KEY(mealID) REFERENCES Meal(mealID),
	CONSTRAINT FK_MealPlanDetail_MealTimes FOREIGN KEY (mealTimeID) REFERENCES MealTimes(id)
)


CREATE TABLE PersonalStatusPlan(
	statusID INT PRIMARY KEY,
	statusName VARCHAR(255) NOT NULL UNIQUE
)

CREATE TABLE PersonalCatePlan(
	cateID VARCHAR(255) PRIMARY KEY,
	cateName NVARCHAR(255) NOT NULL UNIQUE,
	cateImg VARCHAR(MAX)
)

CREATE TABLE PersonalPlan(
	mealPlanID VARCHAR(255) PRIMARY KEY,
	accID VARCHAR(255),
	cateID VARCHAR(255),
	planName NVARCHAR(255),
	planDesc NVARCHAR(1000),
	startDate DATE,
	endDate DATE, 
	planImg VARCHAR(255),
	statusID INT,
	CONSTRAINT FK_MealPlan_PersonalCatePlan FOREIGN KEY(cateID) REFERENCES PersonalCatePlan(cateID),
	CONSTRAINT FK_MealPlan_PersonalStatusPlan FOREIGN KEY(statusID) REFERENCES PersonalStatusPlan(statusID),
	CONSTRAINT FK_MealPlan_Account FOREIGN KEY(accID) REFERENCES Account(accID),
)

CREATE TABLE PersonalMealTimes (
    id INT PRIMARY KEY,
    time_name NVARCHAR(10) NOT NULL  -- Ví dụ: 'Sáng', 'Trưa', 'Tối'
);

CREATE TABLE PersonalPlanDetail(
	detailID VARCHAR(255) PRIMARY KEY,
	mealPlanID VARCHAR(255), 
	mealID VARCHAR(255), 
	mealTimeID INT, 
	mealDate DATE,
	CONSTRAINT FK_PlanDetail_PersonalPlan FOREIGN KEY(mealPlanID) REFERENCES PersonalPlan(mealPlanID),
	CONSTRAINT FK_Detail_Meal FOREIGN KEY(mealID) REFERENCES Meal(mealID),
	CONSTRAINT FK_MealPlanDetail_PersonalMealTimes FOREIGN KEY (mealTimeID) REFERENCES PersonalMealTimes(id)
)

