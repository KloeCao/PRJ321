/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.controllers.accounts;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kim Anh
 */
public class AccountMainController extends HttpServlet {
    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "LoginController";
    private static final String CHECK_LOGIN = "CheckLoginController";
    private static final String LOG_OUT = "LogOutController";
    private static final String CHANGE_PASSWORD = "ChangePasswordController";
    private static final String SIGN_UP = "SignUpController";
    private static final String SEARCH = "SearchAccountController";
    private static final String VIEW_INFORMATION = "ViewAccountInformationController";
    private static final String CREATE_ACCOUNT = "CreateAccountController";

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
                case "Login":                   url = LOGIN;
                                                break;
                case "CheckLogin":              url = CHECK_LOGIN;
                                                break;
                case "LogOut":                  url = LOG_OUT;
                                                break;
                case "ChangePassword":          url = CHANGE_PASSWORD;
                                                break;
                case "SignUp":                  url = SIGN_UP;
                                                break;
                case "SearchAccount":           url = SEARCH;
                                                break;
                case "ViewAccountInformation":  url = VIEW_INFORMATION;
                                                break;
                case "CreateAccount":           url = CREATE_ACCOUNT;
                                                break;
                default:                        request.setAttribute("ERROR", "Sorry! We have a problem.");
                                                break;
            }
        } catch (Exception e) {
            log("Error at AccountMainController: " + e.getMessage());
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
