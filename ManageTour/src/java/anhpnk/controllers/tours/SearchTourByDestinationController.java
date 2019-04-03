/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.controllers.tours;

import anhpnk.daos.TourDAO;
import anhpnk.dtos.TourDTO;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kim Anh
 */
public class SearchTourByDestinationController extends HttpServlet {

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
            String startStr = request.getParameter("startDate");
            String endStr = request.getParameter("endDate");
            String destination = new String(request.getParameter("destination").getBytes("ISO-8859-1"), "UTF-8").trim();
            System.out.println(destination);
            List<TourDTO> listTour = null;
            if (destination.isEmpty() && startStr.isEmpty() && endStr.isEmpty()) {
                long todayMill = System.currentTimeMillis();
                Date today = new Date(todayMill);
                TourDAO dao = new TourDAO();
                listTour = dao.getNearestTour(today);
            }
            if (!destination.isEmpty() && startStr.isEmpty() && endStr.isEmpty()) {
                TourDAO dao = new TourDAO();
                listTour = dao.searchTourByDestination(destination);
            }
            if (destination.isEmpty() && !startStr.isEmpty() && !endStr.isEmpty()) {
                long start = Date.parse(startStr);
                Date startDate = new Date(start);
                System.out.println(startDate);
                long end = Date.parse(endStr);
                Date endDate = new Date(end);
                System.out.println(endDate);
                TourDAO dao = new TourDAO();
                listTour = dao.searchTourByTime(startDate, endDate);
            }
            if (!destination.isEmpty() && !startStr.isEmpty() && !endStr.isEmpty()) {
                long start = Date.parse(startStr);
                Date startDate = new Date(start);
                long end = Date.parse(endStr);
                Date endDate = new Date(end);
                TourDAO dao = new TourDAO();
                listTour = dao.searchByDateAndName(startDate, endDate, destination);
            }
            if(!startStr.isEmpty() && endStr.isEmpty()) {
                long start = Date.parse(startStr);
                Date startDate = new Date(start);
                TourDAO dao = new TourDAO();
                listTour = dao.searchByTimeBegin(destination, startDate);
            }
            if(startStr.isEmpty() && !endStr.isEmpty()) {
                long end = Date.parse(endStr);
                Date endDate = new Date(end);
                TourDAO dao = new TourDAO();
                listTour = dao.searchByTimeEnd(destination, endDate);
            }
            if (listTour != null) {
                for (int i = 0; i < listTour.size(); i++) {
                    String pictureLink = listTour.get(i).getPicture();
                    String[] pictures = pictureLink.split(";");
                    listTour.get(i).setPicture("images/" + listTour.get(i).getTourID() + "/" + pictures[0]);
                }
                request.setAttribute("LISTTOUR", listTour);
            }
        } catch (Exception e) {
            log("Error at SearchTourByDestinationController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher("tour.jsp").forward(request, response);
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
