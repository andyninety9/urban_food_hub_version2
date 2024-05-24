/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.products;

import dao.MaterialDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.MyLibs;

/**
 *
 * @author duyma
 */
public class AddNewMaterialServlet extends HttpServlet {

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
	    out.println("<title>Servlet AddNewMaterialServlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet AddNewMaterialServlet at " + request.getContextPath() + "</h1>");
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
	request.getRequestDispatcher("admin/add-new-material-layout.jsp").forward(request, response);
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
	String sku = MyLibs.generateID("SKU");
	String mateName = request.getParameter("mateName");
	String mateDesc = request.getParameter("mateDesc");
	String raw_price = request.getParameter("price");
	String cateID = request.getParameter("cateID");
	String packaging = request.getParameter("packaging");
	String raw_status = request.getParameter("status");
	String raw_stock = request.getParameter("stock");
	byte[] mateImg = null;
	double price, stock;
	int status;
	try {
	    price = Double.parseDouble(raw_price);
	    stock = Double.parseDouble(raw_stock);
	    if (raw_status != null && raw_status.equals("1")) {
		status = Integer.parseInt(raw_status);
	    } else {
		status = 3;
	    }
	    Date createdDate = new Date(System.currentTimeMillis());
	    MaterialDAO materialDAO = new MaterialDAO();
	    int rs = materialDAO.addMaterial(sku, cateID, mateName, mateDesc, price, packaging, stock, createdDate,
		    mateImg, status);
	    if (rs > 0) {
		response.sendRedirect("manage-products");
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
