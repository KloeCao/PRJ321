/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asm4.servlet;

import asm4.daoes.AccountsDAO;
import asm4.error.AccountError;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CaoThu
 */
public class loginProcess extends HttpServlet {

    private static final String SUCCESS = "ShowPostServlet";
    private static final String INVALID = "login.jsp";

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
        HttpSession session = request.getSession();
        String name, role;
        try {
            String user = request.getParameter("txtUser");
            String pwd = request.getParameter("txtPwd");

            AccountError errors = new AccountError();
            boolean err = false;
            if (user.isEmpty()) {
                err = true;
                errors.setUserError("Please enter your Username");
            }
            if (pwd.isEmpty()) {
                err = true;
                errors.setPwdError("Please enter your Password");
            }
            AccountsDAO dao = new AccountsDAO();
            boolean login = dao.checkLogin(user, pwd);
            if (login) {
                url = SUCCESS;
                name = dao.showAccountName(user);
                role = dao.getRole(user);
                session.setAttribute("FULLNAME", name);
                session.setAttribute("ROLE", role);
                session.setAttribute("USERNAME", user);
            } else {
                err = true;
                errors.setPwdError("Wrong username / password");
            }

            if (err) {
                errors.setHaveTrouble("Error during login process.<br/>"
                        + "Please scroll down to the login form for more details.<br/>"
                        + "Please try again, thank you!");
                request.setAttribute("LOGIN_ERROR", errors);
            }

        } catch (Exception e) {
            log("ERROR at LoginController: " + e.getMessage());
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
