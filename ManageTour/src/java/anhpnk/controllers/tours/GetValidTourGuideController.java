/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.controllers.tours;

import anhpnk.daos.AccountDAO;
import anhpnk.daos.TourDAO;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kim Anh
 */
public class GetValidTourGuideController extends HttpServlet {

    private static final String MAIN = "SearchNearestTourController";
    private static final String UPDATE = "GetTourDetailsController";
    private static final String INSERT = "insertTour.jsp";
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
        String url = MAIN;
        try {
            boolean valid = true;
            String start = request.getParameter("timeBegin");
            String end = request.getParameter("timeEnd");
            Date timeBegin = Date.valueOf(start);
            Date timeEnd = Date.valueOf(end);
            long date = System.currentTimeMillis();
            Date today = new Date(date);
            if(timeBegin.before(today) || timeEnd.before(today)) {
                request.setAttribute("INVALID_DAY", "Invalid date. Please enter the day after today.");
                valid = false;
            }
            if(timeEnd.compareTo(timeBegin) < 0) {
                request.setAttribute("INVALID_DAY", "Invalid date. Please enter the date-end after the date-start.");
                valid = false;
            }
            if(valid) {
                AccountDAO daoA = new AccountDAO();
                HashMap<String, String> listTourguides = daoA.getAllTourGuide();
                TourDAO daoT = new TourDAO();
                List<String> listInvalidTourguides = daoT.getTourGuideNotFree(timeBegin, timeEnd);
                for (String invalid : listInvalidTourguides) {
                    if(listTourguides.containsKey(invalid)) {
                        listTourguides.remove(invalid);
                    }
                }
                request.setAttribute("AVAILABLE_TOURGUIDE", listTourguides);
                String viewPage = request.getParameter("viewPage");
                if(viewPage.equals("update")) {
                    url = UPDATE;
                } else if(viewPage.equals("insert")) {
                    url = INSERT;
                } else {
                    url = MAIN;
                }
            }
        } catch (Exception e) {
            log("Error at GetValidTourGuideController: " + e.getMessage());
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
