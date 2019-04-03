/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.controllers.accounts;

import anhpnk.daos.AccountDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kim Anh
 */
public class ChangePasswordController extends HttpServlet {

    private static final String SUCCESS = "LogOutController";
    private static final String FAIL = "changePassword.jsp";
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
        String url = FAIL;
        try {
            boolean valid = true;
            String oldP = request.getParameter("oldPassword");
            String newP = request.getParameter("newPassword");
            String confirmP = request.getParameter("confirmPassword");
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("USERNAME");
            AccountDAO dao = new AccountDAO();
            String password = dao.getPassword(username);
            if(!oldP.equals(password)) {
                valid = false;
                request.setAttribute("WRONG_PASSWORD", "Incorrect Password. Please enter again.");
            }
            if(newP.equals(password)) {
                valid = false;
                request.setAttribute("DUPLICATE_PASSWORD", "This password is matched old password. Please enter another.");
            }
            if(!newP.equals(confirmP)) {
                valid = false;
                request.setAttribute("CONFIRM_FAIL", "Confirm password must be match new password.");
            }
            if(valid) {
                boolean update = dao.updatePassword(username, newP);
                if(update) {
                    url = SUCCESS;
                } else {
                    request.setAttribute("UPDATE_FAIL", "Sorry! Cannot change your password.");
                    url = FAIL;
                }
            }
        } catch (Exception e) {
            log("Error at ChangePasswordController: " + e.getMessage());
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
