/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;

import dto.Account;

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
public class AccountDao {

    public Account getAccountByID(String accID) {
	Account account = null;
	String sql = "SELECT [accID]\n" + "      ,[firstname]\n" + "      ,[lastname]\n" + "      ,[birthday]\n"
		+ "      ,[email]\n" + "      ,[phone]\n" + "      ,[avatar]\n" + "      ,[statusID]\n"
		+ "      ,[createdDate]\n" + "  FROM [dbo].[Account]\n";
	Connection cn = null;
	if (accID != null) {
	    sql += "  WHERE [accID] = " + "'" + accID + "'";
	}
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);

		ResultSet rs = st.executeQuery();
		if (rs != null) {
		    while (rs.next()) {
			account = new Account(rs.getString("accID"), rs.getString("firstname"),
				rs.getString("lastname"), rs.getDate("birthday"), rs.getString("email"),
				rs.getString("phone"), rs.getString("avatar"), rs.getInt("statusID"),
				rs.getDate("createdDate"));
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
	return account;
    }

    public List<Account> getAllAccount(String accID) {
	List<Account> listAccount = null;
	String sql = "SELECT [accID]\n" + "      ,[firstname]\n" + "      ,[lastname]\n" + "      ,[birthday]\n"
		+ "      ,[email]\n" + "      ,[phone]\n" + "      ,[avatar]\n" + "      ,[statusID]\n"
		+ "      ,[createdDate]\n" + "  FROM [dbo].[Account]\n";
	Connection cn = null;
	sql += " WHERE 1 > 0";
	if (accID != null) {
	    sql += "  AND [accID] = " + "'" + accID + "'";
	}
	sql += "ORDER BY statusID ASC";
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);

		ResultSet rs = st.executeQuery();
		if (rs != null) {
		    listAccount = new ArrayList<>();
		    while (rs.next()) {
			Account account = new Account(rs.getString("accID"), rs.getString("firstname"),
				rs.getString("lastname"), rs.getDate("birthday"), rs.getString("email"),
				rs.getString("phone"), rs.getString("avatar"), rs.getInt("statusID"),
				rs.getDate("createdDate"));
			listAccount.add(account);
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
	return listAccount;
    }

    public Account getAccountByEmail(String email) {
	Account account = null;
	String sql = "SELECT [accID]\n" + "      ,[firstname]\n" + "      ,[lastname]\n" + "      ,[birthday]\n"
		+ "      ,[email]\n" + "      ,[phone]\n" + "      ,[avatar]\n" + "      ,[statusID]\n"
		+ "      ,[createdDate]\n" + "  FROM [dbo].[Account]\n" + "  WHERE [email] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, email);
		ResultSet rs = st.executeQuery();
		if (rs != null) {
		    while (rs.next()) {
			account = new Account(rs.getString("accID"), rs.getString("firstname"),
				rs.getString("lastname"), rs.getDate("birthday"), rs.getString("email"),
				rs.getString("phone"), rs.getString("avatar"), rs.getInt("statusID"),
				rs.getDate("createdDate"));
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
	return account;
    }

    public Account getAccountByPhone(String phone) {
	Account account = null;
	String sql = "SELECT [accID]\n" + "      ,[firstname]\n" + "      ,[lastname]\n" + "      ,[birthday]\n"
		+ "      ,[email]\n" + "      ,[phone]\n" + "      ,[avatar]\n" + "      ,[statusID]\n"
		+ "      ,[createdDate]\n" + "  FROM [dbo].[Account]\n" + "  WHERE [phone] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, phone);
		ResultSet rs = st.executeQuery();
		if (rs != null) {
		    while (rs.next()) {
			account = new Account(rs.getString("accID"), rs.getString("firstname"),
				rs.getString("lastname"), rs.getDate("birthday"), rs.getString("email"),
				rs.getString("phone"), rs.getString("avatar"), rs.getInt("statusID"),
				rs.getDate("createdDate"));
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
	return account;
    }

    public int registerUserAccount(String accID, String username, String password, int roleID) {
	int rs = 0;
	String sql = "INSERT INTO [dbo].[Account]\n" + "           ([accID]\n" + "           ,[firstname]\n"
		+ "           ,[createdDate])\n" + "     VALUES\n" + "           (?\n" + "           ,?\n"
		+ "           ,?)";
	String sql2 = "INSERT INTO [dbo].[User]\n" + "           ([accID]\n" + "           ,[username]\n"
		+ "           ,[password]\n" + "           ,[roleID])\n" + "     VALUES\n" + "           (?\n"
		+ "           ,?\n" + "           ,?\n" + "           ,?)";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    cn.setAutoCommit(false);
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, accID);
		st.setString(2, "New User");
		st.setDate(3, new Date(System.currentTimeMillis()));
		rs = st.executeUpdate();

		PreparedStatement st2 = cn.prepareStatement(sql2);
		st2.setString(1, accID);
		st2.setString(2, username);
		st2.setString(3, password);
		st2.setInt(4, roleID);
		rs = st2.executeUpdate();

		cn.commit();
	    }
	} catch (Exception e) {
	    if (cn != null) {
		try {
		    cn.rollback();
		} catch (Exception ex) {
		    ex.printStackTrace();
		}
	    }
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

    public int updateAccountInfo(String accID, String firstname, String lastname, String email, String phone,
	    Date dob) {
	int rs = 0;
	String sql = "UPDATE [dbo].[Account]\n" + "   SET [email] = ?\n" + "      ,[phone] = ?\n"
		+ "      ,[firstname] = ?\n" + "      ,[lastname] = ?\n" + "      ,[birthday] = ?\n"
		+ " WHERE [accID] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setString(1, email);
	    st.setString(2, phone);
	    st.setString(3, firstname);
	    st.setString(4, lastname);
	    st.setDate(5, dob);

	    st.setString(6, accID);
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

    public int updateAvatar(String accID, String avatar) {
	int rs = 0;
	String sql = "UPDATE [dbo].[Account]\n" + "   SET [avatar] = ?\n" + " WHERE [accID] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setString(1, avatar);
	    st.setString(2, accID);
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

    public int updateStatus(String accID, int status) {
	int rs = 0;
	String sql = "UPDATE [dbo].[Account]\n" + "   SET [statusID] = ?\n" + " WHERE [accID] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setInt(1, status);
	    st.setString(2, accID);
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
}
