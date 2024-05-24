/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.authen;

import dao.AccountDao;
import dto.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author duyma
 */
public class UpdateAccountServlet extends HttpServlet {

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
	    out.println("<title>Servlet UpdateAccountServlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet UpdateAccountServlet at " + request.getContextPath() + "</h1>");
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
	request.getRequestDispatcher("update-account-form.jsp").forward(request, response);
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
	HttpSession session = request.getSession();
	Account account = (Account) session.getAttribute("user");
	String newFirstName = request.getParameter("firstname");
	if (newFirstName == null || newFirstName.isEmpty()) {
	    newFirstName = account.getFirstname();
	}

	String newLastName = request.getParameter("lastname");
	if (newLastName == null || newLastName.isEmpty()) {
	    newLastName = account.getLastname();
	}

	String newEmail = request.getParameter("email");
	if (newEmail == null || newEmail.isEmpty()) {
	    newEmail = account.getEmail();
	}

	String newPhone = request.getParameter("phone");
	if (newPhone == null || newPhone.isEmpty()) {
	    newPhone = account.getPhone();
	}

	String raw_newDob = request.getParameter("dob");
	java.sql.Date newDob = null;
	if (raw_newDob == null || raw_newDob.isEmpty()) {
	    newDob = account.getBirthday();
	} else {
	    try {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = dateFormat.parse(raw_newDob);

		// Chuyển đổi đối tượng java.util.Date thành java.sql.Date
		newDob = new java.sql.Date(utilDate.getTime());
	    } catch (ParseException e) {
		e.printStackTrace();
	    }
	}
	try {
	    AccountDao accountDao = new AccountDao();
	    if (accountDao.getAccountByEmail(newEmail) != null
		    && !accountDao.getAccountByEmail(newEmail).getAccID().equals(account.getAccID())) {
		request.setAttribute("error", "Email have been used");
		request.getRequestDispatcher("update-account-form.jsp").forward(request, response);
	    } else if (accountDao.getAccountByPhone(newPhone) != null
		    && !accountDao.getAccountByPhone(newPhone).getAccID().equals(account.getAccID())) {
		request.setAttribute("error", "Phone number have been used");
		request.getRequestDispatcher("update-account-form.jsp").forward(request, response);
	    } else {
		int rs = accountDao.updateAccountInfo(account.getAccID(), newFirstName, newLastName, newEmail, newPhone,
			newDob);

//		if (inputStream != null) {
//		    inputStream.close();
//		}

		if (rs > 0) {
		    Account newAccount = accountDao.getAccountByID(account.getAccID());
		    session.setAttribute("user", newAccount);
		    response.sendRedirect("home");
		} else {
		    response.sendRedirect("error404.jsp");
		}
	    }
	} catch (Exception e) {
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
