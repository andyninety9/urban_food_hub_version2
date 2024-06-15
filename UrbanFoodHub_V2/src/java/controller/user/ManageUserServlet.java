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
import javax.servlet.http.HttpSession;
import utils.IConstant;
import utils.MyLibs;

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

	if (action == null) {
	    request.setAttribute("error", "Action is required");
	    request.getRequestDispatcher(url).forward(request, response);
	    return;
	}

	try {
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
	    case "create-user": {
		HttpSession session = request.getSession();
		String role = (String) session.getAttribute("role");
		if (role.equals("1")) {
		    String accID = MyLibs.generateID("ACC");
		    String username = request.getParameter("username");
		    String password = request.getParameter("password");
		    String raw_role = request.getParameter("role");
		    AccountDao accountDao = new AccountDao();
		    int rs = accountDao.registerUserAccount(accID, username, password, Integer.parseInt(raw_role));
		    if (rs > 0) {
			response.sendRedirect(url);
		    } else {
			url = "register-form-admin.jsp";
			request.setAttribute("error", "Cannot create account!");
			request.getRequestDispatcher(url).forward(request, response);
		    }
		} else {
		    response.sendRedirect("logout");
		}
		break;
	    }
	    default: {
		request.setAttribute("error", "Unknown action: " + action);
		request.getRequestDispatcher(url).forward(request, response);
		break;
	    }
	    }
	} catch (Exception e) {
	    request.setAttribute("error", "An error occurred: " + e.getMessage());
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
