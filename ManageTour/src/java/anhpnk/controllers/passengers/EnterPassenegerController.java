/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.controllers.passengers;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kim Anh
 */
public class EnterPassenegerController extends HttpServlet {

    private static final String SUCCESS = "passenger.jsp";
    private static final String FAILED = "ViewTourDetailsController";

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
        boolean valid = true;
        try {
            HttpSession session = request.getSession();
            int quantity = (int) session.getAttribute("VALID_QUANTITY");
            int numOfAdult = Integer.parseInt(request.getParameter("numOfAdult"));
            int numOfKid = Integer.parseInt(request.getParameter("numOfKid"));
            if ((numOfAdult + numOfKid) > quantity) {
                request.setAttribute("OUT_OF_QUANTITY", "Only have " + quantity + " slots!");
                valid = false;
                url = FAILED;
            } else if (numOfKid > numOfAdult) {
                request.setAttribute("INVALID", "Each child must be matched at least one adult.");
                valid = false;
                url = FAILED;
            }
            if (valid) {
                url = SUCCESS;
                request.setAttribute("NUM_OF_ADULT", numOfAdult);
                request.setAttribute("NUM_OF_KID", numOfKid);
                long date = System.currentTimeMillis();
                Date today = new Date(date);
                int validYear = today.getYear() + 1900 - 18;
                request.setAttribute("VALID_ADULT_BIRTHDAY", validYear + "-12-31");
                request.setAttribute("VALID_KID_BIRTHDAY", (validYear + 1) + "-01-01");
            }
        } catch (Exception e) {
            log("Error at CheckLoginController: " + e.getMessage());
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
