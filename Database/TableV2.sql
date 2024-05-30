CREATE DATABASE URBAN_FOOD_HUB_V2

--Authentication
CREATE TABLE RoleAccount(
	roleID INT PRIMARY KEY,
	roleName VARCHAR(50),
)
INSERT INTO RoleAccount(roleID, roleName) VALUES (1, 'Admin');
INSERT INTO RoleAccount(roleID, roleName) VALUES (2, 'User');
--============================================================================
CREATE TABLE StatusAccount(
	statusID INT PRIMARY KEY,
	statusName VARCHAR(50),
)
INSERT INTO StatusAccount(statusID, statusName) VALUES(1, 'Active');
INSERT INTO StatusAccount(statusID, statusName) VALUES(2, 'Frozen');
INSERT INTO StatusAccount(statusID, statusName) VALUES(3, 'Inactive');
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
INSERT INTO Account(accID, firstname, lastname, birthday, email, phone, statusID, createdDate)
VALUES ('ACC260399', 'Anh Duy', 'Mai', '1999-03-26', 'admin@gmail.com', '0918999888', 1, '2024-05-21')
--============================================================================
CREATE TABLE [USER](
	accID VARCHAR(255) PRIMARY KEY,
	username VARCHAR(255) UNIQUE,
	[password] VARCHAR(255) UNIQUE,
	roleID INT DEFAULT 2,
	CONSTRAINT FK_User_Account FOREIGN KEY(accID) REFERENCES Account(accID),
	CONSTRAINT FK_User_RoleAccount FOREIGN KEY(roleID) REFERENCES RoleAccount(roleID)
)
INSERT INTO [User](accID, username, [password], roleID) VALUES('ACC260399', 'admin', 'admin', 1)

--=============================================================================
CREATE TABLE StatusMaterial(
	StatusID INT PRIMARY KEY,
	StatusName VARCHAR(50),
)
INSERT INTO StatusMaterial(StatusID, StatusName) VALUES(1, 'Active');
INSERT INTO StatusMaterial(StatusID, StatusName) VALUES(2, 'Out Of Stock');
INSERT INTO StatusMaterial(StatusID, StatusName) VALUES(3, 'Inactive');
--=============================================================================
CREATE TABLE CategoryMaterial(
	CateID VARCHAR(255) PRIMARY KEY,
	CateName NVARCHAR(255),
	CatgeImg IMAGE,
	CateStatus BIT DEFAULT 1
)
INSERT INTO CategoryMaterial(CateID, CateName, CateStatus) VALUES('C234821', N'Rau củ', 1);
INSERT INTO CategoryMaterial(CateID, CateName, CateStatus) VALUES('C234921', N'Hải sản', 1);
INSERT INTO CategoryMaterial(CateID, CateName, CateStatus) VALUES('C234721', N'Thịt', 1);
INSERT INTO CategoryMaterial(CateID, CateName, CateStatus) VALUES('C234621', N'Trứng', 1);
INSERT INTO CategoryMaterial(CateID, CateName, CateStatus) VALUES('C234021', N'Gia vị', 1);
INSERT INTO CategoryMaterial(CateID, CateName, CateStatus) VALUES('C234521', N'Thực phẩm khô', 1);
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
INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1923948', 'C234921', N'Cá hồi', N'Cá hồi nhập khẩu, tươi, có thể ăn sống. Đóng gói 1 phần 0.5kg', 350000, N'500gram/1 phần',
7000.0, '2024-05-23', '', 1);
INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1223948', 'C234721', N'Sườn bò mỹ', N'Sườn bò tươi, thích hợp chế biến các món nướng', 400000, N'1kg/1 phần',
50, '2024-05-23', '', 1);
INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293948', 'C234821', N'Cải ngọt', N'100% Organic. Trồng tại nông trại Đà Lạt', 45000, N'500gram/1 bó',
70, '2024-05-23', '', 3);
INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293941', 'C234821', N'Hành lá', N'100% Organic. Trồng tại nông trại Đà Lạt', 10000, N'100gram/1 bó',
0, '2024-05-23', '', 2);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293941', 'C234821', N'Hành lá', N'100% Organic. Trồng tại nông trại Đà Lạt', 10000, N'100gram/1 bó', 0, '2024-05-23', '', 2);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293942', 'C234821', N'Rau muống', N'Rau muống sạch. Trồng tại nông trại Củ Chi', 12000, N'200gram/1 bó', 50, '2024-05-23', '', 1);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293943', 'C234821', N'Cải thìa', N'Rau cải thìa tươi ngon. Trồng tại nông trại Đà Lạt', 15000, N'250gram/1 bó', 100, '2024-05-23', '', 1);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293944', 'C234821', N'Dưa leo', N'Dưa leo sạch. Trồng tại nông trại Bình Dương', 18000, N'500gram/1 gói', 75, '2024-05-23', '', 1);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293945', 'C234821', N'Ớt chuông', N'Ớt chuông nhiều màu sắc. Trồng tại nông trại Đà Lạt', 25000, N'300gram/1 gói', 200, '2024-05-23', '', 1);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293946', 'C234821', N'Bí đỏ', N'Bí đỏ ngon ngọt. Trồng tại nông trại Vĩnh Long', 22000, N'1kg/1 quả', 60, '2024-05-23', '', 1);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293947', 'C234821', N'Khoai tây', N'Khoai tây sạch. Trồng tại nông trại Đà Lạt', 27000, N'1kg/1 túi', 120, '2024-05-23', '', 1);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293948', 'C234821', N'Rau dền', N'Rau dền tươi ngon. Trồng tại nông trại Long An', 9000, N'100gram/1 bó', 90, '2024-05-23', '', 1);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293949', 'C234821', N'Bầu', N'Bầu tươi sạch. Trồng tại nông trại Bến Tre', 17000, N'500gram/1 quả', 30, '2024-05-23', '', 1);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293950', 'C234821', N'Bí xanh', N'Bí xanh tươi ngon. Trồng tại nông trại Hải Dương', 20000, N'500gram/1 quả', 40, '2024-05-23', '', 1);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293951', 'C234821', N'Rau mùi', N'Rau mùi tươi sạch. Trồng tại nông trại Đà Lạt', 5000, N'50gram/1 bó', 50, '2024-05-23', '', 1);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293952', 'C234821', N'Rau ngót', N'Rau ngót sạch. Trồng tại nông trại Long An', 10000, N'100gram/1 bó', 110, '2024-05-23', '', 1);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293953', 'C234821', N'Cà chua', N'Cà chua tươi ngon. Trồng tại nông trại Bình Thuận', 15000, N'500gram/1 gói', 95, '2024-05-23', '', 1);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293954', 'C234821', N'Khoai lang', N'Khoai lang sạch. Trồng tại nông trại Tây Ninh', 13000, N'1kg/1 túi', 100, '2024-05-23', '', 1);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293955', 'C234821', N'Mồng tơi', N'Mồng tơi tươi ngon. Trồng tại nông trại Đà Lạt', 9000, N'100gram/1 bó', 70, '2024-05-23', '', 1);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293956', 'C234821', N'Măng tây', N'Măng tây tươi ngon. Trồng tại nông trại Đà Lạt', 30000, N'200gram/1 bó', 80, '2024-05-23', '', 1);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293957', 'C234821', N'Rau mùi tàu', N'Rau mùi tàu sạch. Trồng tại nông trại Tây Ninh', 7000, N'50gram/1 bó', 60, '2024-05-23', '', 1);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293958', 'C234821', N'Bí đao', N'Bí đao sạch. Trồng tại nông trại Long An', 19000, N'1kg/1 quả', 20, '2024-05-23', '', 1);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293959', 'C234821', N'Dậu xanh', N'Dậu xanh tươi ngon. Trồng tại nông trại Đà Lạt', 16000, N'500gram/1 túi', 85, '2024-05-23', '', 1);

INSERT INTO Material(MateSKU, CateID, MateName, MateDesc, Price, PackagingSpec, Stock, CreatedDate, MateImg, MateStatus)
VALUES('SKU1293960', 'C234821', N'Rau diếp cá', N'Rau diếp cá sạch. Trồng tại nông trại Bình Dương', 5000, N'100gram/1 bó', 40, '2024-05-23', '', 1);

CREATE TABLE StatusMeal(
	statusID INT PRIMARY KEY,
	statusName VARCHAR(50) NOT NULL,
)
INSERT INTO StatusMeal(statusID, statusName) VALUES(1, 'Active');
INSERT INTO StatusMeal(statusID, statusName) VALUES(2, 'Out Stock');
INSERT INTO StatusMeal(statusID, statusName) VALUES(3, 'Inactive');

CREATE TABLE CategoryMeal(
	cateID VARCHAR(255) PRIMARY KEY,
	cateName NVARCHAR(255) UNIQUE,
	CatgeImg IMAGE,
	CateStatus BIT DEFAULT 1
)
SELECT * FROM CategoryMeal
DELETE CategoryMeal WHERE cateID = 'CF001234'
INSERT INTO CategoryMeal(cateID, cateName, CatgeImg, CateStatus)
VALUES ('CF001234', N'Bữa sáng', '', 1)

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

INSERT INTO Meal(mealID, CateID, mealName, mealDesc, nutritionValue, shelfLife, preparationTime, price, stock, createdDate, mealImg, statusID)
VALUES ('MEAL0099888', 'CF001234', N'Cơm tấm(sườn-trứng)', N'Món ăn đặc sản Sài Gòn', N'Cung cấp 767 kcal', N'Thời hạn dùng: 3 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 15h mỗi ngày nếu nhận hàng vào sáng hôm sau', N'55000', 20, '2024-05-26', '', 1)

INSERT INTO Meal(mealID, CateID, mealName, mealDesc, nutritionValue, shelfLife, preparationTime, price, stock, createdDate, mealImg, statusID)
VALUES 
('MEAL0099889', 'CF001234', N'Phở bò', N'Món ăn truyền thống Việt Nam', N'Cung cấp 670 kcal', N'Thời hạn dùng: 2 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 14h mỗi ngày nếu nhận hàng vào sáng hôm sau', 60000, 15, '2024-05-26', '', 1),
('MEAL0099890', 'CF001234', N'Bún chả Hà Nội', N'Món ăn đặc sản Hà Nội', N'Cung cấp 630 kcal', N'Thời hạn dùng: 2 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 14h mỗi ngày nếu nhận hàng vào sáng hôm sau', 55000, 25, '2024-05-26', '', 1),
('MEAL0099891', 'CF001234', N'Gỏi cuốn', N'Món ăn nhẹ phổ biến Việt Nam', N'Cung cấp 400 kcal', N'Thời hạn dùng: 1 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 12h mỗi ngày nếu nhận hàng vào chiều hôm sau', 30000, 30, '2024-05-26', '', 1),
('MEAL0099892', 'CF001234', N'Bánh mì thịt nướng', N'Món ăn đường phố Việt Nam', N'Cung cấp 450 kcal', N'Thời hạn dùng: 1 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 12h mỗi ngày nếu nhận hàng vào sáng hôm sau', 25000, 40, '2024-05-26', '', 1),
('MEAL0099893', 'CF001234', N'Cháo gà', N'Món ăn sáng Việt Nam', N'Cung cấp 320 kcal', N'Thời hạn dùng: 2 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 13h mỗi ngày nếu nhận hàng vào sáng hôm sau', 40000, 20, '2024-05-26', '', 1),
('MEAL0099894', 'CF001234', N'Mì Quảng', N'Món ăn đặc sản Quảng Nam', N'Cung cấp 700 kcal', N'Thời hạn dùng: 2 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 14h mỗi ngày nếu nhận hàng vào sáng hôm sau', 55000, 15, '2024-05-26', '', 1),
('MEAL0099895', 'CF001234', N'Cơm chiên dương châu', N'Món ăn phổ biến tại các nhà hàng', N'Cung cấp 550 kcal', N'Thời hạn dùng: 2 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 14h mỗi ngày nếu nhận hàng vào sáng hôm sau', 45000, 25, '2024-05-26', '', 1),
('MEAL0099896', 'CF001234', N'Bánh cuốn', N'Món ăn nhẹ Việt Nam', N'Cung cấp 420 kcal', N'Thời hạn dùng: 1 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 12h mỗi ngày nếu nhận hàng vào chiều hôm sau', 35000, 30, '2024-05-26', '', 1),
('MEAL0099897', 'CF001234', N'Bánh xèo', N'Món ăn đặc sản miền Nam', N'Cung cấp 480 kcal', N'Thời hạn dùng: 1 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 12h mỗi ngày nếu nhận hàng vào chiều hôm sau', 40000, 20, '2024-05-26', '', 1),
('MEAL0099898', 'CF001234', N'Lẩu gà lá é', N'Món ăn đặc sản Đà Lạt', N'Cung cấp 900 kcal', N'Thời hạn dùng: 1 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 15h mỗi ngày nếu nhận hàng vào sáng hôm sau', 70000, 10, '2024-05-26', '', 1),
('MEAL0099899', 'CF001234', N'Bún bò Huế', N'Món ăn đặc sản Huế', N'Cung cấp 760 kcal', N'Thời hạn dùng: 2 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 14h mỗi ngày nếu nhận hàng vào sáng hôm sau', 65000, 15, '2024-05-26', '', 1),
('MEAL0099900', 'CF001234', N'Cơm gà Hội An', N'Món ăn đặc sản Hội An', N'Cung cấp 680 kcal', N'Thời hạn dùng: 2 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 14h mỗi ngày nếu nhận hàng vào sáng hôm sau', 60000, 20, '2024-05-26', '', 1),
('MEAL0099901', 'CF001234', N'Lẩu cá kèo', N'Món ăn đặc sản miền Tây', N'Cung cấp 800 kcal', N'Thời hạn dùng: 1 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 15h mỗi ngày nếu nhận hàng vào sáng hôm sau', 75000, 10, '2024-05-26', '', 1),
('MEAL0099902', 'CF001234', N'Gỏi gà măng cụt', N'Món ăn đặc sản miền Tây', N'Cung cấp 500 kcal', N'Thời hạn dùng: 1 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 13h mỗi ngày nếu nhận hàng vào sáng hôm sau', 55000, 20, '2024-05-26', '', 1),
('MEAL0099903', 'CF001234', N'Cá kho tộ', N'Món ăn gia đình Việt Nam', N'Cung cấp 600 kcal', N'Thời hạn dùng: 2 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 14h mỗi ngày nếu nhận hàng vào sáng hôm sau', 50000, 25, '2024-05-26', '', 1),
('MEAL0099904', 'CF001234', N'Bún thịt nướng', N'Món ăn phổ biến tại các quán ăn', N'Cung cấp 550 kcal', N'Thời hạn dùng: 2 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 14h mỗi ngày nếu nhận hàng vào sáng hôm sau', 45000, 30, '2024-05-26', '', 1),
('MEAL0099905', 'CF001234', N'Chả cá Lã Vọng', N'Món ăn đặc sản Hà Nội', N'Cung cấp 700 kcal', N'Thời hạn dùng: 2 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 14h mỗi ngày nếu nhận hàng vào sáng hôm sau', 60000, 20, '2024-05-26', '', 1),
('MEAL0099906', 'CF001234', N'Cơm hến', N'Món ăn đặc sản Huế', N'Cung cấp 500 kcal', N'Thời hạn dùng: 1 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 12h mỗi ngày nếu nhận hàng vào chiều hôm sau', 40000, 25, '2024-05-26', '', 1),
('MEAL0099907', 'CF001234', N'Nem rán', N'Món ăn truyền thống Việt Nam', N'Cung cấp 600 kcal', N'Thời hạn dùng: 1 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 12h mỗi ngày nếu nhận hàng vào chiều hôm sau', 35000, 30, '2024-05-26', '', 1),
('MEAL0099908', 'CF001234', N'Bún mắm', N'Món ăn đặc sản miền Tây', N'Cung cấp 750 kcal', N'Thời hạn dùng: 2 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 14h mỗi ngày nếu nhận hàng vào sáng hôm sau', 65000, 20, '2024-05-26', '', 1),
('MEAL0099909', 'CF001234', N'Bún mọc', N'Món ăn sáng Việt Nam', N'Cung cấp 500 kcal', N'Thời hạn dùng: 2 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 14h mỗi ngày nếu nhận hàng vào sáng hôm sau', 45000, 25, '2024-05-26', '', 1);



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

INSERT INTO MealDetail(detailID, mealID, materialID, quantity, unitMaterial) VALUES ('DT001234', 'MEAL0099888', 'SKU185681', 1, N'1 miếng sườn 200 gram')
INSERT INTO MealDetail(detailID, mealID, materialID, quantity, unitMaterial) VALUES ('DT001235', 'MEAL0099888', 'SKU359124', 1, N'quả trứng')

CREATE TABLE IntructionMeal(
	instID VARCHAR(255) PRIMARY KEY,
	mealID VARCHAR(255),
	instrName NVARCHAR(255),
	instrDesc NVARCHAR(MAX),
	createdDate DATE,
	CONSTRAINT FK_InstrMeal_Meal FOREIGN KEY(mealID) REFERENCES Meal(mealID)
)