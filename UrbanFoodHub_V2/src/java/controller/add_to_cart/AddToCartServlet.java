/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.add_to_cart;

import dao.MaterialDAO;
import dao.MealDAO;
import dto.Material;
import dto.Meal;
import dto.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author duyma
 */
public class AddToCartServlet extends HttpServlet {

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
	    String kindOfProduct = request.getParameter("kind");
	    HttpSession session = request.getSession();
	    HashMap<Product, Integer> listCart = (HashMap<Product, Integer>) session.getAttribute("cartMate");
	    switch (kindOfProduct) {
	    case "material": {
		String mateID = request.getParameter("mateID");
		MaterialDAO materialDAO = new MaterialDAO();
		Product m = materialDAO.getMaterialByID(mateID);
		if (listCart == null) {
		    listCart = new HashMap<>();
		    listCart.put(m, 1);
		} else {
		    boolean isExist = false;
		    for (Product mate : listCart.keySet()) {
			if (mate.getId().equals(mateID)) {
			    int quantity = listCart.get(mate);
			    quantity++;
			    listCart.put(mate, quantity);
			    isExist = true;
			}
		    }
		    if (isExist == false) {
			listCart.put(m, 1);
		    }
		}
		session.setAttribute("cartMate", listCart);
		request.getRequestDispatcher("home?action=materials").forward(request, response);
		break;
	    }
	    case "foods": {
		String mealID = request.getParameter("mealID");
		MealDAO mealDAO = new MealDAO();
		Product meal = mealDAO.getMealByID(mealID);
		if (listCart == null) {
		    listCart = new HashMap<>();
		    listCart.put(meal, 1);
		} else {
		    boolean isExist = false;
		    for (Product entryMeal : listCart.keySet()) {
			if (entryMeal.getId().equals(mealID)) {
			    int quantity = listCart.get(entryMeal);
			    quantity++;
			    listCart.put(entryMeal, quantity);
			    isExist = true;
			}
		    }
		    if (isExist == false) {
			listCart.put(meal, 1);
		    }
		}
		session.setAttribute("cartMate", listCart);
		request.getRequestDispatcher("home?action=foods").forward(request, response);
		break;
	    }

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
