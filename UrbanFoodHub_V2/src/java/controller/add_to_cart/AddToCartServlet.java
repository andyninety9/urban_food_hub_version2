/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.add_to_cart;

import dao.MaterialDAO;
import dao.MealDAO;
import dto.Material;
import dto.Meal;
import dto.MealDetail;
import dto.Product;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
//	try (PrintWriter out = response.getWriter()) {
	/* TODO output your page here. You may use following sample code. */
	String kindOfProduct = request.getParameter("kind");
	HttpSession session = request.getSession();
	HashMap<Product, Integer> listCart = (HashMap<Product, Integer>) session.getAttribute("listCart");
	switch (kindOfProduct) {
	case "material": {
	    String mateID = request.getParameter("productID");
	    String quantityAdd = request.getParameter("quantity");
	    int addMore = 1;
	    if (quantityAdd != null) {
		try {
		    addMore = Integer.parseInt(quantityAdd);
		} catch (NumberFormatException e) {
		    addMore = 1;
		}

	    }
	    MaterialDAO materialDAO = new MaterialDAO();
	    Product m = new Material();
	    m = materialDAO.getMaterialByID(mateID);
	    if (listCart == null) {
		listCart = new HashMap<>();
		listCart.put(m, addMore);
	    } else {
		boolean isExist = false;
		for (Product mate : listCart.keySet()) {
		    if (mate.getId().equals(mateID)) {
			int quantity = listCart.get(mate);
			quantity += addMore;
			listCart.put(mate, quantity);
			isExist = true;
		    }
		}
		if (isExist == false) {
		    listCart.put(m, addMore);
		}
	    }
	    session.setAttribute("listCart", listCart);
	    request.getRequestDispatcher("home?action=materials").forward(request, response);
	    break;
	}
	case "food": {
	    String url = "home?action=foods";
	    String mealID = request.getParameter("productID");
	    String quantityAdd = request.getParameter("quantity");
	    String orderType = request.getParameter("orderType");
	    if (orderType == null) {
		orderType = "1";
	    }
	    if (orderType.equals("1")) {
		int addMore = 1;
		if (quantityAdd != null) {
		    try {
			addMore = Integer.parseInt(quantityAdd);
		    } catch (NumberFormatException e) {
			addMore = 1;
		    }

		}

		MealDAO mealDAO = new MealDAO();
		Product meal = new Meal();
		meal = mealDAO.getMealByID(mealID);
		if (listCart == null) {
		    listCart = new HashMap<>();
		    listCart.put(meal, addMore);
		} else {
		    boolean isExist = false;
		    for (Product entryMeal : listCart.keySet()) {
			if (entryMeal.getId().equals(mealID)) {
			    int quantity = listCart.get(entryMeal);
			    quantity += addMore;
			    listCart.put(entryMeal, quantity);
			    isExist = true;
			}
		    }
		    if (isExist == false) {
			listCart.put(meal, addMore);
		    }
		}
	    } else {
		MealDAO mealDAO = new MealDAO();
		List<MealDetail> mealDetails = mealDAO.getMealDetailsById(mealID);
		if (!mealDetails.isEmpty()) {
//		    System.out.println(mealDetails.size());
		    int addMore = 1;
		    if (quantityAdd != null) {
			try {
			    addMore = Integer.parseInt(quantityAdd);
			} catch (NumberFormatException e) {
			    addMore = 1;
			}
		    }
		    for (MealDetail mealDetail : mealDetails) {
			MaterialDAO materialDAO = new MaterialDAO();
			Product m = new Material();
			m = materialDAO.getMaterialByID(mealDetail.getMaterialID());
			if (listCart == null) {
			    listCart = new HashMap<>();
			    int quantity = (int) (addMore * mealDetail.getQuantity());
			    listCart.put(m, quantity);
			} else {
			    boolean isExist = false;
			    for (Product mate : listCart.keySet()) {
				if (mate.getId().equals(mealDetail.getMaterialID())) {
				    int quantity = listCart.get(mate);
				    quantity += (addMore * mealDetail.getQuantity());
				    listCart.put(mate, quantity);
				    isExist = true;
				}
			    }
			    int quantity = (int) (addMore * mealDetail.getQuantity());
			    if (isExist == false) {
				listCart.put(m, quantity);
			    }
			}
		    }
		} else {
		    request.setAttribute("error", "Cannot order only material for this meal");
		    url = "access-denied";
		    request.getRequestDispatcher(url).forward(request, response);
		}

	    }

	    session.setAttribute("listCart", listCart);
	    request.getRequestDispatcher(url).forward(request, response);
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
