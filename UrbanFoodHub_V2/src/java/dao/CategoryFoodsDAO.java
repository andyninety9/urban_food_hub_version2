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
public class CategoryFoodsDAO {
    public List<Category> getAllFoodCategory() {
	List<Category> list = null;
	String sql = "SELECT [cateID]\n" + "      ,[cateName]\n" + "      ,[CatgeImg]\n" + "      ,[CateStatus]\n"
		+ "  FROM [dbo].[CategoryMeal]";
	sql += " ORDER BY [CateStatus] DESC, [CateName] ASC";
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

    public int changeStatusCategory(String cateID, int status) {
	int rs = 0;
	String sql = "UPDATE [dbo].[CategoryMeal]\n" + "   SET [CateStatus] = ?\n" + " WHERE [CateID] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setInt(1, status);
		st.setString(2, cateID);
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

    public int updateCategory(String cateID, String newName) {
	int rs = 0;
	String sql = "UPDATE [dbo].[CategoryMeal]\n" + "   SET [CateName] = ?\n" + " WHERE [CateID] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, newName);
		st.setString(2, cateID);
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

    public int addCategory(String cateID, String cateName, byte[] cateImg, int status) {
	int rs = 0;
	String sql = "INSERT INTO [dbo].[CategoryMeal]\n" + "           ([CateID]\n" + "           ,[CateName]\n"
		+ "           ,[CatgeImg]\n" + "           ,[CateStatus])\n" + "     VALUES\n" + "           (?\n"
		+ "           ,?\n" + "           ,?\n" + "           ,?)";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, cateID);
		st.setString(2, cateName);
		st.setBytes(3, cateImg);
		st.setInt(4, status);
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
}
