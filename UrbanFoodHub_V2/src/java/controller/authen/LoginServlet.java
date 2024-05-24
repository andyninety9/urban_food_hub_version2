/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.authen;

import dao.AccountDao;
import dao.UserDAO;
import dto.Account;
import dto.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author duyma
 */
public class LoginServlet extends HttpServlet {

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
	    out.println("<title>Servlet LoginServlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
	request.getRequestDispatcher("login-form.jsp").forward(request, response);
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
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	boolean rem = "on".equals(request.getParameter("rem"));

	UserDAO userDao = new UserDAO();
	User userLogin = userDao.getUser(username, password);
	if (userLogin != null) {
	    AccountDao accountDao = new AccountDao();
	    Account acc = accountDao.getAccountByID(userLogin.getAccID());
	    HttpSession session = request.getSession();
	    session.setAttribute("user", acc);
	    response.addCookie(new Cookie("role", String.valueOf(userLogin.getRoleID())));

	    if (rem) {
		response.addCookie(new Cookie("username", username));
		response.addCookie(new Cookie("password", password));
		response.addCookie(new Cookie("rem", request.getParameter("rem")));
	    } else {
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
		    if (cookie.getName().equals("username") || cookie.getName().equals("password")) {
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		    }
		}
	    }
	    response.sendRedirect("home");
	} else {
	    request.setAttribute("error", "Invalid username or password");
	    request.getRequestDispatcher("login-form.jsp").forward(request, response);
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
