/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.foods;

import dao.InstructionMealDAO;
import dto.InstructionMeal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.MyLibs;

/**
 *
 * @author duyma
 */
public class ManageInstructionServlet extends HttpServlet {

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
	    out.println("<title>Servlet ManageInstructionServlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet ManageInstructionServlet at " + request.getContextPath() + "</h1>");
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
	InstructionMealDAO instructionMealDAO = new InstructionMealDAO();
	String mealID = request.getParameter("mealID");

	List<InstructionMeal> listInstructionMeals = instructionMealDAO.getInstruction(mealID);
	request.setAttribute("selectedMealID", mealID);
	request.setAttribute("instrList", listInstructionMeals);
	request.getRequestDispatcher("foods/manage-instruction-meal.jsp").forward(request, response);
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
	String action = request.getParameter("action");
	switch (action) {
	case "add": {
	    String instrName = request.getParameter("instrName");
	    String instrDesc = request.getParameter("instrDesc");
	    String mealID = request.getParameter("mealID");
	    String instrID = MyLibs.generateID("INST");

	    InstructionMealDAO instructionMealDAO = new InstructionMealDAO();
	    int rs = instructionMealDAO.addInstruction(instrID, instrName, instrDesc, mealID);
	    if (rs > 0) {
		response.sendRedirect(request.getContextPath() + "/manage-instruction?mealID=" + mealID);
	    } else {
		request.setAttribute("error", "Cannot add!");
		request.getRequestDispatcher("manage-instruction?mealID=" + mealID);
	    }
	    break;
	}
	case "editInstrName": {
	    InstructionMealDAO instructionMealDAO = new InstructionMealDAO();
	    String instrID = request.getParameter("instrID");
	    String instrName = request.getParameter("instrName");
	    String mealID = request.getParameter("mealID");
	    int rs = instructionMealDAO.editNameInstruction(instrID, instrName);
	    if (rs > 0) {
		response.sendRedirect(request.getContextPath() + "/manage-instruction?mealID=" + mealID);
	    } else {
		request.setAttribute("error", "Cannot add!");
		request.getRequestDispatcher("manage-instruction?mealID=" + mealID);
	    }
	    break;
	}
	case "editInstrDesc": {
	    InstructionMealDAO instructionMealDAO = new InstructionMealDAO();
	    String instrID = request.getParameter("instrID");
	    String instrDesc = request.getParameter("instrDesc");
	    String mealID = request.getParameter("mealID");
	    int rs = instructionMealDAO.editDescInstruction(instrID, instrDesc);
	    if (rs > 0) {
		response.sendRedirect(request.getContextPath() + "/manage-instruction?mealID=" + mealID);
	    } else {
		request.setAttribute("error", "Cannot add!");
		request.getRequestDispatcher("manage-instruction?mealID=" + mealID);
	    }

	    break;
	}
	case "delete": {
	    InstructionMealDAO instructionMealDAO = new InstructionMealDAO();
	    String instrID = request.getParameter("instrID");
	    String mealID = request.getParameter("mealID");
	    int rs = instructionMealDAO.deleteInstruction(instrID);
	    if (rs > 0) {
		response.sendRedirect(request.getContextPath() + "/manage-instruction?mealID=" + mealID);
	    } else {
		request.setAttribute("error", "Cannot add!");
		request.getRequestDispatcher("manage-instruction?mealID=" + mealID);
	    }

	    break;
	}
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
