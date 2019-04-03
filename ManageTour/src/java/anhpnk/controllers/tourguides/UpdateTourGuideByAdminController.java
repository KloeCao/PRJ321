/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.controllers.tourguides;

import anhpnk.daos.TourGuideDAO;
import anhpnk.dtos.TourGuideDTO;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kim Anh
 */
public class UpdateTourGuideByAdminController extends HttpServlet {

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
        try {
            String username = request.getParameter("username");
            String fullname = new String(request.getParameter("fullname").getBytes("ISO-8859-1"), "UTF-8");
            String address = new String(request.getParameter("address").getBytes("ISO-8859-1"), "UTF-8");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String dateStr = request.getParameter("birthday");
            Date birthday = Date.valueOf(dateStr);
            TourGuideDTO tourguide = new TourGuideDTO(username, fullname, address, phone, email, birthday);
            TourGuideDAO dao = new TourGuideDAO();
            boolean update = dao.update(tourguide);
            if(update) {
                request.setAttribute("UPDATE_INFOR", "This account information is updated.");
            } else {
                request.setAttribute("UPDATE_INFOR", "Sorry! Cannot update this account information.");
            }
        } catch (Exception e) {
            log("Error at UpdateTourGuideByAdminController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher("accountInformation.jsp").forward(request, response);
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
