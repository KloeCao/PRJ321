/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.controllers.accounts;

import anhpnk.daos.CustomerDAO;
import anhpnk.daos.StaffDAO;
import anhpnk.daos.TourGuideDAO;
import anhpnk.dtos.CustomerDTO;
import anhpnk.dtos.StaffDTO;
import anhpnk.dtos.TourGuideDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kim Anh
 */
public class SearchAccountController extends HttpServlet {

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
            String fullname = new String(request.getParameter("fullname").getBytes("ISO-8859-1"), "UTF-8");
            String role = request.getParameter("role");
            
            if(!fullname.isEmpty()) {
                if(role.equals("user")) {
                    CustomerDAO dao = new CustomerDAO();
                    List<CustomerDTO> list = dao.searchByLikeName(fullname);
                    request.setAttribute("LIST", list);
                }
                if(role.equals("admin")) {
                    StaffDAO dao = new StaffDAO();
                    List<StaffDTO> list = dao.searchByLikeName(fullname);
                    request.setAttribute("LIST", list);
                }
                if(role.equals("guide")) {
                    TourGuideDAO dao = new TourGuideDAO();
                    List<TourGuideDTO> list = dao.searchByLikeName(fullname);
                    request.setAttribute("LIST", list);
                }
            }
        } catch (Exception e) {
            log("Error at SearchAccountController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher("accountManagement.jsp").forward(request, response);
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
