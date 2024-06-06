/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import utils.MyLibs;

/**
 *
 * @author duyma
 */
public class PersonalPlanDAO {
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
