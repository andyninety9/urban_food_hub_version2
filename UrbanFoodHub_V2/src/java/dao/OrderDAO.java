/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;

import dto.Order;
import dto.OrderDetail;
import dto.Product;
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
public class OrderDAO {

    public int addNewOrder(String orderID, String accID, Date orederDate, int StatusID, String deliveryAddID) {
	int rs = 0;
	String sql = "INSERT INTO [dbo].[Order]\n" + "           ([orderID]\n" + "           ,[accID]\n"
		+ "           ,[orderDate]\n" + "           ,[statusID]\n" + "           ,[deliveryAddID])\n"
		+ "     VALUES\n" + "           (?\n" + "           ,?\n" + "           ,?\n" + "           ,?\n"
		+ "           ,?)";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setString(1, orderID);
	    st.setString(2, accID);
	    st.setDate(3, orederDate);
	    st.setInt(4, StatusID);
	    st.setString(5, deliveryAddID);
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

    public int addOrderDetail(String orderDetailID, String orderID, String productID, int quantity, double unitPrice,
	    int typeID) {
	int rs = 0;
	String sql = "INSERT INTO [dbo].[OrderDetail]\n" + "           ([oDetailID]\n" + "           ,[orderID]\n"
		+ "           ,[productID]\n" + "           ,[quantity]\n" + "           ,[unitPrice]\n"
		+ "           ,[typeID])\n" + "     VALUES\n" + "           (?\n" + "           ,?\n"
		+ "           ,?\n" + "           ,?\n" + "           ,?\n" + "           ,?)";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setString(1, orderDetailID);
	    st.setString(2, orderID);
	    st.setString(3, productID);
	    st.setInt(4, quantity);
	    st.setDouble(5, unitPrice);
	    st.setInt(6, typeID);
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

    public List<Order> getAllOrderByAccID(String accID, int i_statusID) {
	List<Order> listOrder = null;
	boolean isStatusID = false;
	String sql1 = "SELECT [orderID]\n" + "      ,[accID]\n" + "      ,[orderDate]\n" + "      ,[statusID]\n"
		+ "      ,[deliveryAddID]\n" + "  FROM [dbo].[Order]\n" + "  WHERE [accID] = ?";
	if (i_statusID != 0) {
	    sql1 += " AND [statusID] = ?";
	    isStatusID = true;
	}
	sql1 += " ORDER BY statusID ASC, orderDate ASC";
	Connection cn = null;

	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st1 = cn.prepareStatement(sql1);
	    st1.setString(1, accID);
	    if (isStatusID) {
		st1.setInt(2, i_statusID);
	    }
	    ResultSet rs1 = st1.executeQuery();
	    if (rs1 != null) {
		listOrder = new ArrayList<>();
		while (rs1.next()) {
		    Order ord = new Order();
		    String orderID = rs1.getString("orderID");
		    Date orderDate = rs1.getDate("orderDate");
		    int statusID = rs1.getInt("statusID");
		    String deliveryAddID = rs1.getString("deliveryAddID");
		    ord.setOrderID(orderID);
		    ord.setAccID(accID);
		    ord.setOrderDate(orderDate);
		    ord.setStatusID(statusID);
		    ord.setDeliveryAddID(deliveryAddID);

		    String sql2 = "SELECT [oDetailID]\n" + "      ,[orderID]\n" + "      ,[productID]\n"
			    + "      ,[quantity]\n" + "      ,[unitPrice]\n" + "      ,[typeID]\n"
			    + "  FROM [dbo].[OrderDetail]\n" + "  WHERE orderID = ?";

		    PreparedStatement st2 = cn.prepareStatement(sql2);
		    st2.setString(1, orderID);
		    ResultSet rs2 = st2.executeQuery();
		    if (rs2 != null) {
			while (rs2.next()) {
			    OrderDetail ordDetail = new OrderDetail();
			    String ordDetailID = rs2.getString("oDetailID");
			    String productID = rs2.getString("productID");
			    int quantity = rs2.getInt("quantity");
			    double unitPrice = rs2.getDouble("unitPrice");
			    int typeID = rs2.getInt("typeID");
			    ordDetail.setoDetailID(ordDetailID);
			    ordDetail.setOrderID(orderID);
			    ordDetail.setQuantity(quantity);
			    ordDetail.setUnitPrice(unitPrice);
			    ordDetail.setTypeID(typeID);

			    if (typeID == 1) {
				MaterialDAO materialDAO = new MaterialDAO();
				Product p = materialDAO.getMaterialByID(productID);
				ordDetail.setProduct(p);
			    } else if (typeID == 2) {
				MealDAO mealDAO = new MealDAO();
				Product p = mealDAO.getMealByID(productID);
				ordDetail.setProduct(p);
			    } else if (typeID == 3) {
				PlanDAO planDAO = new PlanDAO();
				Product p = planDAO.getMealPlanByID(productID);
				ordDetail.setProduct(p);
			    }
			    ord.addDetail(ordDetail);
			}
		    }
		    listOrder.add(ord);
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

	return listOrder;
    }

    public List<Order> getAllOrder(String i_accID, int i_statusID, Date fromDate, Date toDate, String i_orderID) {
	List<Order> listOrder = new ArrayList<>();
	Connection cn = null;
	PreparedStatement st1 = null;
	ResultSet rs1 = null;

	try {
	    cn = MyLibs.makeConnection();
	    StringBuilder sql = new StringBuilder(
		    "SELECT [orderID], [accID], [orderDate], [statusID], [deliveryAddID] FROM [dbo].[Order] WHERE 1 > 0");

	    if (i_accID != null) {
		sql.append(" AND accID = ?");
	    }
	    if (i_statusID > 0) {
		sql.append(" AND statusID = ?");
	    }
	    if (fromDate != null && toDate != null) {
		sql.append(" AND orderDate BETWEEN ? AND ?");
	    }
	    if (i_orderID != null) {
		sql.append(" AND orderID = ?");
	    }
	    sql.append(" ORDER BY statusID ASC, orderDate ASC");

	    st1 = cn.prepareStatement(sql.toString());
	    int paramIndex = 1;
	    if (i_accID != null) {
		st1.setString(paramIndex++, i_accID);
	    }
	    if (i_statusID > 0) {
		st1.setInt(paramIndex++, i_statusID);
	    }
	    if (fromDate != null && toDate != null) {
		st1.setDate(paramIndex++, fromDate);
		st1.setDate(paramIndex++, toDate);
	    }
	    if (i_orderID != null) {
		st1.setString(paramIndex, i_orderID);
	    }

	    rs1 = st1.executeQuery();

	    while (rs1.next()) {
		Order ord = new Order();
		String accID = rs1.getString("accID");
		String orderID = rs1.getString("orderID");
		Date orderDate = rs1.getDate("orderDate");
		int statusID = rs1.getInt("statusID");
		String deliveryAddID = rs1.getString("deliveryAddID");
		ord.setOrderID(orderID);
		ord.setAccID(accID);
		ord.setOrderDate(orderDate);
		ord.setStatusID(statusID);
		ord.setDeliveryAddID(deliveryAddID);

		String sql2 = "SELECT [oDetailID], [productID], [quantity], [unitPrice], [typeID] FROM [dbo].[OrderDetail] WHERE orderID = ?";
		PreparedStatement st2 = cn.prepareStatement(sql2);
		st2.setString(1, orderID);
		ResultSet rs2 = st2.executeQuery();

		while (rs2.next()) {
		    OrderDetail ordDetail = new OrderDetail();
		    String ordDetailID = rs2.getString("oDetailID");
		    String productID = rs2.getString("productID");
		    int quantity = rs2.getInt("quantity");
		    double unitPrice = rs2.getDouble("unitPrice");
		    int typeID = rs2.getInt("typeID");
		    ordDetail.setoDetailID(ordDetailID);
		    ordDetail.setOrderID(orderID);
		    ordDetail.setQuantity(quantity);
		    ordDetail.setUnitPrice(unitPrice);
		    ordDetail.setTypeID(typeID);

		    Product product = null;
		    switch (typeID) {
		    case 1:
			product = new MaterialDAO().getMaterialByID(productID);
			break;
		    case 2:
			product = new MealDAO().getMealByID(productID);
			break;
		    case 3:
			product = new PlanDAO().getMealPlanByID(productID);
			break;
		    // Add more cases if necessary
		    }
		    if (product != null) {
			ordDetail.setProduct(product);
			ord.addDetail(ordDetail);
		    }
		}
		listOrder.add(ord);
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    try {
		if (rs1 != null) {
		    rs1.close();
		}
		if (st1 != null) {
		    st1.close();
		}
		if (cn != null) {
		    cn.close();
		}
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}

	return listOrder;
    }

    public Order getOrderByID(String orderID) {
	Order ord = null;
	String sql1 = "SELECT [orderID]\n" + "      ,[accID]\n" + "      ,[orderDate]\n" + "      ,[statusID]\n"
		+ "      ,[deliveryAddID]\n" + "  FROM [dbo].[Order]\n" + "  WHERE [orderID] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql1);
	    st.setString(1, orderID);
	    ResultSet rs1 = st.executeQuery();
	    if (rs1 != null) {
		if (rs1.next()) {
		    ord = new Order();
		    Date orderDate = rs1.getDate("orderDate");
		    int statusID = rs1.getInt("statusID");
		    String deliveryAddID = rs1.getString("deliveryAddID");
		    ord.setOrderID(orderID);
		    ord.setAccID(rs1.getString("accID"));
		    ord.setOrderDate(orderDate);
		    ord.setStatusID(statusID);
		    ord.setDeliveryAddID(deliveryAddID);

		    String sql2 = "SELECT [oDetailID]\n" + "      ,[orderID]\n" + "      ,[productID]\n"
			    + "      ,[quantity]\n" + "      ,[unitPrice]\n" + "      ,[typeID]\n"
			    + "  FROM [dbo].[OrderDetail]\n" + "  WHERE orderID = ?";

		    PreparedStatement st2 = cn.prepareStatement(sql2);
		    st2.setString(1, orderID);
		    ResultSet rs2 = st2.executeQuery();
		    if (rs2 != null) {
			while (rs2.next()) {
			    OrderDetail ordDetail = new OrderDetail();
			    String ordDetailID = rs2.getString("oDetailID");
			    String productID = rs2.getString("productID");
			    int quantity = rs2.getInt("quantity");
			    double unitPrice = rs2.getDouble("unitPrice");
			    int typeID = rs2.getInt("typeID");
			    ordDetail.setoDetailID(ordDetailID);
			    ordDetail.setOrderID(orderID);
			    ordDetail.setQuantity(quantity);
			    ordDetail.setUnitPrice(unitPrice);
			    ordDetail.setTypeID(typeID);

			    if (typeID == 1) {
				MaterialDAO materialDAO = new MaterialDAO();
				Product p = materialDAO.getMaterialByID(productID);
				ordDetail.setProduct(p);
			    } else if (typeID == 2) {
				MealDAO mealDAO = new MealDAO();
				Product p = mealDAO.getMealByID(productID);
				ordDetail.setProduct(p);
			    } else if (typeID == 3) {
				PlanDAO planDAO = new PlanDAO();
				Product p = planDAO.getMealPlanByID(productID);
				ordDetail.setProduct(p);
			    }
			    ord.addDetail(ordDetail);
			}
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
	return ord;
    }

    public int updateStatusOrder(String orderID, int newStatus) {
	int rs = 0;
	String sql = "UPDATE [dbo].[Order]\n" + "   SET [statusID] = ?\n" + " WHERE [orderID] = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setInt(1, newStatus);
	    st.setString(2, orderID);
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

    public int countOrderByStatusID(int statusID) {
	int result = 0;
	String sql = "SELECT \n" + "    COUNT(CASE WHEN statusID = ? THEN 1 END) AS Result\n" + "FROM [dbo].[Order];";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setInt(1, statusID);
	    ResultSet rs = st.executeQuery();
	    if (rs != null) {
		if (rs.next()) {
		    result = rs.getInt("Result");
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
	return result;
    }

    public int countLatestOrderByStatusID(int statusID) {
	int result = 0;
	String sql = "SELECT \n" + "    COUNT(CASE WHEN statusID = ? THEN 1 END) AS Result\n" + "FROM [dbo].[Order]\n"
		+ "WHERE CAST(orderDate AS DATE) = CAST(GETDATE() AS DATE)";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setInt(1, statusID);
	    ResultSet rs = st.executeQuery();
	    if (rs != null) {
		if (rs.next()) {
		    result = rs.getInt("Result");
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
	return result;
    }

    public int countProductSoldByID(String productID) {
	int result = 0;
	String sql = "SELECT COUNT(*) AS ProductCount\n" + "FROM OrderDetail\n" + "WHERE productID = ?";
	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st = cn.prepareStatement(sql);
	    st.setString(1, productID);
	    ResultSet rs = st.executeQuery();
	    if (rs != null) {
		if (rs.next()) {
		    result = rs.getInt("ProductCount");
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
	return result;
    }
}
