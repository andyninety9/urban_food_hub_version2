/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;

import dto.Category;
import dto.Meal;
import dto.MealPlan;
import dto.PlanDetail;
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
public class PlanDAO {

    public int addNewDayPlanDetail(String mealPlanID, Date mealDate) {
	int rs = 0;
	String sql = "INSERT INTO [dbo].[MealPlanDetail]\n" + "           ([detailID]\n" + "           ,[mealPlanID]\n"
		+ "           ,[mealTimeID]\n" + "           ,[mealDate])\n" + "     VALUES\n" + "           (?\n"
		+ "           ,?\n" + "           ,?\n" + "           ,?)";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    for (int i = 1; i <= 3; i++) {
		String detailID = MyLibs.generateID("MDP");
		st.setString(1, detailID);
		st.setString(2, mealPlanID);
		st.setInt(3, i);
		st.setDate(4, mealDate);
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

    public int getPlanDetailByDate(String mealPlanID, Date mealDate) {
	int result = 0;
	String sql = "SELECT [detailID]\n" + "      ,[mealPlanID]\n" + "      ,[mealID]\n" + "      ,[mealTimeID]\n"
		+ "      ,[mealDate]\n" + "  FROM [dbo].[MealPlanDetail]\n"
		+ "  WHERE [mealPlanID] = ? AND [mealDate] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setString(1, mealPlanID);
	    st.setDate(2, mealDate);

	    ResultSet rs = st.executeQuery();
	    if (rs != null) {
		while (rs.next()) {
		    result = 1;
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
	return result;
    }

    public int createNewMealPlan(String mealPlanID, String cateID, String planName, String planDesc, Date startDate,
	    Date endDate, String planImg, int statusID) {
	int rs = 0;
	String sql = "INSERT INTO [dbo].[MealPlan]\n" + "           ([mealPlanID]\n" + "           ,[cateID]\n"
		+ "           ,[planName]\n" + "           ,[planDesc]\n" + "           ,[startDate]\n"
		+ "           ,[endDate]\n" + "           ,[planImg]\n" + "           ,[statusID])\n" + "     VALUES\n"
		+ "           (?\n" + "           ,?\n" + "           ,?\n" + "           ,?\n" + "           ,?\n"
		+ "           ,?\n" + "           ,?\n" + "           ,?)";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setString(1, mealPlanID);
	    st.setString(2, cateID);
	    st.setString(3, planName);
	    st.setString(4, planDesc);
	    st.setDate(5, startDate);
	    st.setDate(6, endDate);
	    st.setString(7, planImg);
	    st.setInt(8, statusID);
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

    public List<MealPlan> getMealPlanByCateID(String cateID, int status) {
	List<MealPlan> list = null;
	boolean isSetCateID = false;
	boolean isSetStatus = false;
	String sql1 = "SELECT [mealPlanID]\n" + "      ,[cateID]\n" + "      ,[planName]\n" + "      ,[planDesc]\n"
		+ "      ,[startDate]\n" + "      ,[endDate]\n" + "      ,[planImg]\n" + "      ,[statusID]\n"
		+ "  FROM [dbo].[MealPlan]";
	if (cateID != null || status > 0) {
	    sql1 += (" WHERE");
	    if (cateID != null && status <= 0) {
		sql1 += (" [cateID] = ?");
		isSetCateID = true;
	    } else if (cateID == null && status > 0) {
		sql1 += (" [statusID] = ?");
		isSetStatus = true;
	    } else {
		sql1 += (" [cateID] = ? AND [statusID] = ?");
		isSetStatus = true;
		isSetCateID = true;
	    }
	}
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st1 = cn.prepareStatement(sql1);
		if (isSetCateID) {
		    st1.setString(1, cateID);
		} else if (isSetStatus) {
		    st1.setInt(1, status);
		} else if (isSetCateID && isSetStatus) {
		    st1.setString(1, cateID);
		    st1.setInt(2, status);
		}
		ResultSet rs = st1.executeQuery();
		if (rs != null) {
		    list = new ArrayList<>();
		    while (rs.next()) {
			MealPlan m = new MealPlan();
			String mealPlanID = rs.getString("mealPlanID");
			m.setMealPlanID(mealPlanID);
			m.setCateID(rs.getString("cateID"));
			m.setPlanName(rs.getString("planName"));
			m.setPlanDesc(rs.getString("planDesc"));
			m.setStartDate(rs.getDate("startDate"));
			m.setEndDate(rs.getDate("endDate"));
			m.setPlanImg(rs.getString("planImg"));
			m.setStatusID(rs.getInt("statusID"));

			String sql2 = "SELECT [detailID]\n" + "      ,[mealPlanID]\n" + "      ,[mealID]\n"
				+ "      ,[mealTimeID]\n" + "      ,[mealDate]\n" + "  FROM [dbo].[MealPlanDetail]\n"
				+ "  WHERE [mealPlanID] = ? ORDER BY mealDate ASC , [mealTimeID] ASC";
			PreparedStatement st2 = cn.prepareStatement(sql2);
			st2.setString(1, mealPlanID);
			ResultSet rs2 = st2.executeQuery();
			if (rs2 != null) {
			    while (rs2.next()) {
				PlanDetail p = new PlanDetail();
				String mealID = rs2.getString("mealID");
				p.setDetailID(rs2.getString("detailID"));
				p.setMealPlanID(mealPlanID);
				p.setMealTime(rs2.getString("mealTimeID"));
				p.setMealDate(rs2.getDate("mealDate"));
				String sql3 = "SELECT [mealID]\n" + "      ,[CateID]\n" + "      ,[mealName]\n"
					+ "      ,[mealDesc]\n" + "      ,[nutritionValue]\n" + "      ,[shelfLife]\n"
					+ "      ,[preparationTime]\n" + "      ,[price]\n" + "      ,[stock]\n"
					+ "      ,[createdDate]\n" + "      ,[statusID]\n" + "      ,[mealImg]\n"
					+ "  FROM [dbo].[Meal]\n" + "  WHERE [mealID] = ?";
				PreparedStatement st3 = cn.prepareStatement(sql3);
				st3.setString(1, mealID);
				ResultSet rs3 = st3.executeQuery();
				if (rs3 != null) {
				    if (rs3.next()) {
					Meal meal = new Meal();
					meal.setMealID(rs3.getString("mealID"));
					meal.setMealName(rs3.getString("mealName"));
					meal.setMealDesc(rs3.getString("mealDesc"));
					meal.setNutritionValue(rs3.getString("nutritionValue"));
					meal.setShelfLife(rs3.getString("shelfLife"));
					meal.setPreparationTime(rs3.getString("preparationTime"));
					meal.setPrice(rs3.getInt("price"));
					meal.setStock(rs3.getInt("stock"));
					meal.setCreatedDate(rs3.getDate("createdDate"));
					meal.setStatusID(rs3.getInt("statusID"));
					p.setMeal(meal);
				    }
				}
				m.addDetail(p);
			    }

			}
			list.add(m);
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

    public List<MealPlan> getMealPlanBySearch(String searchKeyword, String cateID, int status) {
	List<MealPlan> list = null;
	boolean isSetSearchKeyword = false;
	boolean isSetCateID = false;
	boolean isSetStatus = false;
	String sql1 = "SELECT [mealPlanID]\n" + "      ,[cateID]\n" + "      ,[planName]\n" + "      ,[planDesc]\n"
		+ "      ,[startDate]\n" + "      ,[endDate]\n" + "      ,[planImg]\n" + "      ,[statusID]\n"
		+ "  FROM [dbo].[MealPlan]";
	if (searchKeyword != null || cateID != null || status > 0) {
	    sql1 += " WHERE";
	    boolean isFirstCondition = true;
	    if (searchKeyword != null) {
		sql1 += " ([planName] LIKE ? OR [mealPlanID] LIKE ? OR [planDesc] LIKE ?)";
		isSetSearchKeyword = true;
		isFirstCondition = false;
	    }
	    if (cateID != null) {
		if (!isFirstCondition)
		    sql1 += " AND";
		sql1 += " [cateID] = ?";
		isSetCateID = true;
		isFirstCondition = false;
	    }
	    if (status > 0) {
		if (!isFirstCondition)
		    sql1 += " AND";
		sql1 += " [statusID] = ?";
		isSetStatus = true;
	    }
	}

	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st1 = cn.prepareStatement(sql1);
		int paramIndex = 1;
		if (isSetSearchKeyword) {
		    st1.setString(paramIndex++, "%" + searchKeyword + "%");
		    st1.setString(paramIndex++, "%" + searchKeyword + "%");
		    st1.setString(paramIndex++, "%" + searchKeyword + "%");
		}
		if (isSetCateID) {
		    st1.setString(paramIndex++, cateID);
		}
		if (isSetStatus) {
		    st1.setInt(paramIndex++, status);
		}
		ResultSet rs = st1.executeQuery();
		if (rs != null) {
		    list = new ArrayList<>();
		    while (rs.next()) {
			MealPlan m = new MealPlan();
			String mealPlanID = rs.getString("mealPlanID");
			m.setMealPlanID(mealPlanID);
			m.setCateID(rs.getString("cateID"));
			m.setPlanName(rs.getString("planName"));
			m.setPlanDesc(rs.getString("planDesc"));
			m.setStartDate(rs.getDate("startDate"));
			m.setEndDate(rs.getDate("endDate"));
			m.setPlanImg(rs.getString("planImg"));
			m.setStatusID(rs.getInt("statusID"));

			String sql2 = "SELECT [detailID]\n" + "      ,[mealPlanID]\n" + "      ,[mealID]\n"
				+ "      ,[mealTimeID]\n" + "      ,[mealDate]\n" + "  FROM [dbo].[MealPlanDetail]\n"
				+ "  WHERE [mealPlanID] = ? ORDER BY mealDate ASC, [mealTimeID] ASC";
			PreparedStatement st2 = cn.prepareStatement(sql2);
			st2.setString(1, mealPlanID);
			ResultSet rs2 = st2.executeQuery();
			if (rs2 != null) {
			    while (rs2.next()) {
				PlanDetail p = new PlanDetail();
				String mealID = rs2.getString("mealID");
				p.setDetailID(rs2.getString("detailID"));
				p.setMealPlanID(mealPlanID);
				p.setMealTime(rs2.getString("mealTimeID"));
				p.setMealDate(rs2.getDate("mealDate"));

				String sql3 = "SELECT [mealID]\n" + "      ,[CateID]\n" + "      ,[mealName]\n"
					+ "      ,[mealDesc]\n" + "      ,[nutritionValue]\n" + "      ,[shelfLife]\n"
					+ "      ,[preparationTime]\n" + "      ,[price]\n" + "      ,[stock]\n"
					+ "      ,[createdDate]\n" + "      ,[statusID]\n" + "      ,[mealImg]\n"
					+ "  FROM [dbo].[Meal]\n" + "  WHERE [mealID] = ?";
				PreparedStatement st3 = cn.prepareStatement(sql3);
				st3.setString(1, mealID);
				ResultSet rs3 = st3.executeQuery();
				if (rs3 != null) {
				    if (rs3.next()) {
					Meal meal = new Meal();
					meal.setMealID(rs3.getString("mealID"));
					meal.setMealName(rs3.getString("mealName"));
					meal.setMealDesc(rs3.getString("mealDesc"));
					meal.setNutritionValue(rs3.getString("nutritionValue"));
					meal.setShelfLife(rs3.getString("shelfLife"));
					meal.setPreparationTime(rs3.getString("preparationTime"));
					meal.setPrice(rs3.getInt("price"));
					meal.setStock(rs3.getInt("stock"));
					meal.setCreatedDate(rs3.getDate("createdDate"));
					meal.setStatusID(rs3.getInt("statusID"));
					p.setMeal(meal);
				    }
				}
				m.addDetail(p);
			    }
			}
			list.add(m);
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

    public MealPlan getMealPlanByID(String mealPlanID) {
	MealPlan mealPlan = null;
	String sql1 = "SELECT [mealPlanID]\n" + "      ,[cateID]\n" + "      ,[planName]\n" + "      ,[planDesc]\n"
		+ "      ,[startDate]\n" + "      ,[endDate]\n" + "      ,[planImg]\n" + "      ,[statusID]\n"
		+ "  FROM [dbo].[MealPlan]\n" + "  WHERE mealPlanID = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st1 = cn.prepareStatement(sql1);
	    st1.setString(1, mealPlanID);
	    ResultSet rs1 = st1.executeQuery();
	    if (rs1.next()) {
		mealPlan = new MealPlan();
		mealPlan.setMealPlanID(mealPlanID);
		mealPlan.setPlanName(rs1.getString("planName"));
		mealPlan.setCategory(rs1.getString("cateID"));
		mealPlan.setPlanDesc(rs1.getString("planDesc"));
		mealPlan.setStartDate(rs1.getDate("startDate"));
		mealPlan.setEndDate(rs1.getDate("endDate"));
		mealPlan.setPlanImg(rs1.getString("planImg"));
		mealPlan.setStatusID(rs1.getInt("statusID"));
		String sql2 = "SELECT [detailID]\n" + "      ,[mealPlanID]\n" + "      ,[mealID]\n"
			+ "      ,[mealTimeID]\n" + "      ,[mealDate]\n" + "  FROM [dbo].[MealPlanDetail]\n"
			+ "  WHERE [mealPlanID] = ? ORDER BY mealDate ASC , [mealTimeID] ASC";
		PreparedStatement st2 = cn.prepareStatement(sql2);
		st2.setString(1, mealPlanID);
		ResultSet rs2 = st2.executeQuery();
		if (rs2 != null) {
		    while (rs2.next()) {
			PlanDetail p = new PlanDetail();
			String mealID = rs2.getString("mealID");
			p.setDetailID(rs2.getString("detailID"));
			p.setMealPlanID(mealPlanID);
			p.setMealTime(rs2.getString("mealTimeID"));
			p.setMealDate(rs2.getDate("mealDate"));
			String sql3 = "SELECT [mealID]\n" + "      ,[CateID]\n" + "      ,[mealName]\n"
				+ "      ,[mealDesc]\n" + "      ,[nutritionValue]\n" + "      ,[shelfLife]\n"
				+ "      ,[preparationTime]\n" + "      ,[price]\n" + "      ,[stock]\n"
				+ "      ,[createdDate]\n" + "      ,[statusID]\n" + "      ,[mealImg]\n"
				+ "  FROM [dbo].[Meal]\n" + "  WHERE [mealID] = ?";
			PreparedStatement st3 = cn.prepareStatement(sql3);
			st3.setString(1, mealID);
			ResultSet rs3 = st3.executeQuery();
			if (rs3 != null) {
			    if (rs3.next()) {
				Meal meal = new Meal();
				meal.setMealID(rs3.getString("mealID"));
				meal.setMealName(rs3.getString("mealName"));
				meal.setMealDesc(rs3.getString("mealDesc"));
				meal.setNutritionValue(rs3.getString("nutritionValue"));
				meal.setShelfLife(rs3.getString("shelfLife"));
				meal.setPreparationTime(rs3.getString("preparationTime"));
				meal.setPrice(rs3.getInt("price"));
				meal.setStock(rs3.getInt("stock"));
				meal.setCreatedDate(rs3.getDate("createdDate"));
				meal.setStatusID(rs3.getInt("statusID"));
				p.setMeal(meal);
			    }
			}
			mealPlan.addDetail(p);
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

	return mealPlan;
    }

    public List<Category> getCategoryList() {
	List<Category> list = null;
	String sql = "SELECT [cateID]\n" + "      ,[cateName]\n" + "      ,[cateImg]\n"
		+ "  FROM [dbo].[CategoryMealPlan]";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    ResultSet rs = st.executeQuery();
	    if (rs != null) {
		list = new ArrayList<>();
		while (rs.next()) {
		    Category c = new Category(rs.getString("cateID"), rs.getString("cateName"), rs.getString("cateImg"),
			    0);
		    list.add(c);
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

    public int updateMealPlanInfo(String cateID, String planName, String planDesc, Date startDate, Date endDate,
	    String mealPlanID) {
	int rs = 0;
	String sql = "UPDATE [dbo].[MealPlan]\n" + "   SET [cateID] = ?\n" + "      ,[planName] = ?\n"
		+ "      ,[planDesc] = ?\n" + "      ,[startDate] = ?\n" + "      ,[endDate] = ?\n"
		+ " WHERE [mealPlanID] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setString(1, cateID);
	    st.setString(2, planName);
	    st.setString(3, planDesc);
	    st.setDate(4, startDate);
	    st.setDate(5, endDate);
	    st.setString(6, mealPlanID);
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

    public int updateMealPlanStatus(int statusID, String mealPlanID) {
	int rs = 0;
	String sql = "UPDATE [dbo].[MealPlan]\n" + "   SET statusID = ?\n" + " WHERE [mealPlanID] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setInt(1, statusID);
	    st.setString(2, mealPlanID);
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

    public int editMealPlanDetail(String detailID, String mealID) {
	int rs = 0;
	String sql = "UPDATE [dbo].[MealPlanDetail]\n" + "   SET [mealID] = ?\n" + " WHERE [detailID] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, mealID);
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

    public int updateDateMeal(String mealID, Date newDate, Date oldDate) {
	int rs = 0;
	String sql1 = "SELECT [detailID]\n" + "      ,[mealPlanID]\n" + "      ,[mealID]\n" + "      ,[mealTimeID]\n"
		+ "      ,[mealDate]\n" + "  FROM [dbo].[MealPlanDetail]\n" + "  WHERE mealPlanID = ? AND mealDate = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st1 = cn.prepareStatement(sql1);
		st1.setString(1, mealID);
		st1.setDate(2, newDate);
		ResultSet rs1 = st1.executeQuery();
		if (!rs1.next()) {
		    String sql = "UPDATE [dbo].[MealPlanDetail]\n" + "   SET [mealDate] = ?\n"
			    + " WHERE mealDate = ? AND mealPlanID = ?";

		    try {
			cn = MyLibs.makeConnection();
			if (cn != null) {
			    PreparedStatement st = cn.prepareStatement(sql);
			    st.setDate(1, newDate);
			    st.setDate(2, oldDate);
			    st.setString(3, mealID);
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

	return rs;
    }

    public int addPersonalPlan(String mealPlanID, String accID, String planName, String desc, Date startDate,
	    Date endDate, String image, int status) {
	int rs = 0;
	String sql = "INSERT INTO [dbo].[PersonalPlan]\n" + "           ([mealPlanID]\n" + "           ,[accID]\n"
		+ "           ,[planName]\n" + "           ,[planDesc]\n" + "           ,[startDate]\n"
		+ "           ,[endDate]\n" + "           ,[planImg]\n" + "           ,[statusID])\n" + "     VALUES\n"
		+ "           (?\n" + "           ,?\n" + "           ,?\n" + "           ,?\n" + "           ,?\n"
		+ "           ,?\n" + "           ,?\n" + "           ,?)";

	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setString(1, mealPlanID);
	    st.setString(2, accID);
	    st.setString(3, planName);
	    st.setString(4, desc);
	    st.setDate(5, startDate);
	    st.setDate(6, endDate);
	    st.setString(7, image);
	    st.setInt(8, status);
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

    public int addPersonalPlanDetail(String detailID, String mealPlanID, String mealID, String mealTimeID,
	    Date mealDate) {
	int rs = 0;
	String sql = "INSERT INTO [dbo].[PersonalPlanDetail]\n" + "           ([detailID]\n"
		+ "           ,[mealPlanID]\n" + "           ,[mealID]\n" + "           ,[mealTimeID]\n"
		+ "           ,[mealDate])\n" + "     VALUES\n" + "           (?\n" + "           ,?\n"
		+ "           ,?\n" + "           ,?\n" + "           ,?)";

	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setString(1, detailID);
	    st.setString(2, mealPlanID);
	    st.setString(3, mealID);
	    st.setString(4, mealTimeID);
	    st.setDate(5, mealDate);
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

    public List<MealPlan> getPersonalPlanByCateID(int status, String accID) {
	List<MealPlan> list = null;
	boolean isSetStatus = false;
	String sql1 = "SELECT [mealPlanID]\n" + "      ,[accID]\n" + "      ,[planName]\n" + "      ,[planDesc]\n"
		+ "      ,[startDate]\n" + "      ,[endDate]\n" + "      ,[planImg]\n" + "      ,[statusID]\n"
		+ "  FROM [dbo].[PersonalPlan]\n" + "  WHERE accID = ? ";

	if (status >= 0) {
	    sql1 += (" AND [statusID] = ?");
	    isSetStatus = true;
	}

	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st1 = cn.prepareStatement(sql1);
		st1.setString(1, accID);
		if (isSetStatus) {
		    st1.setInt(2, status);
		}
		ResultSet rs = st1.executeQuery();
		if (rs != null) {
		    list = new ArrayList<>();
		    while (rs.next()) {
			MealPlan m = new MealPlan();
			String mealPlanID = rs.getString("mealPlanID");
			m.setMealPlanID(mealPlanID);
//			m.setCateID(rs.getString("cateID"));
			m.setPlanName(rs.getString("planName"));
			m.setPlanDesc(rs.getString("planDesc"));
			m.setStartDate(rs.getDate("startDate"));
			m.setEndDate(rs.getDate("endDate"));
			m.setPlanImg(rs.getString("planImg"));
			m.setStatusID(rs.getInt("statusID"));

			String sql2 = "SELECT [detailID]\n" + "      ,[mealPlanID]\n" + "      ,[mealID]\n"
				+ "      ,[mealTimeID]\n" + "      ,[mealDate]\n"
				+ "  FROM [dbo].[PersonalPlanDetail]\n"
				+ "  WHERE [mealPlanID] = ? ORDER BY mealDate ASC , [mealTimeID] ASC";
			PreparedStatement st2 = cn.prepareStatement(sql2);
			st2.setString(1, mealPlanID);
			ResultSet rs2 = st2.executeQuery();
			if (rs2 != null) {
			    while (rs2.next()) {
				PlanDetail p = new PlanDetail();
				String mealID = rs2.getString("mealID");
				p.setDetailID(rs2.getString("detailID"));
				p.setMealPlanID(mealPlanID);
				p.setMealTime(rs2.getString("mealTimeID"));
				p.setMealDate(rs2.getDate("mealDate"));
				String sql3 = "SELECT [mealID]\n" + "      ,[CateID]\n" + "      ,[mealName]\n"
					+ "      ,[mealDesc]\n" + "      ,[nutritionValue]\n" + "      ,[shelfLife]\n"
					+ "      ,[preparationTime]\n" + "      ,[price]\n" + "      ,[stock]\n"
					+ "      ,[createdDate]\n" + "      ,[statusID]\n" + "      ,[mealImg]\n"
					+ "  FROM [dbo].[Meal]\n" + "  WHERE [mealID] = ?";
				PreparedStatement st3 = cn.prepareStatement(sql3);
				st3.setString(1, mealID);
				ResultSet rs3 = st3.executeQuery();
				if (rs3 != null) {
				    if (rs3.next()) {
					Meal meal = new Meal();
					meal.setMealID(rs3.getString("mealID"));
					meal.setMealName(rs3.getString("mealName"));
					meal.setMealDesc(rs3.getString("mealDesc"));
					meal.setNutritionValue(rs3.getString("nutritionValue"));
					meal.setShelfLife(rs3.getString("shelfLife"));
					meal.setPreparationTime(rs3.getString("preparationTime"));
					meal.setPrice(rs3.getInt("price"));
					meal.setStock(rs3.getInt("stock"));
					meal.setCreatedDate(rs3.getDate("createdDate"));
					meal.setStatusID(rs3.getInt("statusID"));
					p.setMeal(meal);
				    }
				}
				m.addDetail(p);
			    }

			}
			list.add(m);
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

    public int updatePersonalPlanName(String planID, String newName) {
	int rs = 0;
	String sql = "UPDATE [dbo].[PersonalPlan]\n" + "   SET [planName] = ?\n" + " WHERE [mealPlanID] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, newName);
		st.setString(2, planID);
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

    public int updatePersonalPlanDate(String planID, Date startDate, Date endDate) {
	int rs = 0;
	String sql = "UPDATE [dbo].[PersonalPlan]\n" + "   SET [startDate] = ?\n" + "      ,[endDate] = ?\n" + "     \n"
		+ " WHERE [mealPlanID] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setDate(1, startDate);
		st.setDate(2, endDate);
		st.setString(3, planID);
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

    public int updatePersonalPlanStatus(String planID, int status) {
	int rs = 0;
	String sql = "UPDATE [dbo].[PersonalPlan]\n" + "   SET [statusID] = ?\n" + " WHERE [mealPlanID] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setInt(1, status);
		st.setString(2, planID);
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

    public int updatePersonalPlanMeal(String detailID, String mealID) {
	int rs = 0;
	String sql = "UPDATE [dbo].[PersonalPlanDetail]\n" + "   SET [mealID] = ?\n" + " WHERE [detailID] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, mealID);
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

    public int updatePersonalDateMeal(String mealID, Date newDate, Date oldDate) {
	int rs = 0;
	String sql1 = "SELECT [detailID]\n" + "      ,[mealPlanID]\n" + "      ,[mealID]\n" + "      ,[mealTimeID]\n"
		+ "      ,[mealDate]\n" + "  FROM [dbo].[PersonalPlanDetail]\n"
		+ "  WHERE mealPlanID = ? AND mealDate = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st1 = cn.prepareStatement(sql1);
		st1.setString(1, mealID);
		st1.setDate(2, newDate);
		ResultSet rs1 = st1.executeQuery();
		if (!rs1.next()) {
		    String sql = "UPDATE [dbo].[PersonalPlanDetail]\n" + "   SET [mealDate] = ?\n"
			    + " WHERE mealDate = ? AND mealPlanID = ?";

		    try {
			cn = MyLibs.makeConnection();
			if (cn != null) {
			    PreparedStatement st = cn.prepareStatement(sql);
			    st.setDate(1, newDate);
			    st.setDate(2, oldDate);
			    st.setString(3, mealID);
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

	return rs;
    }
}
