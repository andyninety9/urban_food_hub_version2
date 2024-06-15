/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.foods;

import dao.CategoryDAO;
import dao.CategoryFoodsDAO;
import dao.MealDAO;
import dto.Category;
import dto.Meal;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author duyma
 */
public class UpdateMealServlet extends HttpServlet {

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
	    out.println("<!DOCTYPE html>");
	    out.println("<html>");
	    out.println("<head>");
	    out.println("<title>Servlet UpdateMealServlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet UpdateMealServlet at " + request.getContextPath() + "</h1>");
	    out.println("</body>");
	    out.println("</html>");
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
	String mealID = request.getParameter("mealID");
	MealDAO mealDAO = new MealDAO();
	CategoryFoodsDAO categoryFoodsDAO = new CategoryFoodsDAO();
	List<Category> listMealCategory = categoryFoodsDAO.getAllFoodCategory();
	Meal updatedMeal = mealDAO.getMealByID(mealID);
	request.setAttribute("listCategoryMeal", listMealCategory);
	request.setAttribute("updatedMeal", updatedMeal);
	request.getRequestDispatcher("foods/update-meal.jsp").forward(request, response);
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
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String mealID = request.getParameter("mealID");
	String cateID = request.getParameter("cateID");
	String mealName = request.getParameter("mealName");
	String mealDesc = request.getParameter("mealDesc");
	String nutrition = request.getParameter("nutrition");
	String shelfLife = request.getParameter("shelfLife");
	String prepareTime = request.getParameter("prepareTime");
	String raw_price = request.getParameter("price");
	String raw_stock = request.getParameter("stock");
	String mealImg = request.getParameter("mealImg");
	Date createdDate = new Date(System.currentTimeMillis());
	double price;
	int stock;
	try {
	    if (raw_price == null || raw_price.isEmpty()) {
		price = 0;
	    } else {
		price = Double.parseDouble(raw_price);
	    }
	    if (raw_stock == null || raw_stock.isEmpty()) {
		stock = 0;
	    } else {
		stock = Integer.parseInt(raw_stock);
	    }

	    MealDAO mealDAO = new MealDAO();
	    int rs = mealDAO.updateMeal(mealID, cateID, mealName, mealDesc, nutrition, shelfLife, prepareTime, price,
		    stock, createdDate, mealImg);
	    if (rs > 0) {
		response.sendRedirect("manage-foods?action=all");
	    } else {
		response.sendRedirect("access-denied");
	    }
	} catch (NumberFormatException e) {
	    e.printStackTrace();
	}
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
