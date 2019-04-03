/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.controllers.accounts;

import anhpnk.daos.AccountDAO;
import anhpnk.daos.CustomerDAO;
import anhpnk.dtos.AccountDTO;
import anhpnk.dtos.CustomerDTO;
import anhpnk.objects.CustomerErrorObject;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kim Anh
 */
public class SignUpController extends HttpServlet {

    private static final String SUCCESS = "login.jsp";
    private static final String FAIL = "signup.jsp";

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
        CustomerErrorObject errObj = new CustomerErrorObject();
        try {
            boolean valid = true;
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            String fullname = new String(request.getParameter("fullname").getBytes("ISO-8859-1"), "UTF-8");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            if (!confirm.equals(password)) {
                errObj.setConfirm("Confirm password must be match your password.");
                valid = false;
            }
            
            if(valid) {
                AccountDTO account = new AccountDTO(username, password, "user", true);
                AccountDAO daoA = new AccountDAO();
                boolean createAccount = daoA.insert(account);
                if(createAccount) {
                    CustomerDTO customer = new CustomerDTO(username, fullname, email, phone);
                    CustomerDAO daoC = new CustomerDAO();
                    boolean insertCustomer = daoC.insert(customer);
                    if(insertCustomer) {
                        url = SUCCESS;
                    }
                }
            } else {
                request.setAttribute("ERROR", errObj);
            }
        } catch (Exception e) {
            log("Error at SignUpController: " + e.getMessage());
            if (e.getMessage().contains("duplicate")) {
                errObj.setUsername("This username is existed. Please enter another.");
                request.setAttribute("ERROR", errObj);
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
