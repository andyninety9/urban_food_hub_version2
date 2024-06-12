/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.foods;

import dao.CategoryFoodsDAO;
import dao.MealDAO;
import dto.Category;
import dto.Meal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.IConstant;
import utils.MyLibs;

/**
 *
 * @author duyma
 */
public class ManageFoodsServlet extends HttpServlet {

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
	    out.println("<title>Servlet ManageFoodsServlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet ManageFoodsServlet at " + request.getContextPath() + "</h1>");
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
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	CategoryFoodsDAO categoryFoodsDAO = new CategoryFoodsDAO();
	MealDAO mealDAO = new MealDAO();
	List<Category> listCategoryFood = null;
	List<Meal> rawListMeal = null;
	List<Meal> paginationListMeal = null;

	String action = request.getParameter("action");
	String raw_page = request.getParameter("page");
	String cateID = request.getParameter("cateID");
	String keyword = request.getParameter("keyword");
	int page = 0;
	switch (action) {
	case "all": {
	    if (cateID == null) {
		cateID = "all";
	    }
	    if (keyword == null) {
		rawListMeal = mealDAO.getAllMeal(cateID);
	    } else {
		rawListMeal = mealDAO.searchMeal(keyword);
	    }

	    listCategoryFood = categoryFoodsDAO.getAllFoodCategory();
	    int sizeList = rawListMeal.size();
	    if (raw_page == null) {
		page = 1;
	    } else {
		try {
		    page = Integer.parseInt(raw_page);
		} catch (Exception e) {
		    e.printStackTrace();
		    page = 1;
		}
	    }
	    int start, end;
	    start = (page - 1) * IConstant.ITEMS_PER_PAGE;
	    end = Math.min(page * IConstant.ITEMS_PER_PAGE, sizeList);
	    paginationListMeal = MyLibs.pagination(rawListMeal, start, end);
	    request.setAttribute("selectedCate", cateID);
	    request.setAttribute("sizeListFoods", sizeList);
	    request.setAttribute("checkedPage", page);
	    break;
	}
	}

	request.setAttribute("listMeal", paginationListMeal);
	request.setAttribute("listCateFood", listCategoryFood);
	request.setAttribute("currentPage", "manage-foods");
	request.getRequestDispatcher("foods/manage-foods.jsp").forward(request, response);

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
