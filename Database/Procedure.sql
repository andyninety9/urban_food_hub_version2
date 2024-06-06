CREATE PROCEDURE CopyMealPlanToPersonalPlan (@mealPlanID VARCHAR(255), @accID VARCHAR(255))
AS
BEGIN
    -- Kiểm tra xem mealPlanID có tồn tại trong bảng MealPlan không
    IF NOT EXISTS (SELECT 1 FROM MealPlan WHERE mealPlanID = @mealPlanID)
    BEGIN
        RAISERROR('MealPlanID không tồn tại trong bảng MealPlan.', 16, 1)
        RETURN
    END

    -- Kiểm tra xem accID có tồn tại trong bảng Account không
    IF NOT EXISTS (SELECT 1 FROM Account WHERE accID = @accID)
    BEGIN
        RAISERROR('accID không tồn tại trong bảng Account.', 16, 1)
        RETURN
    END

    -- Bắt đầu giao dịch để đảm bảo tính toàn vẹn dữ liệu
    BEGIN TRANSACTION
    
    -- Tạo ID mới cho PersonalPlan
    DECLARE @newPersonalPlanID VARCHAR(255);
    SET @newPersonalPlanID = NEWID();

    -- Sao chép dữ liệu từ MealPlan sang PersonalPlan
    INSERT INTO PersonalPlan (accID, cateID, planName, planDesc, startDate, endDate, planImg, statusID, mealPlanID)
    SELECT @accID, cateID, planName, planDesc, startDate, endDate, planImg, 1, @newPersonalPlanID
    FROM MealPlan
    WHERE mealPlanID = @mealPlanID;

    -- Sao chép dữ liệu từ MealPlanDetail sang PersonalPlanDetail
    INSERT INTO PersonalPlanDetail (mealPlanID, mealID, mealTimeID, mealDate)
    SELECT @newPersonalPlanID, mealID, mealTimeID, mealDate
    FROM MealPlanDetail
    WHERE mealPlanID = @mealPlanID;

    -- Sao chép CategoryMealPlan sang PersonalCatePlan
    INSERT INTO PersonalCatePlan (cateID, cateName, cateImg)
    SELECT cateID, cateName, cateImg
    FROM CategoryMealPlan
    WHERE cateID IN (SELECT cateID FROM MealPlan WHERE mealPlanID = @mealPlanID);

    -- Commit giao dịch nếu thành công
    COMMIT TRANSACTION

    -- Thông báo sao chép thành công
    PRINT 'Sao chép MealPlan thành công.'
END
GO