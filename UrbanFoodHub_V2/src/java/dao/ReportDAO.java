/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;

import dto.Account;
import dto.Material;
import dto.Product;
import dto.Report;
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
    
    public Report getReport(){
        Report rp = null;
        String sql1 = "SELECT COUNT(*) AS [noNewOrderToday] FROM [Order] \n"
                + "WHERE CONVERT(date, orderDate) = CONVERT(date, GETDATE())";
        String sql2 = "SELECT COUNT(*) AS [noProductOutStock] FROM Meal WHERE statusID = 2";
        String sql3 = "SELECT COUNT(*) AS [noProductOutStock] FROM Material WHERE MateStatus = 2";
        String sql4 = "SELECT COUNT(*) AS [noProductRuningOut] FROM Meal WHERE stock < 20";
        String sql5 = "SELECT COUNT(*) AS [noProductRuningOut] FROM Material WHERE stock < 20";
        String sql6 = "SELECT TOP 10 \n"
                + "    Account.*, \n"
                + "    newTbl.OrderCount\n"
                + "FROM \n"
                + "    Account\n"
                + "INNER JOIN (\n"
                + "    SELECT \n"
                + "        [Order].accID,\n"
                + "        COUNT([Order].orderID) AS OrderCount\n"
                + "    FROM \n"
                + "        [Order]\n"
                + "    WHERE \n"
                + "        [Order].statusID = 5\n"
                + "		AND MONTH([Order].orderDate) = MONTH(GETDATE())\n"
                + "		AND YEAR([Order].orderDate) = YEAR(GETDATE())\n"
                + "    GROUP BY \n"
                + "        [Order].accID\n"
                + ") newTbl ON Account.accID = newTbl.accID\n"
                + "ORDER BY \n"
                + "    newTbl.OrderCount DESC";
        String sql7 = "SELECT TOP 10 \n"
                + "    Material.*, \n"
                + "    newTbl.ProductCount\n"
                + "FROM \n"
                + "    Material\n"
                + "INNER JOIN (\n"
                + "    SELECT \n"
                + "        OrderDetail.productID,\n"
                + "        COUNT(OrderDetail.productID) AS ProductCount\n"
                + "    FROM \n"
                + "        OrderDetail\n"
                + "    GROUP BY \n"
                + "        OrderDetail.productID\n"
                + ") newTbl ON Material.MateSKU = newTbl.productID\n"
                + "ORDER BY \n"
                + "    newTbl.ProductCount DESC";
        String sql8 = "SELECT \n"
                + "    SUM(unitPrice * quantity) AS totalIncome\n"
                + "FROM \n"
                + "    [Order] \n"
                + "INNER JOIN \n"
                + "    OrderDetail ON [Order].orderID = OrderDetail.orderID\n"
                + "WHERE \n"
                + "    MONTH([Order].orderDate) = MONTH(GETDATE())\n"
                + "    AND YEAR([Order].orderDate) = YEAR(GETDATE())";
        String sql9 = "SELECT \n"
                + "    SUM(unitPrice * quantity) AS totalIncome\n"
                + "FROM \n"
                + "    [Order] \n"
                + "INNER JOIN \n"
                + "    OrderDetail ON [Order].orderID = OrderDetail.orderID\n"
                + "WHERE \n"
                + "    MONTH([Order].orderDate) = MONTH(DATEADD(MONTH, -1, GETDATE()))\n"
                + "    AND YEAR([Order].orderDate) = YEAR(DATEADD(MONTH, -1, GETDATE()))";
        
        Connection cn = null;
        
        try {
            cn = MyLibs.makeConnection();
            if(cn != null){
                rp = new Report();
                PreparedStatement st1 = cn.prepareStatement(sql1);
                ResultSet rs1 = st1.executeQuery();
                if(rs1 != null){
                    if(rs1.next()){
                        rp.setNoNewOrderToday(rs1.getInt("noNewOrderToday"));
                    }
                }
                st1 = cn.prepareStatement(sql2);
                rs1 = st1.executeQuery();
                if(rs1 != null){
                    if(rs1.next()){
                        rp.setNoProductOutStock(rs1.getInt("noProductOutStock"));
                    }
                }
                st1 = cn.prepareStatement(sql3);
                rs1 = st1.executeQuery();
                if(rs1 != null){
                    if(rs1.next()){
                        int noMateOutStock = rs1.getInt("noProductOutStock");
                        int noMealOutStock = rp.getNoProductOutStock();
                        rp.setNoProductOutStock(noMealOutStock + noMateOutStock);
                    }
                }
                st1 = cn.prepareStatement(sql4);
                rs1 = st1.executeQuery();
                if(rs1 != null){
                    if(rs1.next()){
                        rp.setNoProductRuningOut(rs1.getInt("noProductRuningOut"));
                    }
                }
                
                st1 = cn.prepareStatement(sql5);
                rs1 = st1.executeQuery();
                if(rs1 != null){
                    if(rs1.next()){
                        int noMateRuningOut = rs1.getInt("noProductRuningOut");
                        int noMealRuningOut = rp.getNoProductRuningOut();
                        rp.setNoProductRuningOut(noMealRuningOut + noMateRuningOut);
                    }
                }
                st1 = cn.prepareStatement(sql6);
                rs1 = st1.executeQuery();
                if(rs1 != null){
                    while(rs1.next()){
                        Account tmpAcc = new Account(rs1.getString("accID"), rs1.getString("firstname"),
				rs1.getString("lastname"), rs1.getDate("birthday"), rs1.getString("email"),
				rs1.getString("phone"), rs1.getString("avatar"), rs1.getInt("statusID"),
				rs1.getDate("createdDate"));
                        rp.getListTopAccountCancelOrder().put(tmpAcc, rs1.getInt("OrderCount"));
                    }
                }
                st1 = cn.prepareStatement(sql7);
                rs1 = st1.executeQuery();
                if(rs1 != null){
                    while(rs1.next()){
                        Material mateTmp = new Material(rs1.getString("MateSKU"), rs1.getString("CateID"),
				rs1.getString("MateName"), rs1.getString("MateDesc"), rs1.getDouble("Price"),
				rs1.getString("PackagingSpec"), rs1.getDouble("Stock"), rs1.getDate("CreatedDate"),
				rs1.getString("MateImg"), rs1.getInt("MateStatus"));
                        rp.getListTopSellProduct().put(mateTmp, rs1.getInt("ProductCount"));
                    }
                }
                st1 = cn.prepareStatement(sql8);
                rs1 = st1.executeQuery();
                if(rs1 != null){
                    if(rs1.next()){
                        rp.setIncomeMonthly(rs1.getDouble("totalIncome"));
                    }
                }
                st1 = cn.prepareStatement(sql9);
                rs1 = st1.executeQuery();
                if(rs1 != null){
                    if(rs1.next()){
                        rp.setIncomePrevious(rs1.getDouble("totalIncome"));
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
        
        return rp;
    }

}
