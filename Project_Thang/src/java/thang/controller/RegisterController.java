/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thang.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import thang.daoes.CustomerDAO;
import thang.errors.CustomerErrorObj;

/**
 *
 * @author User
 */
public class RegisterController extends HttpServlet {

    private final String REGISTER = "register.jsp";
    private final String SUCCESS = "login.jsp";

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
        String custID = request.getParameter("txtCustID");
        String password = request.getParameter("txtPassword");
        String confirm = request.getParameter("txtConfirm");
        String firstname = request.getParameter("txtFirstName");
        String middlename = request.getParameter("txtMidName");
        String lastname = request.getParameter("txtLastName");
        String address = request.getParameter("txtAddress");
        String phone = request.getParameter("txtPhone");

        String url = REGISTER;
        CustomerErrorObj errors = new CustomerErrorObj();
        boolean err = false;
        try {
            if (!password.equals(confirm)) {
                err = true;
                errors.setConfirmErr("Confirm password is not matched");
            }
            if (err) {
                request.setAttribute("REGISTER_ERROR", errors);
            } else {
                CustomerDAO dao = new CustomerDAO();
                boolean result = dao.insertAccount(custID, password, firstname, middlename, lastname, address, phone);
                if (result) {
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            log("Error at Register Controller: " + e.getMessage());
            if (e.getMessage().toLowerCase().contains("duplicate")) {
                errors.setIdExistErr(custID + " is existed!");
                request.setAttribute("REGISTER_ERROR", errors);
                url = REGISTER;
            }
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
