/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin_router;

import dao.AccountDao;
import dao.OrderDAO;
import dao.ReportDAO;
import dto.Account;
import dto.Order;
import dto.ReportUser;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.IConstant;

/**
 *
 * @author duyma
 */
public class AdminRouterServlet extends HttpServlet {

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
	String url = "";

	if (action != null) {
	    switch (action) {
	    case IConstant.PATH_MANAGE_ORDER: {
		url = IConstant.URL_MANAGE_ORDER;

		String orderID = null;
		String accID = request.getParameter("accID");
		String raw_fromDate = request.getParameter("fromDate");
		String raw_toDate = request.getParameter("toDate");
		String raw_statusID = request.getParameter("statusID");
		String selectSearch = request.getParameter("selectSearch");
		String keyword = request.getParameter("keyword");

		if (selectSearch != null && selectSearch.equals("orderID")) {
		    orderID = keyword;
		}

		int statusID = 0;
		Date fromDate = null;
		Date toDate = null;

		try {
		    if (raw_statusID != null && !raw_statusID.isEmpty()) {
			statusID = Integer.parseInt(raw_statusID);
		    }
		} catch (NumberFormatException e) {
		    e.printStackTrace(); // Log error for debugging
		}

		request.setAttribute("statusID", statusID);

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		try {
		    if (raw_fromDate != null && !raw_fromDate.isEmpty()) {
			fromDate = new java.sql.Date(dateFormat.parse(raw_fromDate).getTime());
		    }
		    if (raw_toDate != null && !raw_toDate.isEmpty()) {
			toDate = new java.sql.Date(dateFormat.parse(raw_toDate).getTime());
		    }
		} catch (ParseException e) {
		    e.printStackTrace(); // Log error for debugging
		}

		AccountDao accountDao = new AccountDao();
		List<Account> listAccounts = accountDao.getAllAccount(null);

		OrderDAO orderDAO = new OrderDAO();
		List<Order> listOrder = orderDAO.getAllOrder(accID, statusID, fromDate, toDate, orderID);

		request.setAttribute("listOrder", listOrder);
		request.setAttribute("listAccounts", listAccounts);
		break;
	    }
	    case IConstant.PATH_MANAGE_USER: {
		request.setAttribute("currentPage", IConstant.PATH_MANAGE_USER);
		url = IConstant.URL_MANAGE_USER;
		ReportDAO reportDAO = new ReportDAO();
		List<ReportUser> listReportUsers = reportDAO.getReportUser();
		AccountDao accountDao = new AccountDao();
		List<Account> listAccounts = accountDao.getAllAccount(null);
		request.setAttribute("listAccounts", listAccounts);
		request.setAttribute("listReportUsers", listReportUsers);
		break;
	    }

	    default: {
		url = "dashboard";
		break;
	    }
	    }
	} else {
	    url = "dashboard";
	}

	request.getRequestDispatcher(url).forward(request, response);
    }
//    }

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
