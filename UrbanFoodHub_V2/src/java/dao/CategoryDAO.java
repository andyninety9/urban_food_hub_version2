/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;

import dto.Category;
import java.sql.Connection;
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
public class CategoryDAO {
    public List<Category> getAllCategory() {
	List<Category> list = null;
	String sql = "SELECT [CateID]\n" + "      ,[CateName]\n" + "      ,[CatgeImg]\n" + "      ,[CateStatus]\n"
		+ "  FROM [dbo].[CategoryMaterial]";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		if (rs != null) {
		    list = new ArrayList<>();
		    while (rs.next()) {
			Category c = new Category(rs.getString("CateID"), rs.getString("CateName"),
				rs.getBytes("CatgeImg"), rs.getInt("CateStatus"));
			list.add(c);
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
}
