/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.dashboard;

import dao.OrderDAO;
import dao.ReportDAO;
import dto.Account;
import dto.Product;
import dto.Report;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author duyma
 */
public class DashboardServlet extends HttpServlet {

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

	int waitingConfirm = 0;
	int waitingShip = 0;
	int countCancelOrder = 0;
	int deliveredOrder = 0;
	OrderDAO orderDAO = new OrderDAO();
	waitingConfirm = orderDAO.countOrderByStatusID(1);
	waitingShip = orderDAO.countOrderByStatusID(2);
	countCancelOrder = orderDAO.countOrderByStatusID(5);
	deliveredOrder = orderDAO.countOrderByStatusID(4);
        ReportDAO reportDAO = new ReportDAO();
        Report report = reportDAO.getReport();
        HashMap<Product, Integer> listTopSellProduct = report.getListTopSellProduct();
        HashMap<Account, Integer> listTopAccountCancelOrder = report.getListTopAccountCancelOrder();
        List<Map.Entry<Product, Integer>> sortedList = listTopSellProduct.entrySet()
            .stream()
            .sorted(Map.Entry.<Product, Integer>comparingByValue().reversed())
            .collect(Collectors.toList());
        List<Map.Entry<Account, Integer>> sortedTopAccountsCancelOrder = listTopAccountCancelOrder.entrySet()
            .stream()
            .sorted(Map.Entry.<Account, Integer>comparingByValue().reversed())
            .collect(Collectors.toList());
        request.setAttribute("sortedListTopSellProduct", sortedList);
        request.setAttribute("sortedListTopAccountCancelOrder", sortedTopAccountsCancelOrder);
	request.setAttribute("report", report);
	request.setAttribute("deliveredOrder", deliveredOrder);
	request.setAttribute("countCancelOrderToday", countCancelOrder);
	request.setAttribute("waitingConfirm", waitingConfirm);
	request.setAttribute("waitingShip", waitingShip);
	request.setAttribute("currentPage", "dashboard");
	request.getRequestDispatcher("admin/dashboard-02.jsp").forward(request, response);
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
