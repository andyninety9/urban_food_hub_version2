/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.homepage;

import dao.CategoryDAO;
import dao.CategoryFoodsDAO;
import dao.MaterialDAO;
import dao.MealDAO;
import dao.PlanDAO;
import dto.Category;
import dto.Material;
import dto.Meal;
import dto.MealPlan;
import dto.PlanDetail;
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
public class HomepageServlet extends HttpServlet {

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
	    if (action == null) {
		action = IConstant.PATH_HOME;
	    }
	    String url = null;
	    MaterialDAO materialDAO = new MaterialDAO();
	    switch (action) {
	    case IConstant.PATH_MEAL_PLAN: {
		url = IConstant.URL_MEAL_PLANS;
		request.setAttribute("currentPage", action);
		String cateID = request.getParameter("cateID");
		int status = 1;
		PlanDAO planDAO = new PlanDAO();
		List<MealPlan> listMealWeekPlan = (List<MealPlan>) planDAO.getMealPlanByCateID(cateID, status);
//		List<PlanDetail> listDetailsWeek = mealWeekPlan.getListPlanDetails();
		request.setAttribute("listMealWeekPlan", listMealWeekPlan);
//		request.setAttribute("listDetailsWeek", listDetailsWeek);

		break;
	    }
	    case IConstant.PATH_FOODS: {
		url = IConstant.URL_MEAL_FOODS;
		request.setAttribute("currentPage", action);
		String cateID = request.getParameter("cateID");
		int page = 0;
		if (cateID == null) {
		    cateID = "all";
		}
		MealDAO mealDAO = new MealDAO();
		CategoryFoodsDAO categoryFoodsDAO = new CategoryFoodsDAO();
		List<Meal> raw_listMeals = mealDAO.getAllMeal(cateID);
		List<Meal> paginationListMeal = null;
		int sizeList = raw_listMeals.size();
		List<Category> lisCateMeal = categoryFoodsDAO.getAllFoodCategory();
		String raw_page = request.getParameter("page");
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
		start = (page - 1) * IConstant.ITEMS_PER_PAGE_FOODS;
		end = Math.min(page * IConstant.ITEMS_PER_PAGE_FOODS, sizeList);
		paginationListMeal = MyLibs.pagination(raw_listMeals, start, end);

		request.setAttribute("paginationListMeal", paginationListMeal);
		request.setAttribute("listCateFood", lisCateMeal);
		request.setAttribute("selectedCate", cateID);
		request.setAttribute("sizeListFoods", sizeList);
		request.setAttribute("checkedPage", page);

		break;
	    }
	    case IConstant.PATH_MATERIAL: {
		url = IConstant.URL_MATERIALS;
		request.setAttribute("currentPage", action);
		String cateID = request.getParameter("cateID");
		int page = 0;
		if (cateID == null) {
		    cateID = "all";
		}
		CategoryDAO categoryDAO = new CategoryDAO();
		List<Material> raw_listMaterials = materialDAO.getAllMaterial(cateID);
		List<Material> paginationListMaterials = null;
		int sizeList = raw_listMaterials.size();
		List<Category> lisCateMaterial = categoryDAO.getAllCategory();
		String raw_page = request.getParameter("page");
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
		start = (page - 1) * IConstant.ITEMS_PER_PAGE_FOODS;
		end = Math.min(page * IConstant.ITEMS_PER_PAGE_FOODS, sizeList);
		paginationListMaterials = MyLibs.pagination(raw_listMaterials, start, end);

		request.setAttribute("paginationListMaterials", paginationListMaterials);
		request.setAttribute("lisCateMaterial", lisCateMaterial);
		request.setAttribute("selectedCate", cateID);
		request.setAttribute("sizeListMate", sizeList);
		request.setAttribute("checkedPage", page);
		break;
	    }
	    case IConstant.PATH_USER_INFO: {
		url = IConstant.SERVLET_USER_INFO;
		break;
	    }
	    case IConstant.PATH_CUSTOMIZE: {
		url = "personal-plan";

		break;
	    }
	    default: {
		url = IConstant.URL_HOME;
		List<Material> listTop10 = materialDAO.getTop10Material();
		request.setAttribute("listTop10", listTop10);
		request.setAttribute("currentPage", action);
		break;
	    }

	    }

	    request.getRequestDispatcher(url).forward(request, response);
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
