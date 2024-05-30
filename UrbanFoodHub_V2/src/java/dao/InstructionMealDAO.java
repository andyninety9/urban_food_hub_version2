/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;

import dto.InstructionMeal;
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
public class InstructionMealDAO {
    public List<InstructionMeal> getInstruction(String mealID) {
	List<InstructionMeal> listInstruction = null;
	String sql = "SELECT [instID]\n" + "      ,[mealID]\n" + "      ,[instrName]\n" + "      ,[instrDesc]\n"
		+ "      ,[createdDate]\n" + "  FROM [dbo].[IntructionMeal]";

	sql += ("WHERE [mealID] = ?");

	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, mealID);
		ResultSet rs = st.executeQuery();
		if (rs != null) {
		    listInstruction = new ArrayList<>();
		    while (rs.next()) {
			InstructionMeal i = new InstructionMeal(rs.getString("instID"), rs.getString("mealID"),
				rs.getString("instrName"), rs.getString("instrDesc"), rs.getDate("createdDate"));
			listInstruction.add(i);
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
	return listInstruction;
    }

    public int addInstruction(String instrID, String instrName, String instrDesc, String mealID) {
	int rs = 0;
	String sql = "INSERT INTO [dbo].[IntructionMeal]\n" + "           ([instID]\n" + "           ,[mealID]\n"
		+ "           ,[instrName]\n" + "           ,[instrDesc]\n" + "           ,[createdDate])\n"
		+ "     VALUES\n" + "           (?\n" + "           ,?\n" + "           ,?\n" + "           ,?\n"
		+ "           ,?)";

	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, instrID);
		st.setString(2, mealID);
		st.setString(3, instrName);
		st.setString(4, instrDesc);
		st.setDate(5, new Date(System.currentTimeMillis()));
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

    public int editNameInstruction(String instrID, String instrName) {
	int rs = 0;
	String sql = "UPDATE [dbo].[IntructionMeal]\n" + "   SET [instrName] = ?\n" + " WHERE [instID] = ?";

	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, instrName);
		st.setString(2, instrID);
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

    public int editDescInstruction(String instrID, String instrDesc) {
	int rs = 0;
	String sql = "UPDATE [dbo].[IntructionMeal]\n" + "   SET [instrDesc] = ?\n" + " WHERE [instID] = ?";

	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, instrDesc);
		st.setString(2, instrID);
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

    public int deleteInstruction(String instrID) {
	int rs = 0;
	String sql = "DELETE FROM [dbo].[IntructionMeal]\n" + "      WHERE [instID] = ?";

	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, instrID);
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
