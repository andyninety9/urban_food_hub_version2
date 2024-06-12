/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.user;

import dao.AccountDao;
import dao.UserDAO;
import dto.Account;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.IConstant;

/**
 *
 * @author duyma
 */
public class ManageUserServlet extends HttpServlet {

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
	String url = "admin-router?action=manage-user";
	switch (action) {
	case "update-status": {
	    String accID = request.getParameter("accID");
	    AccountDao accountDao = new AccountDao();
	    Account acc = accountDao.getAccountByID(accID);
	    int statusAcc = acc.getStatusID();
	    if (statusAcc < 3) {
		statusAcc++;
	    } else if (statusAcc == 3) {
		statusAcc = 1;
	    }
	    int rs = accountDao.updateStatus(accID, statusAcc);
	    if (rs > 0) {
		response.sendRedirect(url);
	    } else {
		request.setAttribute("error", "Cannot update status account " + accID);
		request.getRequestDispatcher(url).forward(request, response);
	    }
	    break;
	}
	case "reset-password": {
	    String accID = request.getParameter("accID");
	    UserDAO userDAO = new UserDAO();
	    int rs = userDAO.updatePassword(accID, IConstant.DEFAULT_PASSWORD);
	    if (rs > 0) {
		response.sendRedirect(url);
	    } else {
		request.setAttribute("error", "Cannot reset password " + accID);
		request.getRequestDispatcher(url).forward(request, response);
	    }
	    break;
	}

	}
	request.getRequestDispatcher(url).forward(request, response);
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
