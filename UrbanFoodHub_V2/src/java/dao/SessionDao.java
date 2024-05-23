/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Calendar;
import utils.MyLibs;

/**
 *
 * @author duyma
 */
public class SessionDao {
    public static void createSession(String sessionID, String accountID) {
	String sql = "INSERT INTO [dbo].[Session]\n" + "           ([SessionID]\n" + "           ,[AccID]\n"
		+ "           ,[CreatedDate]\n" + "           ,[DueDate])\n" + "     VALUES\n" + "           (?\n"
		+ "           ,?\n" + "           ,?\n" + "           ,?)";

	Connection cn;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setString(1, sessionID);
	    st.setString(2, accountID);
	    Timestamp createdDate = new Timestamp(System.currentTimeMillis());
	    st.setTimestamp(3, createdDate);

	    // Tính toán DueDate sau 24 giờ
	    Calendar calendar = Calendar.getInstance();
	    calendar.setTime(createdDate);
	    calendar.add(Calendar.HOUR, 24);
	    Timestamp dueDate = new Timestamp(calendar.getTimeInMillis());

	    st.setTimestamp(4, dueDate);
	    st.executeUpdate();
	} catch (Exception e) {
	    e.printStackTrace();
	}
    }

    public static void removeSession(String sessionID) {
	String removeSql = "DELETE FROM [dbo].[Sessions]\n" + "      WHERE [sessionID] = ?";
	Connection cn;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(removeSql);
	    st.setString(1, sessionID);
	    st.executeUpdate();
	} catch (Exception e) {
	    e.printStackTrace();
	}
    }

    public static boolean isValidSession(String sessionID) {
	String sql = "SELECT [sessionID]\n" + "      ,[accountID]\n" + "      ,[creationTime]\n"
		+ "      ,[lastAccessTime]\n" + "  FROM [dbo].[Sessions]\n" + "  WHERE [sessionID] = ?";

	Connection cn;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setString(1, sessionID);
	    ResultSet rs = st.executeQuery();
	    if (rs.next()) {
		Timestamp dueDate = rs.getTimestamp("DueDate");
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());

		if (dueDate != null && dueDate.after(currentTime)) {
		    // Session is valid
		    return true;
		} else {
		    // Session is expired
		    return false;
		}
	    } else {
		return false;
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	}

	return false;
    }
}
