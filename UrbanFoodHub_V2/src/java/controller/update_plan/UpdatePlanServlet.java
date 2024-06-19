/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.update_plan;

import dao.PlanDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.MyLibs;

/**
 *
 * @author duyma
 */
public class UpdatePlanServlet extends HttpServlet {

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
	    String url = "";
	    String action = request.getParameter("action");
	    switch (action) {
	    case "editMealPlan": {
		String planID = request.getParameter("planID");
		String planName = request.getParameter("planName");
		String planDesc = request.getParameter("planDesc");
		String planCate = request.getParameter("planCate");
		String raw_startDate = request.getParameter("startDate");
		String raw_endDate = request.getParameter("endDate");
		Date startDate = null;
		Date endDate = null;
		try {
		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    java.util.Date sDate = dateFormat.parse(raw_startDate);
		    java.util.Date eDate = dateFormat.parse(raw_endDate);

		    startDate = new java.sql.Date(sDate.getTime());
		    endDate = new java.sql.Date(eDate.getTime());
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		PlanDAO planDAO = new PlanDAO();
		int rs = planDAO.updateMealPlanInfo(planCate, planName, planDesc, startDate, endDate, planID);
		if (rs > 0) {
		    url = "admin-router?action=update-plan&planID=" + planID;
		    response.sendRedirect(url);
		} else {
		    url = "access-denied";
		    request.setAttribute("error", "Cannot update meal plan ID " + planID);
		    request.getRequestDispatcher(url).forward(request, response);
		}
		break;
	    }
	    case "change-status": {
		String mealPlanID = request.getParameter("mealPlanID");
		String raw_statusID = request.getParameter("status");
		int statusID = 2;

		if (raw_statusID != null) {
		    statusID = Integer.parseInt(raw_statusID);
		}
		PlanDAO planDAO = new PlanDAO();
		int rs = planDAO.updateMealPlanStatus(statusID, mealPlanID);
		if (rs > 0) {
		    url = "admin-router?action=manage-plans";
		    response.sendRedirect(url);
		} else {
		    url = "access-denied";
		    request.setAttribute("error", "Cannot hide " + mealPlanID);
		    request.getRequestDispatcher(url).forward(request, response);
		}
		break;
	    }
	    case "change-meal": {
		String detailID = request.getParameter("detailID");
		String mealID = request.getParameter("mealID");
		String planID = request.getParameter("planID");
		PlanDAO planDAO = new PlanDAO();
		int rs = planDAO.editMealPlanDetail(detailID, mealID);
		if (rs > 0) {
		    url = "admin-router?action=update-plan&planID=" + planID;
		    response.sendRedirect(url);
		} else {
		    url = "access-denied";
		    request.setAttribute("error", "Cannot change meal in " + planID);
		    request.getRequestDispatcher(url).forward(request, response);
		}
		break;
	    }
	    case "change-date-meal": {
		String detailID = request.getParameter("mealPlanID");
		String planID = request.getParameter("planID");
		String raw_date = request.getParameter("newDate");
		String raw_oldDate = request.getParameter("oldDate");
		Date newDate = null;
		Date oldDate = null;
		try {
		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    java.util.Date eDate = dateFormat.parse(raw_date);
		    java.util.Date sDate = dateFormat.parse(raw_oldDate);

		    // Chuyển đổi đối tượng java.util.Date thành java.sql.Date
		    newDate = new java.sql.Date(eDate.getTime());
		    oldDate = new java.sql.Date(sDate.getTime());
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		PlanDAO planDAO = new PlanDAO();
		int rs = planDAO.updateDateMeal(detailID, newDate, oldDate);

		if (rs > 0) {
		    url = "admin-router?action=update-plan&planID=" + planID;
		    response.sendRedirect(url);
		} else {
		    url = "access-denied";
		    request.setAttribute("error", "Cannot change date in " + detailID);
		    request.getRequestDispatcher(url).forward(request, response);
		}
		break;
	    }
	    case "create-meal-plan": {
		String mealPlanID = MyLibs.generateID("MP");
		String planName = request.getParameter("planName");
		String planDesc = request.getParameter("planDesc");
		String planCate = request.getParameter("planCate");
		String raw_startDate = request.getParameter("startDate");
		String raw_endDate = request.getParameter("endDate");
		Date startDate = null;
		Date endDate = null;
		try {
		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    java.util.Date sDate = dateFormat.parse(raw_startDate);
		    java.util.Date eDate = dateFormat.parse(raw_endDate);

		    startDate = new java.sql.Date(sDate.getTime());
		    endDate = new java.sql.Date(eDate.getTime());
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		PlanDAO planDAO = new PlanDAO();
		int rs = planDAO.createNewMealPlan(mealPlanID, planCate, planName, planDesc, startDate, endDate, null,
			2);
		if (rs > 0) {
		    url = "admin-router?action=manage-plans";
		    response.sendRedirect(url);
		} else {
		    url = "access-denied";
		    request.setAttribute("error", "Cannot create new plan ");
		    request.getRequestDispatcher(url).forward(request, response);
		}
		break;
	    }
	    case "add-new-day-plan": {
		String raw_planDate = request.getParameter("mealDate");
		String mealPlanID = request.getParameter("mealPlanID");
		Date planDate = null;
		try {
		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    java.util.Date sDate = dateFormat.parse(raw_planDate);
		    planDate = new java.sql.Date(sDate.getTime());
		} catch (ParseException e) {
		    e.printStackTrace();
		}

		PlanDAO planDAO = new PlanDAO();
		int isExistDate = planDAO.getPlanDetailByDate(mealPlanID, planDate);
		if (isExistDate == 1) {
		    url = "access-denied";
		    request.setAttribute("error", "Duplicate day in plan");
		    request.getRequestDispatcher(url).forward(request, response);
//		    return;
		} else {
		    int rs = planDAO.addNewDayPlanDetail(mealPlanID, planDate);
		    if (rs > 0) {
			url = "admin-router?action=update-plan&planID=" + mealPlanID;
			response.sendRedirect(url);
//			return;
		    } else {
			url = "access-denied";
			request.setAttribute("error", "Cannot create new day plan");
			request.getRequestDispatcher(url).forward(request, response);
//			return;
		    }
		}
	    }
	    default: {
		url = "admin-router?action=manage-plans";
		response.sendRedirect(url);
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
