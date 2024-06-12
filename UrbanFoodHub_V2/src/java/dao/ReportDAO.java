/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;

import dto.Product;
import dto.ReportUser;
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
public class ReportDAO {
    public List<ReportUser> getReportUser() {
	List<ReportUser> listReportUser = null;
	String sql = "SELECT\n" + "    o.orderID,\n" + "    o.orderDate,\n" + "    os.statusName AS orderStatus,\n"
		+ "    SUM(od.quantity * od.unitPrice) AS totalValue,\n" + "    a.accID,\n"
		+ "    COALESCE(a.firstname, '') + ' ' + COALESCE(a.lastname, '') AS fullName,\n" + "    a.email,\n"
		+ "    a.phone\n" + "FROM\n" + "    [Order] o\n" + "JOIN\n"
		+ "    OrderStatus os ON o.statusID = os.statusID\n" + "JOIN\n"
		+ "    OrderDetail od ON o.orderID = od.orderID\n" + "JOIN\n" + "    Account a ON o.accID = a.accID\n"
		+ "GROUP BY\n"
		+ "    o.orderID, o.orderDate, os.statusName, a.accID, a.firstname, a.lastname, a.email, a.phone;";

	Connection cn = null;
	try {
	    cn = MyLibs.makeConnection();
	    PreparedStatement st1 = cn.prepareStatement(sql);
	    ResultSet rs1 = st1.executeQuery();
	    if (rs1 != null) {
		listReportUser = new ArrayList<>();
		while (rs1.next()) {
		    ReportUser r = new ReportUser();
		    String orderID = rs1.getString("orderID");
		    Date orderDate = rs1.getDate("orderDate");
		    String orderStatus = rs1.getString("orderStatus");
		    double totalValue = rs1.getDouble("totalValue");
		    String accountID = rs1.getString("accID");
		    String fullname = rs1.getString("fullName");
		    String email = rs1.getString("email");
		    String phone = rs1.getString("phone");
		    r.setOrderId(orderID);
		    r.setOrderDate(orderDate);
		    r.setOrderStatus(orderStatus);
		    r.setTotalValue(totalValue);
		    r.setAccountId(accountID);
		    r.setFullName(fullname);
		    r.setEmail(email);
		    r.setPhone(phone);
		    String sql2 = "SELECT [oDetailID]\n" + "      ,[orderID]\n" + "      ,[productID]\n"
			    + "      ,[quantity]\n" + "      ,[unitPrice]\n" + "      ,[typeID]\n"
			    + "  FROM [dbo].[OrderDetail]\n" + "  WHERE orderID = ?";
		    PreparedStatement st2 = cn.prepareStatement(sql2);
		    st2.setString(1, orderID);
		    ResultSet rs2 = st2.executeQuery();
		    if (rs2 != null) {
			while (rs2.next()) {
			    String productID = rs2.getString("productID");
			    int typeID = rs2.getInt("typeID");
			    if (typeID == 1) {
				MaterialDAO materialDAO = new MaterialDAO();
				Product p = materialDAO.getMaterialByID(productID);
				r.addListOrderItem(p);
			    } else if (typeID == 2) {
				MealDAO mealDAO = new MealDAO();
				Product p = mealDAO.getMealByID(productID);
				r.addListOrderItem(p);
			    } else if (typeID == 3) {
				PlanDAO planDAO = new PlanDAO();
				Product p = planDAO.getMealPlanByID(productID);
				r.addListOrderItem(p);
			    }

			}
		    }
		    listReportUser.add(r);
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

	return listReportUser;
    }

}
