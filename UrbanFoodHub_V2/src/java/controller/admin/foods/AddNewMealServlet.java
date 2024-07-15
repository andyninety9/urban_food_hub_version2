/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.foods;

import dao.MealDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author duyma
 */
public class AddNewMealServlet extends HttpServlet {

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
	    out.println("<title>Servlet AddNewMealServlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet AddNewMealServlet at " + request.getContextPath() + "</h1>");
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
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String cateID = request.getParameter("cateID");
	String mealName = request.getParameter("mealName");
	String mealDesc = request.getParameter("mealDesc");
	String nutrition = request.getParameter("nutrition");
	String shelfLife = request.getParameter("shelfLife");
	String prepareTime = request.getParameter("prepareTime");
	String raw_price = request.getParameter("price");
	String raw_stock = request.getParameter("stock");
	String raw_status = request.getParameter("status");
	String mealImg = request.getParameter("mealImg");
	Date createdDate = new Date(System.currentTimeMillis());
	double price;
	int stock, status;
	try {
	    price = Double.parseDouble(raw_price);
	    stock = Integer.parseInt(raw_stock);
	    if (raw_status != null) {
		status = Integer.parseInt(raw_status);
	    } else {
		status = 3;
	    }
	    MealDAO mealDAO = new MealDAO();
	    int rs = mealDAO.addNewMeal(cateID, mealName, mealDesc, nutrition, shelfLife, prepareTime, price, stock,
		    createdDate, mealImg, status);
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
