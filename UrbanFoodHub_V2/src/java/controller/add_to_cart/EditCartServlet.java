/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.add_to_cart;

import dto.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.IConstant;

/**
 *
 * @author duyma
 */
public class EditCartServlet extends HttpServlet {

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
	try (PrintWriter out = response.getWriter()) {
	    /* TODO output your page here. You may use following sample code. */
	    String action = request.getParameter("action");
	    switch (action) {
	    case "increase": {
		String productID = request.getParameter("productID");
		HttpSession session = request.getSession();
		HashMap<Product, Integer> listCart = (HashMap<Product, Integer>) session.getAttribute("listCart");
		if (productID != null) {
		    for (Product product : listCart.keySet()) {
			if (product.getId().equals(productID)) {
			    int quantity = listCart.get(product);
			    if (quantity < IConstant.MAX_QUANTITY_ITEM_INCART) {
				quantity++;
			    }
			    listCart.put(product, quantity);
			}
		    }
		}
		break;
	    }
	    case "decrease": {
		String productID = request.getParameter("productID");
		HttpSession session = request.getSession();
		HashMap<Product, Integer> listCart = (HashMap<Product, Integer>) session.getAttribute("listCart");
		if (productID != null) {
		    for (Product product : listCart.keySet()) {
			if (product.getId().equals(productID)) {
			    int quantity = listCart.get(product);
			    if (quantity > 1) {
				quantity--;
			    }
			    listCart.put(product, quantity);
			}
		    }
		}
		break;
	    }
	    case "delete": {
		String productID = request.getParameter("productID");
		HttpSession session = request.getSession();
		HashMap<Product, Integer> listCart = (HashMap<Product, Integer>) session.getAttribute("listCart");
		Product p_remove = null;
		if (productID != null) {
		    for (Product product : listCart.keySet()) {
			if (product.getId().equals(productID)) {
			    p_remove = product;
			    break;
			}
		    }
		}
		listCart.remove(p_remove);
		break;
	    }
	    }
	    response.sendRedirect("home?action=view-cart");
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
