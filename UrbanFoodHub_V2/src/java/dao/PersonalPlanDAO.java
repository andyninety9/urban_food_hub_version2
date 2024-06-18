/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;

import dto.Meal;
import dto.MealPlan;
import dto.PlanDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.MyLibs;

/**
 *
 * @author duyma
 */
public class PersonalPlanDAO {
    public MealPlan getPersonalPlanByID(String planID) {
	MealPlan ml = null;
	String sql = "SELECT [mealPlanID]\n" + "      ,[accID]\n" + "      ,[planName]\n" + "      ,[planDesc]\n"
		+ "      ,[startDate]\n" + "      ,[endDate]\n" + "      ,[planImg]\n" + "      ,[statusID]\n"
		+ "  FROM [dbo].[PersonalPlan]\n" + "  WHERE mealPlanID = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st1 = cn.prepareStatement(sql);
	    st1.setString(1, planID);
	    ResultSet rs1 = st1.executeQuery();
	    if (rs1 != null) {
		if (rs1.next()) {
		    ml = new MealPlan(planID, rs1.getString("accID"), null, rs1.getString("planName"),
			    rs1.getString("planDesc"), rs1.getDate("startDate"), rs1.getDate("endDate"),
			    rs1.getString("planImg"), rs1.getInt("statusID"), new ArrayList<>(), 0);
		    String sql2 = "SELECT [detailID]\n" + "      ,[mealPlanID]\n" + "      ,[mealID]\n"
			    + "      ,[mealTimeID]\n" + "      ,[mealDate]\n" + "  FROM [dbo].[PersonalPlanDetail]\n"
			    + "  WHERE mealPlanID = ?";
		    PreparedStatement st2 = cn.prepareStatement(sql2);
		    st2.setString(1, planID);
		    ResultSet rs2 = st2.executeQuery();
		    if (rs2 != null) {
			double totalPrice = 0;
			while (rs2.next()) {
			    MealDAO mealDAO = new MealDAO();
			    Meal mealTmp = mealDAO.getMealByID(rs2.getString("mealID"));
			    double price = mealTmp.getPrice();
			    totalPrice += price;
			    PlanDetail pl = new PlanDetail(rs2.getString("detailID"), planID, mealTmp,
				    rs2.getString("mealTimeID"), rs2.getDate("mealDate"));
			    ml.addDetail(pl);
			}
			ml.setPrice(totalPrice);
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
	return ml;
    }

    public boolean addPlantoPersonal(String mealPlanID, String accID) {
	boolean rs = false;
	String sql = "{call CopyMealPlanToPersonalPlan(?, ?)}";
	Connection cn = null;

	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, mealPlanID);
		st.setString(2, accID);
		rs = st.execute();
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
