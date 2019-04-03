/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.controllers.customers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kim Anh
 */
public class CustomerMainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String GET_MY_INFORMATION = "GetMyInformationController";
    private static final String UPDATE_CUSTOMER_INFORMATION = "UpdateCustomerInformationController";
    private static final String VIEW_CUSTOMER_INFORMATION = "ViewCustomerInformationController";
    private static final String UPDATE_BY_ADMIN = "UpdateCustomerByAdminController";
    private static final String DELETE_BY_ADMIN = "DeleteCustomerByAdminController";
    private static final String INSERT_BY_ADMIN = "InsertCustomerByAdminController";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            switch(action) {
                case "GetMyInformation":            url = GET_MY_INFORMATION;
                                                    break;
                case "UpdateCustomerInformation":   url = UPDATE_CUSTOMER_INFORMATION;
                                                    break;
                case "ViewAccountInformation":      url = VIEW_CUSTOMER_INFORMATION;
                                                    break;
                case "UpdateCustomerByAdmin":       url = UPDATE_BY_ADMIN;
                                                    break;
                case "DeleteCustomerByAdmin":       url = DELETE_BY_ADMIN;
                                                    break;
                case "InsertCustomerByAdmin":       url = INSERT_BY_ADMIN;
                                                    break;
                default:                            request.setAttribute("ERROR", "Sorry! We have a problem.");
                                                    break;
            }
        } catch (Exception e) {
            log("Error at CustomerMainController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
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
