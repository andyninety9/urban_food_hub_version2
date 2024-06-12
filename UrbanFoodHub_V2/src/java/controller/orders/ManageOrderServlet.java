/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.orders;

import dao.OrderDAO;
import dto.Order;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author duyma
 */
public class ManageOrderServlet extends HttpServlet {

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
	String url = "home?action=tracking-order";
	switch (action) {
	case "cancel-order": {
	    String orderID = request.getParameter("orderID");
	    OrderDAO orderDAO = new OrderDAO();
	    Order ord = orderDAO.getOrderByID(orderID);
	    int rs = 0;
	    if (ord != null) {
		if (ord.getStatusID() == 1) {
		    rs = orderDAO.updateStatusOrder(orderID, 5);
		}
	    }

	    if (rs == 0) {
		request.setAttribute("error", "Only cancel in pending process");
		request.getRequestDispatcher(url).forward(request, response);
	    } else {

		response.sendRedirect(url);
	    }
	    break;
	}
	case "process-order": {
	    url = "admin-router?action=manage-order";
	    String orderID = request.getParameter("orderID");
	    OrderDAO orderDAO = new OrderDAO();
	    Order ord = orderDAO.getOrderByID(orderID);
	    int rs = 0;
	    if (ord != null) {
		if (ord.getStatusID() != 5) {
		    String raw_newStatus = request.getParameter("statusID");
		    rs = orderDAO.updateStatusOrder(orderID, Integer.parseInt(raw_newStatus));
		}
	    }
	    if (rs == 0) {
		request.setAttribute("error", "Refresh page and try again!");
		request.getRequestDispatcher(url).forward(request, response);
	    } else {
		response.sendRedirect(url);
	    }
	    break;
	}
	}

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
