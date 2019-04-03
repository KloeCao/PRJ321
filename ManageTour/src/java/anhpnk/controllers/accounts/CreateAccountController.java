/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.controllers.accounts;

import anhpnk.daos.AccountDAO;
import anhpnk.dtos.AccountDTO;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kim Anh
 */
public class CreateAccountController extends HttpServlet {
    private static final String SUCCESS = "createAccount.jsp";
    private static final String FAIL = "error.jsp";

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
            String username = request.getParameter("username");
            String role = request.getParameter("role");
            String password = "WING-" + username;
            boolean status = true;
            AccountDTO account = new AccountDTO(username, password, role, status);
            AccountDAO dao = new AccountDAO();
            boolean insert = dao.insert(account);
            if(insert) {
                url = SUCCESS;
                request.setAttribute("ACCOUNT", username);
                long date = System.currentTimeMillis();
                Date today = new Date(date);
                int validYear = today.getYear() + 1900 - 18;
                request.setAttribute("VALID_BIRTHDAY", validYear + "12-31");
            } else {
                request.setAttribute("ERROR", "Sorry! Cannot create an account.");
            }
        } catch (Exception e) {
            log("Error at CreateAccountController: " + e.getMessage());
            if(e.getMessage().contains("duplicate")) {
                request.setAttribute("ERROR", "This Username is existed. Please enter another.");
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
