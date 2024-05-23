/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;

import dto.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.MyLibs;

/**
 *
 * @author duyma
 */
public class UserDAO {

    public User getUser(String username, String password) {
	String sql = "SELECT [accID]\n" + "      ,[username]\n" + "      ,[password]\n" + "      ,[roleID]\n"
		+ "  FROM [dbo].[User]\n"
		+ "  WHERE [username] = ? AND [password] = ? COLLATE SQL_Latin1_General_CP1_CS_AS";
	User user = null;
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, username);
		st.setString(2, password);
		ResultSet rs = st.executeQuery();
		if (rs != null && rs.next()) {
		    user = new User(rs.getString("accID"), rs.getString("username"), rs.getString("password"),
			    rs.getInt("roleID"));
		}
	    }
	} catch (Exception e) {
	    System.out.println(">>" + e.getMessage());
	} finally {
	    try {
		if (cn != null) {
		    cn.close();
		}
	    } catch (SQLException e) {
		System.out.println(">>" + e.getMessage());
	    }
	}
	return user;
    }

    public User getUserByUsername(String username) {
	String sql = "SELECT [accID]\n" + "      ,[username]\n" + "      ,[password], [roleID]\n"
		+ "  FROM [dbo].[User]\n" + "  WHERE [username] = ?";
	User user = null;
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, username);
		ResultSet rs = st.executeQuery();
		if (rs != null && rs.next()) {
		    user = new User(rs.getString("accID"), rs.getString("username"), rs.getString("password"),
			    rs.getInt("roleID"));
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
	return user;
    }

    public User getUserByIDAndPass(String accID, String password) {
	String sql = "SELECT [accID]\n" + "      ,[username]\n" + "      ,[password]\n" + "      ,[roleID]\n"
		+ "  FROM [dbo].[User]\n"
		+ "  WHERE [accID] = ? AND [password] = ? COLLATE SQL_Latin1_General_CP1_CS_AS";
	Connection cn = null;
	User user = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, accID);
		st.setString(2, password);
		ResultSet rs = st.executeQuery();
		if (rs != null && rs.next()) {
		    user = new User(rs.getString("accID"), rs.getString("username"), rs.getString("password"),
			    rs.getInt("roleID"));
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
	return user;
    }

    public int updatePassword(String accID, String newPassword) {
	int rs = 0;
	String sql = "UPDATE [dbo].[User]\n" + "   SET \n" + "      [password] = ?\n" + " WHERE [accID] = ?";
	Connection cn;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setString(1, newPassword);
	    st.setString(2, accID);

	    rs = st.executeUpdate();

	} catch (Exception e) {
	    e.printStackTrace();
	}

	return rs;
    }

}
