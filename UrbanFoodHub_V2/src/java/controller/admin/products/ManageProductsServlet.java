/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.products;

import dao.CategoryDAO;
import dao.MaterialDAO;
import dto.Category;
import dto.Material;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author duyma
 */
public class ManageProductsServlet extends HttpServlet {

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
	    out.println("<title>Servlet ManageProductsServlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet ManageProductsServlet at " + request.getContextPath() + "</h1>");
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
	String cateID = request.getParameter("cateID");
	String raw_page = request.getParameter("page");
	MaterialDAO materialDAO = new MaterialDAO();
	CategoryDAO categoryDAO = new CategoryDAO();
	List<Category> listCategories = categoryDAO.getAllCategory();
	List<Material> listAllMaterial = materialDAO.getAllMaterial(cateID);
	int numPerPage = 10, page = 1, size = listAllMaterial.size();
//	System.out.println(size);
	if (raw_page == null) {
	    page = 1;
	} else {
	    try {
		page = Integer.parseInt(raw_page);
	    } catch (NumberFormatException e) {
		e.printStackTrace();
	    }
	}
	int start, end;
	start = (page - 1) * numPerPage;
	end = Math.min(page * numPerPage, size);
	List<Material> listPerPage = materialDAO.getListByPage(listAllMaterial, start, end);
	request.removeAttribute("selectedCate");
//	HttpSession session = request.getSession();
//	session.removeAttribute("selectedCate");
	for (Category category : listCategories) {
	    if (category.getCateID().equals(cateID)) {
		request.setAttribute("selectedCate", category.getCateName());
		break;
	    }
	}
	request.setAttribute("sizeMaterial", size);
	request.setAttribute("allMaterial", listPerPage);
	request.setAttribute("allCategory", listCategories);
	request.getRequestDispatcher("admin/view-all-products.jsp").forward(request, response);
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
