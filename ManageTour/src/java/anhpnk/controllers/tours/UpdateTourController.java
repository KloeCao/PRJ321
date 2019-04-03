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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kim Anh
 */
public class UpdateTourController extends HttpServlet {

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
            String tourID = request.getParameter("tourID");
            String journey = request.getParameter("journey");
            String categoryID = request.getParameter("categoryID");
            String start = request.getParameter("timeBegin");
            String end = request.getParameter("timeEnd");
            int days = Integer.parseInt(request.getParameter("days"));
            int nights = Integer.parseInt(request.getParameter("nights"));
            String timeLiving = days + " days " + nights + " nights";
            String decription = new String(request.getParameter("description").getBytes("ISO-8859-1"), "UTF-8");
            String agenda = new String(request.getParameter("agenda").getBytes("ISO-8859-1"), "UTF-8");
            String departure = new String(request.getParameter("departure").getBytes("ISO-8859-1"), "UTF-8");
            String vehicle = new String(request.getParameter("vehicle").getBytes("ISO-8859-1"), "UTF-8");
            float priceForAdult = Float.parseFloat(request.getParameter("priceForAdult"));
            float priceForKid = Float.parseFloat(request.getParameter("priceForKid"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String tourGuideID = request.getParameter("tourGuideID");
            
            boolean valid = true;
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
                TourDTO tour = new TourDTO();
                tour.setTourID(tourID);
                tour.setJourney(journey);
                tour.setTourCategoryID(categoryID);
                tour.setTimeLiving(timeLiving);
                tour.setDescription(decription);
                tour.setAgenda(agenda);
                tour.setDeparture(departure);
                tour.setVehicle(vehicle);
                tour.setPriceForAdult(priceForAdult);
                tour.setPriceForKid(priceForKid);
                tour.setQuantity(quantity);
                tour.setTourGuideID(tourGuideID);
                tour.setTimeBegin(timeBegin);
                tour.setTimeEnd(timeEnd);
                
                TourDAO dao = new TourDAO();
                boolean update = dao.update(tour);
                if(update) {
                    request.setAttribute("UPDATE_TOUR", "This tour information is updated.");
                } else {
                    request.setAttribute("UPDATE_TOUR", "Sorry! Cannot update this tour information.");
                }
            }
        } catch (Exception e) {
            log("Error at UpdateTourController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher("updateTour.jsp").forward(request, response);
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
