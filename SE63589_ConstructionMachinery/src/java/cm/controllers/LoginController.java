package cm.controllers;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import cm.daoes.AccountDAO;
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
public class LoginController extends HttpServlet {

    private static String ADMIN = "ManageAccountController";
    private static String SUCCESS = "ShowMachineController";
    private static String INVALID = "invalidLogin.html";
    private static String EMPTY = "login.html";

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
        try {
            String accountID = request.getParameter("txtAccountID");
            String password = request.getParameter("txtPassword");
            if (accountID.isEmpty() || password.isEmpty()) {
                url = EMPTY;
            }
            AccountDAO dao = new AccountDAO();
            boolean result = dao.checkLogin(accountID, password);
            if (result) {
                if (dao.getDto().getRole() == 1) {
                    url = ADMIN; //for admin
                } else if (dao.getDto().getRole() == 2) {
                    url = SUCCESS;  //for users
                } else if (dao.getDto().getRole() == 3) {
                    url = INVALID;  //for banned
                }

                HttpSession session = request.getSession();
                String accountName = dao.showAccountName(accountID);
                session.setAttribute("NAME_ACCOUNT", accountName);
            }
        } catch (Exception e) {
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
