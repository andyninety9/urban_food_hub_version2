/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;

import dto.Address;
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
public class AddressDAO {
    public List<Address> getAllAddressByAccID(String accID) {
	List<Address> list = null;
	String sql = "SELECT [addressID]\n" + "      ,[addressDetail]\n" + "      ,[accID]\n" + "      ,[statusID]\n"
		+ "  FROM [dbo].[AddressDelivery]\n" + "  WHERE [accID] = ? ORDER BY statusID ASC";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setString(1, accID);
	    ResultSet rs = st.executeQuery();
	    if (rs != null) {
		list = new ArrayList<>();
		while (rs.next()) {

		    Address a = new Address();
		    a.setAddressID(rs.getString("addressID"));
		    a.setDetail(rs.getString("addressDetail"));
		    a.setAccID(rs.getString("accID"));
		    a.setStatusID(rs.getInt("statusID"));

		    list.add(a);
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

    public int updateAddressStatus(String addressID, int status) {
	int rs = 0;
	String sql = "UPDATE [dbo].[AddressDelivery]\n" + "   SET [statusID] = ?\n" + " WHERE [addressID] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setInt(1, status);
	    st.setString(2, addressID);
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

    public int updateAddressDetail(String addressID, String detail) {
	int rs = 0;
	String sql = "UPDATE [dbo].[AddressDelivery]\n" + "   SET [addressDetail] = ?\n" + " WHERE [addressID] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setString(1, detail);
	    st.setString(2, addressID);
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

    public int addNewAddress(String addressID, String detail, String accID, int status) {
	int rs = 0;
	String sql = "INSERT INTO [dbo].[AddressDelivery]\n" + "           ([addressID]\n"
		+ "           ,[addressDetail]\n" + "           ,[accID]\n" + "           ,[statusID])\n"
		+ "     VALUES\n" + "           (?\n" + "           ,?\n" + "           ,?\n" + "           ,?)";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setString(1, addressID);
	    st.setString(2, detail);
	    st.setString(3, accID);
	    st.setInt(4, status);
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
