INSERT INTO RoleAccount(roleID, roleName) VALUES (1, 'Admin');
INSERT INTO RoleAccount(roleID, roleName) VALUES (2, 'User');

INSERT INTO StatusAccount(statusID, statusName) VALUES(1, 'Active');
INSERT INTO StatusAccount(statusID, statusName) VALUES(2, 'Frozen');
INSERT INTO StatusAccount(statusID, statusName) VALUES(3, 'Inactive');

INSERT INTO Account(accID, firstname, lastname, birthday, email, phone, statusID, createdDate)
VALUES ('ACC260399', 'Anh Duy', 'Mai', '1999-03-26', 'admin@gmail.com', '0918999888', 1, '2024-05-21')

INSERT INTO [User](accID, username, [password], roleID) VALUES('ACC260399', 'admin', 'admin', 1)

INSERT INTO StatusMaterial(StatusID, StatusName) VALUES(1, 'Active');
INSERT INTO StatusMaterial(StatusID, StatusName) VALUES(2, 'Out Of Stock');
INSERT INTO StatusMaterial(StatusID, StatusName) VALUES(3, 'Inactive');

INSERT INTO CategoryMaterial(CateID, CateName, CateStatus) VALUES('C234821', N'Rau củ', 1);
INSERT INTO CategoryMaterial(CateID, CateName, CateStatus) VALUES('C234921', N'Hải sản', 1);
INSERT INTO CategoryMaterial(CateID, CateName, CateStatus) VALUES('C234721', N'Thịt', 1);
INSERT INTO CategoryMaterial(CateID, CateName, CateStatus) VALUES('C234621', N'Trứng', 1);
INSERT INTO CategoryMaterial(CateID, CateName, CateStatus) VALUES('C234021', N'Gia vị', 1);
INSERT INTO CategoryMaterial(CateID, CateName, CateStatus) VALUES('C234521', N'Thực phẩm khô', 1);

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

INSERT INTO StatusMeal(statusID, statusName) VALUES(1, 'Active');
INSERT INTO StatusMeal(statusID, statusName) VALUES(2, 'Out Stock');
INSERT INTO StatusMeal(statusID, statusName) VALUES(3, 'Inactive');


INSERT INTO CategoryMeal(cateID, cateName, CatgeImg, CateStatus)
VALUES ('CF001234', N'Bữa sáng', '', 1)

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




INSERT INTO MealDetail(detailID, mealID, materialID, quantity, unitMaterial) VALUES ('DT001234', 'MEAL0099888', 'SKU185681', 1, N'1 miếng sườn 200 gram')
INSERT INTO MealDetail(detailID, mealID, materialID, quantity, unitMaterial) VALUES ('DT001235', 'MEAL0099888', 'SKU359124', 1, N'quả trứng')



INSERT INTO MealPlanStatus(statusID, statusName) VALUES(1, 'Public');
INSERT INTO MealPlanStatus(statusID, statusName) VALUES(2, 'Private');

INSERT INTO CategoryMealPlan(cateID, cateName, cateImg) VALUES('CTM000123', N'Thực đơn chay', '')
INSERT INTO CategoryMealPlan(cateID, cateName, cateImg) VALUES('CTM000234', N'Thực hàng ngày', '')
INSERT INTO CategoryMealPlan(cateID, cateName, cateImg) VALUES('CTM000233', N'Thực đơn giảm cân', '')
INSERT INTO CategoryMealPlan(cateID, cateName, cateImg) VALUES('CTM000333', N'Thực đơn tập gym', '')

INSERT INTO MealTimes(id, time_name) VALUES (1, N'Bữa sáng')
INSERT INTO MealTimes(id, time_name) VALUES (2, N'Bữa trưa')
INSERT INTO MealTimes(id, time_name) VALUES (3, N'Bữa tối')



-- Thêm records vào MealPlan
-- Thực đơn 1: Ăn kiêng (Vegetarian) 
INSERT INTO MealPlan(mealPlanID, ownerID, cateID, planName, planDesc, startDate, endDate, planImg, statusID)
VALUES ('MP000001', 'ACC260399', 'CTM000123', N'Thực đơn ăn kiêng', N'Thực đơn ăn kiêng cho người ăn chay', '2024-05-27', '2024-05-31', '', 1);

-- Thực đơn 2: Cho người tập gym (Fit 1)
INSERT INTO MealPlan(mealPlanID, ownerID, cateID, planName, planDesc, startDate, endDate, planImg, statusID)
VALUES ('MP000002', 'ACC260399', 'CTM000234', N'Thực đơn cho người tập gym', N'Thực đơn cung cấp năng lượng cho người tập gym', '2024-05-27', '2024-05-31', '', 1);

-- Thực đơn 3: Bữa ăn hàng ngày 
INSERT INTO MealPlan(mealPlanID, ownerID, cateID, planName, planDesc, startDate, endDate, planImg, statusID)
VALUES ('MP000003', 'ACC260399', NULL, N'Thực đơn hàng ngày', N'Thực đơn cho bữa ăn hàng ngày', '2024-05-27', '2024-05-31', '', 1);

-- Thêm records vào MealPlanDetail

-- Thực đơn 1: Ăn kiêng (Vegetarian) 
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000001', 'MP000001', 'MEAL0000001', 1, '2024-05-27'); -- Bánh mì pate (Bữa sáng, Thứ 2)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000002', 'MP000001', 'MEAL0000003', 2, '2024-05-27'); -- Bún chả cá (Bữa trưa, Thứ 2)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000003', 'MP000001', 'MEAL0000007', 3, '2024-05-27'); -- Cháo gà(Bữa tối, Thứ 2)


-- Thực đơn 2: Cho người tập gym (Fit 1)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000004', 'MP000002', 'MEAL0099888', 1, '2024-05-27'); -- Cơm tấm (Bữa sáng, Thứ 2)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000005', 'MP000002', 'MEAL0099894', 2, '2024-05-27'); -- Mì Quảng (Bữa trưa, Thứ 2)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000006', 'MP000002', 'MEAL0099904', 3, '2024-05-27'); -- Bún thịt nướng (Bữa tối, Thứ 2)


-- Thực đơn 3: Bữa ăn hàng ngày 
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000007', 'MP000003', 'MEAL0000004', 1, '2024-05-27'); -- Mì xào hải sản (Bữa sáng, Thứ 2)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000008', 'MP000003', 'MEAL0099890', 2, '2024-05-27'); -- Bún chả Hà Nội (Bữa trưa, Thứ 2)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000009', 'MP000003', 'MEAL0099903', 3, '2024-05-27'); -- Cá kho tộ (Bữa tối, Thứ 2)


--Thêm records cho ngày Thứ 3
-- Thực đơn 1: Ăn kiêng 
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000010', 'MP000001', 'MEAL0000015', 1, '2024-05-28'); -- Xôi mặn (Bữa sáng, Thứ 3)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000011', 'MP000001', 'MEAL0000016', 2, '2024-05-28'); -- Soup gà (Bữa trưa, Thứ 3)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000012', 'MP000001', 'MEAL0000043', 3, '2024-05-28'); -- Mì Quảng gà (Bữa tối, Thứ 3)


-- Thực đơn 2: Cho người tập gym (Fit 1)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000013', 'MP000002', 'MEAL0000009', 1, '2024-05-28'); -- Bún bò huế (Bữa sáng, Thứ 3)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000014', 'MP000002', 'MEAL0000013', 2, '2024-05-28'); -- Cơm chiên dương châu (Bữa trưa, Thứ 3)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000015', 'MP000002', 'MEAL0000043', 3, '2024-05-28'); -- Mì Quảng gà (Bữa tối, Thứ 3)

-- Thực đơn 3: Bữa ăn hàng ngày 
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000016', 'MP000003', 'MEAL0000002', 1, '2024-05-28'); -- Cháo gà (Bữa sáng, Thứ 3)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000017', 'MP000003', 'MEAL0000019', 2, '2024-05-28'); -- Bún chả Hà Nội (Bữa trưa, Thứ 3)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000018', 'MP000003', 'MEAL0000020', 3, '2024-05-28'); -- Cá kho tộ (Bữa tối, Thứ 3)


--Thêm records cho ngày Thứ 4
-- Thực đơn 1: Ăn kiêng (Vegetarian) 
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000019', 'MP000001', 'MEAL0000006', 1, '2024-05-29'); -- Gỏi cuốn (Bữa sáng, Thứ 4)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000020', 'MP000001', 'MEAL0000018', 2, '2024-05-29'); -- Bánh cuốn (Bữa trưa, Thứ 4)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000021', 'MP000001', 'MEAL0000036', 3, '2024-05-29'); -- Gỏi gà măng cụt (Bữa tối, Thứ 4)

-- Thực đơn 2: Cho người tập gym (Fit 1)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000022', 'MP000002', 'MEAL0000003', 1, '2024-05-29'); -- Cơm tấm (Bữa sáng, Thứ 4)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000023', 'MP000002', 'MEAL0000014', 2, '2024-05-29'); -- Mì Quảng (Bữa trưa, Thứ 4)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000024', 'MP000002', 'MEAL0000018', 3, '2024-05-29'); -- Bún thịt nướng (Bữa tối, Thứ 4)


-- Thực đơn 3: Bữa ăn hàng ngày 
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000025', 'MP000003', 'MEAL0000015', 1, '2024-05-29'); -- Cháo gà (Bữa sáng, Thứ 4)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000026', 'MP000003', 'MEAL0000010', 2, '2024-05-29'); -- Bún chả Hà Nội (Bữa trưa, Thứ 4)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000027', 'MP000003', 'MEAL0000030', 3, '2024-05-29'); -- Cá kho tộ (Bữa tối, Thứ 4)



--Thêm records cho ngày Thứ 5
-- Thực đơn 1: Ăn kiêng (Vegetarian) 
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000028', 'MP000001', 'MEAL0099891', 1, '2024-05-30'); -- Gỏi cuốn (Bữa sáng, Thứ 5)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000029', 'MP000001', 'MEAL0099896', 2, '2024-05-30'); -- Bánh cuốn (Bữa trưa, Thứ 5)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000030', 'MP000001', 'MEAL0099902', 3, '2024-05-30'); -- Gỏi gà măng cụt (Bữa tối, Thứ 5)

-- Thực đơn 2: Cho người tập gym (Fit 1)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000031', 'MP000002', 'MEAL0099888', 1, '2024-05-30'); -- Cơm tấm (Bữa sáng, Thứ 5)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000032', 'MP000002', 'MEAL0099894', 2, '2024-05-30'); -- Mì Quảng (Bữa trưa, Thứ 5)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000033', 'MP000002', 'MEAL0099904', 3, '2024-05-30'); -- Bún thịt nướng (Bữa tối, Thứ 5)

-- Thực đơn 3: Bữa ăn hàng ngày 
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000034', 'MP000003', 'MEAL0099893', 1, '2024-05-30'); -- Cháo gà (Bữa sáng, Thứ 5)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000035', 'MP000003', 'MEAL0099890', 2, '2024-05-30'); -- Bún chả Hà Nội (Bữa trưa, Thứ 5)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000036', 'MP000003', 'MEAL0099903', 3, '2024-05-30'); -- Cá kho tộ (Bữa tối, Thứ 5)


-- Thêm món ăn chay vào bảng Meal
INSERT INTO Meal(mealID, CateID, mealName, mealDesc, nutritionValue, shelfLife, preparationTime, price, stock, createdDate, mealImg, statusID)
VALUES ('MEAL0099910', 'C337948', N'Bún chả chay', N'Món bún chả chay với chả nấm và rau củ', N'Cung cấp 500 kcal', N'Thời hạn dùng: 2 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 14h mỗi ngày nếu nhận hàng vào sáng hôm sau', 45000, 20, '2024-05-26', '', 1),
       ('MEAL0099911', 'C337948', N'Gỏi cuốn chay', N'Gỏi cuốn chay với rau củ và bún', N'Cung cấp 350 kcal', N'Thời hạn dùng: 1 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 12h mỗi ngày nếu nhận hàng vào chiều hôm sau', 30000, 25, '2024-05-26', '', 1),
       ('MEAL0099912', 'C337948', N'Cơm chay', N'Cơm chay với các loại rau củ xào', N'Cung cấp 600 kcal', N'Thời hạn dùng: 2 ngày(Tủ lạnh). Tốt nhất nên dùng trong ngày', N'Đặt trước 14h mỗi ngày nếu nhận hàng vào sáng hôm sau', 40000, 15, '2024-05-26', '', 1);

	   -- Thêm records vào MealPlanDetail cho Thực đơn 1 (Ăn kiêng - Vegetarian)
-- Thứ 6
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000037', 'MP000001', 'MEAL0099910', 1, '2024-05-31'); -- Bún chả chay (Bữa sáng, Thứ 6)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000038', 'MP000001', 'MEAL0099911', 2, '2024-05-31'); -- Gỏi cuốn chay (Bữa trưa, Thứ 6)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000039', 'MP000001', 'MEAL0099912', 3, '2024-05-31'); -- Cơm chay (Bữa tối, Thứ 6)


-- Thêm records vào MealPlanDetail cho Thực đơn 2 (Fit 1)
-- Thứ 6
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000040', 'MP000002', 'MEAL0000003', 1, '2024-05-31'); -- Gỏi cuốn (Bữa sáng, Thứ 6)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000041', 'MP000002', 'MEAL0099896', 2, '2024-05-31'); -- Bánh cuốn (Bữa trưa, Thứ 6)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000042', 'MP000002', 'MEAL0000018', 3, '2024-05-31'); -- Gỏi gà măng cụt (Bữa tối, Thứ 6)

-- Thêm records vào MealPlanDetail cho Thực đơn 3 (Bữa ăn hàng ngày)
-- Thứ 6
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000043', 'MP000003', 'MEAL0000008', 1, '2024-05-31'); -- Cháo gà (Bữa sáng, Thứ 6)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000044', 'MP000003', 'MEAL0000009', 2, '2024-05-31'); -- Bún chả Hà Nội (Bữa trưa, Thứ 6)
INSERT INTO MealPlanDetail(detailID, mealPlanID, mealID, mealTimeID, mealDate)
VALUES ('MPD000045', 'MP000003', 'MEAL0000005', 3, '2024-05-31'); -- Cá kho tộ (Bữa tối, Thứ 6)

SELECT * FROM PersonalPlan