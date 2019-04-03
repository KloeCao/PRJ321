/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.controllers.accounts;

import anhpnk.daos.AccountDAO;
import anhpnk.daos.CustomerDAO;
import anhpnk.daos.StaffDAO;
import anhpnk.daos.TourGuideDAO;
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
public class LoginController extends HttpServlet {
    private static final String BOOKING = "ViewTourDetailsController";
    private static final String FAILED = "login.jsp";
    private static final String ROLE = "SearchNearestTourController";
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
        String url = FAILED;
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            AccountDAO dao = new AccountDAO();
            String role = dao.checkLogin(username, password);
            if(role.equals("failed")) {
                url = FAILED;
                request.setAttribute("LOGIN_FAILED", "Invalid USERNAME or PASSWORD");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("USERNAME", username);
                session.setAttribute("ROLE", role);
                
                if(role.equals("admin")) {
                    StaffDAO daoS = new StaffDAO();
                    String fullname = daoS.getFullname(username);
                    session.setAttribute("FULLNAME", fullname);
                    url = ROLE;//ADMIN
                } else if(role.equals("user")) {
                    CustomerDAO daoC = new CustomerDAO();
                    String fullname = daoC.getFullname(username);
                    session.setAttribute("FULLNAME", fullname);
                    String tourID = request.getParameter("tourID");
                    if(!tourID.isEmpty()) {
                        url = BOOKING;
                    } else {
                        url = ROLE;//USER
                    }
                } else if(role.equals("guide")) {
                    TourGuideDAO daoTG = new TourGuideDAO();
                    String fullname = daoTG.getFullname(username);
                    session.setAttribute("FULLNAME", fullname);
                    url = ROLE;//GUIDE
                }
            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.getMessage());
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
