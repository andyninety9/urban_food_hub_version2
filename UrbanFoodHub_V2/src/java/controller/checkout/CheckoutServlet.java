/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.checkout;

import dao.MaterialDAO;
import dao.MealDAO;
import dao.OrderDAO;
import dto.Account;
import dto.Material;
import dto.Meal;
import dto.MealPlan;
import dto.PlanDetail;
import dto.Product;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.MyLibs;

/**
 *
 * @author duyma
 */
public class CheckoutServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	String action = request.getParameter("action");
	String url = "home?action=tracking-order";// Chuyen qua trang Tracking Order
	switch (action) {
	case "check-out": {
	    HttpSession session = request.getSession();
	    HashMap<Product, Integer> listCart = (HashMap<Product, Integer>) session.getAttribute("listCart");
	    boolean isStock = true;

	    // Check số lượng từ db
	    Iterator<Product> iterator = listCart.keySet().iterator();
	    while (iterator.hasNext()) {
		Product p = iterator.next();
		if (p instanceof Material) {
		    MaterialDAO materialDAO = new MaterialDAO();
		    Material material = materialDAO.getMaterialByID(p.getId());
		    if (material.getStock() < ((Material) p).getStock()) {
			isStock = false;
			request.setAttribute("error", p.getName() + " have not enough quantity");
			url = "home?action=view-cart";
			break;
		    }
		} else if (p instanceof Meal) {
		    MealDAO mealDAO = new MealDAO();
		    Meal meal = mealDAO.getMealByID(p.getId());
		    if (meal.getStock() < ((Meal) p).getStock()) {
			isStock = false;
			request.setAttribute("error", p.getName() + " have not enough quantity");
			url = "home?action=view-cart";
			break;
		    }
		}
	    }
	    if (isStock) {
		String orderID = MyLibs.generateID("ORDER");
		Date orderDate = new Date(System.currentTimeMillis());
		Account buyer = (Account) session.getAttribute("user");
		String accID = buyer.getAccID();
		// Lay addressID tu parameter
		String addressID = request.getParameter("addressID");
		int statusID = 1;
		OrderDAO orderDAO = new OrderDAO();
		int isCreated = orderDAO.addNewOrder(orderID, accID, orderDate, statusID, addressID);
		if (isCreated > 0) {
		    iterator = listCart.keySet().iterator(); // Reset Iterator
		    while (iterator.hasNext()) {
			Product p = iterator.next();
			if (p instanceof Material) {
			    MaterialDAO materialDAO = new MaterialDAO();
			    Material material = materialDAO.getMaterialByID(p.getId());
			    String orderDetailID = MyLibs.generateID("ORDERDETAIL");

			    int isAddDetail = orderDAO.addOrderDetail(orderDetailID, orderID, p.getId(),
				    listCart.get(p), p.getPrice(), 1);
			    if (isAddDetail > 0) {
				int rs = materialDAO.updateStockMaterial(p.getId(),
					(material.getStock() - listCart.get(p)));
				if (rs > 0) {
				    // Xóa phần tử khỏi listCart bằng Iterator
				    iterator.remove();
				}
			    }

			} else if (p instanceof Meal) {
			    MealDAO mealDAO = new MealDAO();
			    Meal meal = mealDAO.getMealByID(p.getId());
			    String orderDetailID = MyLibs.generateID("ORDERDETAIL");

			    int isAddDetail = orderDAO.addOrderDetail(orderDetailID, orderID, p.getId(),
				    listCart.get(p), p.getPrice(), 2);
			    if (isAddDetail > 0) {
				int rs = mealDAO.updateStockMeal(p.getId(), (meal.getStock() - listCart.get(p)));
				if (rs > 0) {
				    iterator.remove();
				}
			    }

			}
		    }
		} else {
		    request.setAttribute("error", "Cannot create order");
		    request.getRequestDispatcher(url).forward(request, response);
		}

	    }

	    break;
	}
	}
	response.sendRedirect(url);
//	}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
	return "Short description";
    }// </editor-fold>

}
