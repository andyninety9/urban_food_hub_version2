/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;

import dto.Meal;
import dto.MealDetail;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.MyLibs;

/**
 *
 * @author duyma
 */
public class MealDAO {
    public List<Meal> getAllMeal(String cateID) {
	List<Meal> list = new ArrayList<>();
	String sql = "SELECT [mealID]\n" + "      ,[cateName]\n" + "      ,[mealName]\n" + "      ,[mealDesc]\n"
		+ "      ,[nutritionValue]\n" + "      ,[shelfLife]\n" + "      ,[preparationTime]\n"
		+ "      ,[price]\n" + "      ,[stock]\n" + "      ,[createdDate]\n" + "      ,[mealImg]\n"
		+ "      ,[statusID]\n"
		+ "  FROM [dbo].[Meal] INNER JOIN CategoryMeal ON Meal.CateID = CategoryMeal.cateID";
	if (cateID != null && !cateID.equals("all")) {
	    sql += (" WHERE Meal.CateID = '" + cateID + "'");
	}
	sql += " ORDER BY [statusID] ASC, [mealName] ASC, [createdDate] DESC ";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		if (rs != null) {
		    list = new ArrayList<>();
		    while (rs.next()) {
			Meal meal = new Meal();
			String mealID = rs.getString("mealID");
			String cateName = rs.getString("cateName");
			String mealName = rs.getString("mealName");
			String mealDesc = rs.getString("mealDesc");
			String nutritionValue = rs.getString("nutritionValue");
			String shelfLife = rs.getString("shelfLife");
			String preparationTime = rs.getString("preparationTime");
			double price = rs.getDouble("price");
			int stock = rs.getInt("stock");
			Date createdDate = rs.getDate("createdDate");
			String mealImg = rs.getString("mealImg");
			int statusID = rs.getInt("statusID");

			meal.setMealID(mealID);
			meal.setCateName(cateName);
			meal.setMealName(mealName);
			meal.setMealDesc(mealDesc);
			meal.setNutritionValue(nutritionValue);
			meal.setShelfLife(shelfLife);
			meal.setPreparationTime(preparationTime);
			meal.setPrice(price);
			meal.setStock(stock);
			meal.setCreatedDate(createdDate);
			meal.setMealImg(mealImg);
			meal.setStatusID(statusID);
			String sql2 = "SELECT [detailID]\n" + "      ,[mealID]\n" + "      ,[materialID]\n"
				+ "      ,[quantity]\n" + "      ,[unitMaterial]\n" + "  FROM [dbo].[MealDetail]\n"
				+ "  WHERE [mealID] = ?";
			PreparedStatement st2 = cn.prepareStatement(sql2);
			st2.setString(1, mealID);
			ResultSet rs2 = st2.executeQuery();
			if (rs2 != null) {
			    while (rs2.next()) {
				String detailID = rs2.getString("detailID");
				String materialID = rs2.getString("materialID");
				double quantity = rs2.getDouble("quantity");
				String unitMaterial = rs2.getString("unitMaterial");

				meal.addMealDetail(
					new MealDetail(detailID, mealID, materialID, quantity, unitMaterial));

			    }
			}
			list.add(meal);
		    }
		}
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    try {
		if (cn != null) {
		    cn.close();
		}
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}
	return list;
    }

    public List<Meal> getTop10RecommendMeal(String i_cateName) {
	List<Meal> list = new ArrayList<>();
	String sql = "SELECT [mealID]\n" + "      ,[cateName]\n" + "      ,[mealName]\n" + "      ,[mealDesc]\n"
		+ "      ,[nutritionValue]\n" + "      ,[shelfLife]\n" + "      ,[preparationTime]\n"
		+ "      ,[price]\n" + "      ,[stock]\n" + "      ,[createdDate]\n" + "      ,[mealImg]\n"
		+ "      ,[statusID]\n"
		+ "  FROM [dbo].[Meal] INNER JOIN CategoryMeal ON Meal.CateID = CategoryMeal.cateID";
	if (i_cateName != null && !i_cateName.equals("all")) {
	    sql += (" WHERE CategoryMeal.CateName COLLATE SQL_Latin1_General_CP1_CI_AI LIKE ?");
	}
	sql += " ORDER BY [statusID] ASC, [mealName] ASC, [createdDate] DESC ";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, i_cateName);
		ResultSet rs = st.executeQuery();
		if (rs != null) {
		    list = new ArrayList<>();
		    while (rs.next()) {
			Meal meal = new Meal();
			String mealID = rs.getString("mealID");
			String cateName = rs.getString("cateName");
			String mealName = rs.getString("mealName");
			String mealDesc = rs.getString("mealDesc");
			String nutritionValue = rs.getString("nutritionValue");
			String shelfLife = rs.getString("shelfLife");
			String preparationTime = rs.getString("preparationTime");
			double price = rs.getDouble("price");
			int stock = rs.getInt("stock");
			Date createdDate = rs.getDate("createdDate");
			String mealImg = rs.getString("mealImg");
			int statusID = rs.getInt("statusID");

			meal.setMealID(mealID);
			meal.setCateName(cateName);
			meal.setMealName(mealName);
			meal.setMealDesc(mealDesc);
			meal.setNutritionValue(nutritionValue);
			meal.setShelfLife(shelfLife);
			meal.setPreparationTime(preparationTime);
			meal.setPrice(price);
			meal.setStock(stock);
			meal.setCreatedDate(createdDate);
			meal.setMealImg(mealImg);
			meal.setStatusID(statusID);
			String sql2 = "SELECT [detailID]\n" + "      ,[mealID]\n" + "      ,[materialID]\n"
				+ "      ,[quantity]\n" + "      ,[unitMaterial]\n" + "  FROM [dbo].[MealDetail]\n"
				+ "  WHERE [mealID] = ?";
			PreparedStatement st2 = cn.prepareStatement(sql2);
			st2.setString(1, mealID);
			ResultSet rs2 = st2.executeQuery();
			if (rs2 != null) {
			    while (rs2.next()) {
				String detailID = rs2.getString("detailID");
				String materialID = rs2.getString("materialID");
				double quantity = rs2.getDouble("quantity");
				String unitMaterial = rs2.getString("unitMaterial");

				meal.addMealDetail(
					new MealDetail(detailID, mealID, materialID, quantity, unitMaterial));

			    }
			}
			list.add(meal);
		    }
		}
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    try {
		if (cn != null) {
		    cn.close();
		}
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}
	return list;
    }

    public List<Meal> searchMeal(String keyword) {
	List<Meal> list = new ArrayList<>();
	String sql = "SELECT [mealID], [cateName], [mealName], [mealDesc], [nutritionValue], "
		+ "[shelfLife], [preparationTime], [price], [stock], [createdDate], [mealImg], [statusID] "
		+ "FROM [dbo].[Meal] INNER JOIN CategoryMeal ON Meal.CateID = CategoryMeal.cateID "
		+ "WHERE mealName COLLATE SQL_Latin1_General_CP1_CI_AI LIKE ? "
		+ "OR cateName COLLATE SQL_Latin1_General_CP1_CI_AI LIKE ? "
		+ "OR mealID COLLATE SQL_Latin1_General_CP1_CI_AI LIKE ? "
		+ "ORDER BY [statusID] ASC, [mealName] ASC, [createdDate] DESC";

	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		String searchKeyword = "%" + keyword + "%";
		st.setString(1, searchKeyword);
		st.setString(2, searchKeyword);
		st.setString(3, searchKeyword);
		ResultSet rs = st.executeQuery();
		if (rs != null) {
		    while (rs.next()) {
			Meal meal = new Meal();
			meal.setMealID(rs.getString("mealID"));
			meal.setCateName(rs.getString("cateName"));
			meal.setMealName(rs.getString("mealName"));
			meal.setMealDesc(rs.getString("mealDesc"));
			meal.setNutritionValue(rs.getString("nutritionValue"));
			meal.setShelfLife(rs.getString("shelfLife"));
			meal.setPreparationTime(rs.getString("preparationTime"));
			meal.setPrice(rs.getDouble("price"));
			meal.setStock(rs.getInt("stock"));
			meal.setCreatedDate(rs.getDate("createdDate"));
			meal.setMealImg(rs.getString("mealImg"));
			meal.setStatusID(rs.getInt("statusID"));

			String sql2 = "SELECT [detailID], [mealID], [materialID], [quantity], [unitMaterial] "
				+ "FROM [dbo].[MealDetail] WHERE [mealID] = ?";
			PreparedStatement st2 = cn.prepareStatement(sql2);
			st2.setString(1, meal.getMealID());
			ResultSet rs2 = st2.executeQuery();
			if (rs2 != null) {
			    while (rs2.next()) {
				String detailID = rs2.getString("detailID");
				String materialID = rs2.getString("materialID");
				double quantity = rs2.getDouble("quantity");
				String unitMaterial = rs2.getString("unitMaterial");

				meal.addMealDetail(
					new MealDetail(detailID, meal.getMealID(), materialID, quantity, unitMaterial));
			    }
			}
			list.add(meal);
		    }
		}
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    try {
		if (cn != null) {
		    cn.close();
		}
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}
	return list;
    }

    public int addNewMeal(String cateID, String mealName, String mealDesc, String nutritionValue, String shelfLife,
	    String preparationTime, double price, int stock, Date createdDate, String mealImg, int statusID) {
	int rs = 0;
	String sql = "INSERT INTO [dbo].[Meal]\n" + "           ([mealID]\n" + "           ,[CateID]\n"
		+ "           ,[mealName]\n" + "           ,[mealDesc]\n" + "           ,[nutritionValue]\n"
		+ "           ,[shelfLife]\n" + "           ,[preparationTime]\n" + "           ,[price]\n"
		+ "           ,[stock]\n" + "           ,[createdDate]\n" + "           ,[mealImg]\n"
		+ "           ,[statusID])\n" + "     VALUES\n" + "           (?\n" + "           ,?\n"
		+ "           ,?\n" + "           ,?\n" + "           ,?\n" + "           ,?\n" + "           ,?\n"
		+ "           ,?\n" + "           ,?\n" + "           ,?\n" + "           ,?\n" + "           ,?)";
	Connection cn = null;

	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, MyLibs.generateID("MEAL"));
		st.setString(2, cateID);
		st.setString(3, mealName);
		st.setString(4, mealDesc);
		st.setString(5, nutritionValue);
		st.setString(6, shelfLife);
		st.setString(7, preparationTime);
		st.setDouble(8, price);
		st.setInt(9, stock);
		st.setDate(10, createdDate);
		st.setString(11, mealImg);
		st.setInt(12, statusID);
		rs = st.executeUpdate();
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    try {
		if (cn != null) {
		    cn.close();
		}
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}
	return rs;
    }

    public int updateMeal(String mealID, String cateID, String mealName, String mealDesc, String nutritionValue,
	    String shelfLife, String preparationTime, double price, int stock, Date createdDate, String mealImg) {
	int rs = 0;
	String sql = "UPDATE [dbo].[Meal]\n" + "   SET [CateID] = ?\n" + "      ,[mealName] = ?\n"
		+ "      ,[mealDesc] = ?\n" + "      ,[nutritionValue] = ?\n" + "      ,[shelfLife] = ?\n"
		+ "      ,[preparationTime] = ?\n" + "      ,[price] = ?\n" + "      ,[stock] = ?\n"
		+ "      ,[createdDate] = ?\n" + "      ,[mealImg] = ?\n" + " WHERE [mealID] = ?";
	Connection cn = null;

	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, cateID);
		st.setString(2, mealName);
		st.setString(3, mealDesc);
		st.setString(4, nutritionValue);
		st.setString(5, shelfLife);
		st.setString(6, preparationTime);
		st.setDouble(7, price);
		st.setInt(8, stock);
		st.setDate(9, createdDate);
		st.setString(10, mealImg);
		st.setString(11, mealID);
		rs = st.executeUpdate();
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    try {
		if (cn != null) {
		    cn.close();
		}
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}
	return rs;
    }

    public Meal getMealByID(String mealID) {
	Meal meal = null;
	String sql = "SELECT mealID, cateName, mealName, mealDesc, nutritionValue, shelfLife, preparationTime,\n"
		+ "price, stock, createdDate, mealImg, statusID \n"
		+ "FROM Meal INNER JOIN CategoryMeal ON Meal.CateID = CategoryMeal.cateID\n" + "WHERE mealID = ?";

	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, mealID);

		ResultSet rs = st.executeQuery();
		if (rs != null) {
		    meal = new Meal();
		    if (rs.next()) {
			String cateName = rs.getString("cateName");
			String mealName = rs.getString("mealName");
			String mealDesc = rs.getString("mealDesc");
			String nutritionValue = rs.getString("nutritionValue");
			String shelfLife = rs.getString("shelfLife");
			String preparationTime = rs.getString("preparationTime");
			double price = rs.getDouble("price");
			int stock = rs.getInt("stock");
			Date createdDate = rs.getDate("createdDate");
			String mealImg = rs.getString("mealImg");
			int statusID = rs.getInt("statusID");

			meal.setMealID(mealID);
			meal.setCateName(cateName);
			meal.setMealName(mealName);
			meal.setMealDesc(mealDesc);
			meal.setNutritionValue(nutritionValue);
			meal.setShelfLife(shelfLife);
			meal.setPreparationTime(preparationTime);
			meal.setPrice(price);
			meal.setStock(stock);
			meal.setCreatedDate(createdDate);
			meal.setMealImg(mealImg);
			meal.setStatusID(statusID);
			String sql2 = "SELECT [detailID]\n" + "      ,[mealID]\n" + "      ,[materialID]\n"
				+ "      ,[quantity]\n" + "      ,[unitMaterial]\n" + "  FROM [dbo].[MealDetail]\n"
				+ "  WHERE [mealID] = ?";
			PreparedStatement st2 = cn.prepareStatement(sql2);
			st2.setString(1, mealID);
			ResultSet rs2 = st2.executeQuery();
			if (rs2 != null) {
			    while (rs2.next()) {
				String detailID = rs2.getString("detailID");
				String materialID = rs2.getString("materialID");
				double quantity = rs2.getDouble("quantity");
				String unitMaterial = rs2.getString("unitMaterial");

				meal.addMealDetail(
					new MealDetail(detailID, mealID, materialID, quantity, unitMaterial));

			    }
			}
		    }
		}
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    try {
		if (cn != null) {
		    cn.close();
		}
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}
	return meal;
    }

    public int updateStatus(String mateID, int status) {
	int rs = 0;
	String sql = "UPDATE Meal SET statusID = ? WHERE mealID = ?";
	Connection cn = null;

	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setInt(1, status);
		st.setString(2, mateID);
		rs = st.executeUpdate();
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    try {
		if (cn != null) {
		    cn.close();
		}
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}
	return rs;
    }

    public int editQuantityMealDetail(String detailID, double quantity) {
	int rs = 0;
	String sql = "UPDATE [dbo].[MealDetail]\n" + "   SET [quantity] = ?\n" + " WHERE [detailID] = ?";
	Connection cn = null;

	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setDouble(1, quantity);
		st.setString(2, detailID);
		rs = st.executeUpdate();
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    try {
		if (cn != null) {
		    cn.close();
		}
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}
	return rs;
    }

    public int editUnitMealDetail(String detailID, String unit) {
	int rs = 0;
	String sql = "UPDATE [dbo].[MealDetail]\n" + "   SET [unitMaterial] = ?\n" + " WHERE [detailID] = ?";
	Connection cn = null;

	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, unit);
		st.setString(2, detailID);
		rs = st.executeUpdate();
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    try {
		if (cn != null) {
		    cn.close();
		}
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}
	return rs;
    }

    public int addMaterialToMeal(String mealID, String mateID, double quantity, String unit) {
	int rs = 0;
	String sql = "INSERT INTO [dbo].[MealDetail]\n" + "           ([detailID]\n" + "           ,[mealID]\n"
		+ "           ,[materialID]\n" + "           ,[quantity]\n" + "           ,[unitMaterial])\n"
		+ "     VALUES\n" + "           (?\n" + "           ,?\n" + "           ,?\n" + "           ,?\n"
		+ "           ,?)";
	Connection cn = null;

	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, MyLibs.generateID("DT"));
		st.setString(2, mealID);
		st.setString(3, mateID);
		st.setDouble(4, quantity);
		st.setString(5, unit);
		rs = st.executeUpdate();
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    try {
		if (cn != null) {
		    cn.close();
		}
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}
	return rs;
    }

    public int deleteMealDetail(String detailID) {
	int rs = 0;
	String sql = "DELETE FROM [dbo].[MealDetail]\n" + "      WHERE [detailID] = ?";
	Connection cn = null;

	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, detailID);
		rs = st.executeUpdate();
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    try {
		if (cn != null) {
		    cn.close();
		}
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}
	return rs;
    }

    public int updateStockMeal(String mealID, double newStock) {
	int rs = 0;
	String sql = "UPDATE [dbo].[Meal]\n" + "   SET [Stock] = ?\n" + " WHERE [mealID] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setDouble(1, newStock);
	    st.setString(2, mealID);
	    rs = st.executeUpdate();
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    try {
		if (cn != null) {
		    cn.close();
		}
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}
	return rs;
    }

    public List<MealDetail> getMealDetailsById(String mealID) {
	List<MealDetail> list = null;
	String sql = "SELECT [detailID]\n" + "      ,[mealID]\n" + "      ,[materialID]\n" + "      ,[quantity]\n"
		+ "      ,[unitMaterial]\n" + "  FROM [dbo].[MealDetail]\n" + "  WHERE mealID = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setString(1, mealID);
	    ResultSet rs = st.executeQuery();
	    if (rs != null) {
		list = new ArrayList<>();
		while (rs.next()) {
		    MealDetail md = new MealDetail(rs.getString("detailID"), rs.getString("mealID"),
			    rs.getString("materialID"), rs.getInt("quantity"), rs.getString("unitMaterial"));
		    list.add(md);
		}
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    try {
		if (cn != null) {
		    cn.close();
		}
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}
	return list;
    }
}
