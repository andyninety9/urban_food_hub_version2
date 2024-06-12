/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.add_personal;

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

/**
 *
 * @author duyma
 */
public class EditPersonalPlanServlet extends HttpServlet {

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
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    String action = request.getParameter("action");
	    String url = null;
	    switch (action) {
	    case "update-name": {
		String newName = request.getParameter("newName");
		String planID = request.getParameter("planID");
		PlanDAO planDAO = new PlanDAO();
		int rs = planDAO.updatePersonalPlanName(planID, newName);
		if (rs > 0) {
		    url = "home?action=customize";
		} else {
		    url = "access-denied";
		}

		break;
	    }
	    case "update-date": {
		String planID = request.getParameter("planID");
		String raw_startDate = request.getParameter("startDate");
		String raw_endDate = request.getParameter("endDate");
		Date startDate = null;
		Date endDate = null;
		try {
		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    java.util.Date sDate = dateFormat.parse(raw_startDate);
		    java.util.Date eDate = dateFormat.parse(raw_endDate);

		    // Chuyển đổi đối tượng java.util.Date thành java.sql.Date
		    startDate = new java.sql.Date(sDate.getTime());
		    endDate = new java.sql.Date(eDate.getTime());
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		PlanDAO planDAO = new PlanDAO();
		int rs = planDAO.updatePersonalPlanDate(planID, startDate, endDate);
		if (rs > 0) {
		    url = "home?action=customize";
		} else {
		    url = "access-denied";
		}
		break;
	    }
	    case "delete": {
		String planID = request.getParameter("planID");
		PlanDAO planDAO = new PlanDAO();
		int rs = planDAO.updatePersonalPlanStatus(planID, 2);
		if (rs > 0) {
		    url = "home?action=customize";
		} else {
		    url = "access-denied";
		}
		break;
	    }
	    case "change-meal": {
		String detailID = request.getParameter("detailID");
		String mealID = request.getParameter("mealID");
		PlanDAO planDAO = new PlanDAO();
		int rs = planDAO.updatePersonalPlanMeal(detailID, mealID);
		if (rs > 0) {
		    url = "home?action=customize";
		} else {
		    url = "access-denied";
		}
		break;
	    }
	    case "change-date-meal": {
		String detailID = request.getParameter("mealPlanID");
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
		int rs = planDAO.updatePersonalDateMeal(detailID, newDate, oldDate);

		if (rs > 0) {
		    url = "home?action=customize";
		} else {
		    url = "access-denied";
		}
		break;
	    }
	    default: {
		url = "home";
		break;
	    }
	    }
	    response.sendRedirect(url);
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
