/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asm4.servlet;

import asm4.daoes.AccountsDAO;
import asm4.error.AccountError;
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
public class SignUpProcess extends HttpServlet {

    private static final String SUCCESS = "success.jsp";
    private static final String INVALID = "signup.jsp";

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
        String url = INVALID;
        String user = request.getParameter("txtUser");
        String pwd = request.getParameter("txtPwd");
        String confirm = request.getParameter("txtConfirm");
        String name = request.getParameter("txtName");
        String role = request.getParameter("role");
        AccountError errors = new AccountError();
        boolean err = false;
        try {
            //Name
            if (name.isEmpty()) {
                err = true;
                errors.setNameError("Fullname is not be empty");
            } else if (name.trim().length() > 50) {
                err = true;
                errors.setNameError("Fullname must not be over 50 characters");
            } else if (name.contains("$")
                    || name.contains("#")
                    || name.contains("@")
                    || name.contains("%")
                    || name.contains("^")
                    || name.contains("&")
                    || name.contains("*")) {
                err = true;
                errors.setNameError("Fullname contains no special characters such as [$,#,@,%,^,&,*]");
            } else if (name.contains("0")
                    || name.contains("1")
                    || name.contains("2")
                    || name.contains("3")
                    || name.contains("4")
                    || name.contains("5")
                    || name.contains("6")
                    || name.contains("7")
                    || name.contains("8")
                    || name.contains("9")) {
                err = true;
                errors.setNameError("Fullname contains no any number");
            }

            //Username
            if (user.isEmpty()) {
                err = true;
                errors.setUserError("Username is not be empty");
            } else if (user.trim().length() < 6 || user.trim().length() > 20) {
                err = true;
                errors.setUserError("Username must be [6-20] characters");
            } else if (user.contains("$")
                    || user.contains("#")
                    || user.contains("@")
                    || user.contains("%")
                    || user.contains("^")
                    || user.contains("&")
                    || user.contains("*")) {
                err = true;
                errors.setUserError("Username contains no special characters such as [$,#,@,%,^,&,*]");
            }

            //Password
            if (pwd.isEmpty()) {
                err = true;
                errors.setPwdError("Password is not be empty");
            } else if (pwd.trim().length() < 8 || pwd.trim().length() > 50) {
                err = true;
                errors.setPwdError("Password must be [8-50] characters");
            }
            //Confirm
            if (!pwd.equals(confirm)) {
                err = true;
                errors.setConfirmError("Confirm password is not matched");
            }
            //Show error
            if (err) {
                errors.setHaveTrouble("Error during signup process.<br/>"
                        + "Please scroll down to the signup form for more details.<br/>"
                        + "Please try again, thank you!");
                request.setAttribute("SIGNUP_ERROR", errors);
            } else {
                AccountsDAO dao = new AccountsDAO();
                boolean signup = dao.insertAccount(user, pwd, name, role);
                if (signup) {
                    url = SUCCESS;
                }
            }
        } catch (SQLException ex) {
            //Account ID is existed.
            if (ex.getMessage().toLowerCase().contains("duplicate")) {
                errors.setUserExited(user + " is existed!");
                request.setAttribute("SIGNUP_ERROR", errors);
                url = INVALID;
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
