/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cm.controllers;

import cm.daoes.AccountDAO;
import cm.errors.AccountErrorObj;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CaoThu
 */
public class ConfirmUpdateProfileController extends HttpServlet {

    private static String UPDATE = "manageUpdateProfile.jsp";
    private static String SUCCESS = "ManageAccountController";
    private static String ERROR = "error.jsp";

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
//        String url = ERROR;
        String accountID = request.getParameter("txtAccountID");
        String password = request.getParameter("txtPassword");
        String accountName = request.getParameter("txtAccountName");
        String phone = request.getParameter("txtPhone");
        String address = request.getParameter("txtAddress");
        int role = 0;

        String url = ERROR;
        AccountErrorObj errors = new AccountErrorObj();
        boolean err = false;

        try {
            //Account Name
            if (accountName.isEmpty()) {
                err = true;
                errors.setErrAccName("Account Name is not empty");
            } else if (accountName.trim().length() > 50) {
                err = true;
                errors.setErrAccName("Account Name is not over 50 characters");
            }
            //Password
            if (password.isEmpty()) {
                err = true;
                errors.setErrPassword("Password is not empty");
            } else if (password.trim().length() < 6 || password.trim().length() > 36) {
                err = true;
                errors.setErrPassword("Password is requied from 6 - 36 characters");
            }

            //Phone
            if (phone.trim().length() < 10 || phone.trim().length() > 11) {
                err = true;
                errors.setErrPhone("Phone is requied 10 or 11 characters");

            }
            //Address
            if (address.isEmpty()) {
                err = true;
                errors.setErrAddress("Address is not empty");
            } else if (address.trim().length() > 350) {
                err = true;
                errors.setErrAddress("Address is not over 350 characters");
            }
            //Role
            try {
                role = Integer.parseInt(request.getParameter("txtRole"));
                if (role < 1 || role > 3) { //price <0
                    err = true;
                    errors.setErrRole("Role: 1- Admin; 2- User; 3-Banned");
                }

            } catch (NumberFormatException e) { //price not number
                err = true;
                errors.setErrRole("Role must be number");
            }
            //SHOW ERROR 
            if (err) {
                request.setAttribute("UPDATE_ACCOUNT_ERROR", errors);
                url = UPDATE;
            } else {
                AccountDAO dao = new AccountDAO();
                boolean result = dao.updateAccount(accountID, password, accountName, phone, address, role);
                if (result) {
                    url = SUCCESS;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
