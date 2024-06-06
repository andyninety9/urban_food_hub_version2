/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;

import dto.Material;
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
public class MaterialDAO {
    public List<Material> getAllMaterial(String cateID) {
	List<Material> list = null;
	String sql = "SELECT [MateSKU]\n" + "      ,[CateName]\n" + "      ,[MateName]\n" + "      ,[MateDesc]\n"
		+ "      ,[Price]\n" + "      ,[PackagingSpec]\n" + "      ,[Stock]\n" + "      ,[CreatedDate]\n"
		+ "      ,[MateImg]\n" + "      ,[MateStatus] \n"
		+ "	  FROM [Material] INNER JOIN CategoryMaterial ON Material.CateID = CategoryMaterial.CateID";
	if (cateID != null && !cateID.equals("all")) {
	    sql += (" WHERE Material.CateID = '" + cateID + "'");
	}
	sql += " ORDER BY [MateStatus] ASC, [MateName] ASC, [CreatedDate] DESC ";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		if (rs != null) {
		    list = new ArrayList<>();
		    while (rs.next()) {
			Material m = new Material(rs.getString("MateSKU"), rs.getString("CateName"),
				rs.getString("MateName"), rs.getString("MateDesc"), rs.getDouble("Price"),
				rs.getString("PackagingSpec"), rs.getDouble("Stock"), rs.getDate("CreatedDate"),
				rs.getString("MateImg"), rs.getInt("MateStatus"));
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

    public List<Material> getTop10Material() {
	List<Material> list = null;
	String sql = "SELECT TOP 10 [MateSKU]\n" + "      ,[CateName]\n" + "      ,[MateName]\n" + "      ,[MateDesc]\n"
		+ "      ,[Price]\n" + "      ,[PackagingSpec]\n" + "      ,[Stock]\n" + "      ,[CreatedDate]\n"
		+ "      ,[MateImg]\n" + "      ,[MateStatus]\n"
		+ "  FROM [dbo].[Material] INNER JOIN CategoryMaterial \n"
		+ "  ON Material.CateID = CategoryMaterial.CateID\n" + "  ORDER BY [CreatedDate] DESC";

	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		if (rs != null) {
		    list = new ArrayList<>();
		    while (rs.next()) {
			Material m = new Material(rs.getString("MateSKU"), rs.getString("CateName"),
				rs.getString("MateName"), rs.getString("MateDesc"), rs.getDouble("Price"),
				rs.getString("PackagingSpec"), rs.getDouble("Stock"), rs.getDate("CreatedDate"),
				rs.getString("MateImg"), rs.getInt("MateStatus"));
//			System.out.println(m);
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

    public Material getMaterialByID(String mateID) {
	Material m = null;
	String sql = "SELECT [MateSKU]\n" + "      ,[CateName]\n" + "      ,[MateName]\n" + "      ,[MateDesc]\n"
		+ "      ,[Price]\n" + "      ,[PackagingSpec]\n" + "      ,[Stock]\n" + "      ,[CreatedDate]\n"
		+ "      ,[MateImg]\n" + "      ,[MateStatus] \n"
		+ "	  FROM [Material] INNER JOIN CategoryMaterial ON Material.CateID = CategoryMaterial.CateID";
	sql += (" WHERE [MateSKU] = ?");
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, mateID);
		ResultSet rs = st.executeQuery();
		if (rs != null) {
		    if (rs.next()) {
			m = new Material(rs.getString("MateSKU"), rs.getString("CateName"), rs.getString("MateName"),
				rs.getString("MateDesc"), rs.getDouble("Price"), rs.getString("PackagingSpec"),
				rs.getDouble("Stock"), rs.getDate("CreatedDate"), rs.getString("MateImg"),
				rs.getInt("MateStatus"));
//			System.out.println(m);
		    }
		}
	    }
	} catch (

	Exception e) {
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
	return m;
    }

    public int addMaterial(String sku, String cateID, String mateName, String mateDesc, double price, String packaging,
	    double stock, Date createdDate, byte[] mateImg, int mateStatus) {
	String sql = "INSERT INTO [dbo].[Material]\n" + "           ([MateSKU]\n" + "           ,[CateID]\n"
		+ "           ,[MateName]\n" + "           ,[MateDesc]\n" + "           ,[Price]\n"
		+ "           ,[PackagingSpec]\n" + "           ,[Stock]\n" + "           ,[CreatedDate]\n"
		+ "           ,[MateImg]\n" + "           ,[MateStatus])\n" + "     VALUES\n" + "           (?\n"
		+ "           ,?\n" + "           ,?\n" + "           ,?\n" + "           ,?\n" + "           ,?\n"
		+ "           ,?\n" + "           ,?\n" + "           ,?\n" + "           ,?)";
	Connection cn = null;
	int rs = 0;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setString(1, sku);
		st.setString(2, cateID);
		st.setString(3, mateName);
		st.setString(4, mateDesc);
		st.setDouble(5, price);
		st.setString(6, packaging);
		st.setDouble(7, stock);
		st.setDate(8, createdDate);
		st.setBytes(9, mateImg);
		st.setInt(10, mateStatus);
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

    public int updateMaterial(String sku, String cateID, String mateName, String mateDesc, double price,
	    String packaging, double stock, Date createdDate, String mateImg) {
	String sql = "UPDATE [dbo].[Material]\n" + "   SET [CateID] = ?\n" + "      ,[MateName] = ?\n"
		+ "      ,[MateDesc] = ?\n" + "      ,[Price] = ?\n" + "      ,[PackagingSpec] = ?\n"
		+ "      ,[Stock] = ?\n" + "      ,[CreatedDate] = ?\n" + "      ,[MateImg] = ?\n"
		+ " WHERE [MateSKU] = ?";
	Connection cn = null;
	int rs = 0;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);

		st.setString(1, cateID);
		st.setString(2, mateName);
		st.setString(3, mateDesc);
		st.setDouble(4, price);
		st.setString(5, packaging);
		st.setDouble(6, stock);
		st.setDate(7, createdDate);
		st.setString(8, mateImg);
		st.setString(9, sku);
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

    public int updateStatus(String mateID, int status) {
	int rs = 0;
	String sql = "UPDATE [dbo].[Material]\n" + "   SET [MateStatus] = ?\n" + " WHERE [MateSKU] = ?";
	Connection cn = null;

	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		st.setInt(1, status);
		st.setString(2, mateID);
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

    public List<Material> getListByPage(List<Material> list, int start, int end) {
	List<Material> result = new ArrayList<>();
	for (int i = start; i < end; i++) {
	    result.add(list.get(i));
	}
	return result;
    }

    public List<Material> searchMaterial(String keyword) {
	List<Material> list = null;
	String sql = "SELECT [MateSKU]\n" + "      ,[CateName]\n" + "      ,[MateName]\n" + "      ,[MateDesc]\n"
		+ "      ,[Price]\n" + "      ,[PackagingSpec]\n" + "      ,[Stock]\n" + "      ,[CreatedDate]\n"
		+ "      ,[MateImg]\n" + "      ,[MateStatus]\n"
		+ "  FROM [dbo].[Material] INNER JOIN CategoryMaterial ON Material.CateID = CategoryMaterial.CateID"
		+ "  WHERE [MateSKU] COLLATE SQL_Latin1_General_CP1_CI_AI LIKE '%' + ? + '%'\n"
		+ "     OR [MateName] COLLATE SQL_Latin1_General_CP1_CI_AI LIKE '%' + ? + '%'\n"
		+ "     OR [CateName] COLLATE SQL_Latin1_General_CP1_CI_AI LIKE '%' + ? + '%'\n";
	sql += " ORDER BY [MateStatus] ASC, [MateName] ASC, [CreatedDate] DESC ";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    if (cn != null) {
		PreparedStatement st = cn.prepareStatement(sql);
		for (int i = 1; i <= 3; i++) {
		    st.setString(i, keyword);
		}
		ResultSet rs = st.executeQuery();
		if (rs != null) {
		    list = new ArrayList<>();
		    while (rs.next()) {
			Material m = new Material(rs.getString("MateSKU"), rs.getString("CateName"),
				rs.getString("MateName"), rs.getString("MateDesc"), rs.getDouble("Price"),
				rs.getString("PackagingSpec"), rs.getDouble("Stock"), rs.getDate("CreatedDate"),
				rs.getString("MateImg"), rs.getInt("MateStatus"));
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

}
