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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kim Anh
 */
public class InsertTourController extends HttpServlet {

    private static final String SUCCESS = "uploadImage.jsp";
    private static final String FAIL = "insertTour.jsp";
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
            //get data
            String journey = new String(request.getParameter("journey").getBytes("ISO-8859-1"), "UTF-8");
            String categoryID = request.getParameter("categoryID");
            String start = request.getParameter("timeBegin");
            String end = request.getParameter("timeEnd");
            int days = Integer.parseInt(request.getParameter("days"));
            int nights = Integer.parseInt(request.getParameter("nights"));
            String description = new String(request.getParameter("description").getBytes("ISO-8859-1"), "UTF-8");
            String agenda = new String(request.getParameter("agenda").getBytes("ISO-8859-1"), "UTF-8");
            String departure = new String(request.getParameter("departure").getBytes("ISO-8859-1"), "UTF-8");
            String vehicle = new String(request.getParameter("vehicle").getBytes("ISO-8859-1"), "UTF-8");
            float priceForAdult = Float.parseFloat(request.getParameter("priceForAdult"));
            float priceForKid = Float.parseFloat(request.getParameter("priceForKid"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String tourGuideID = request.getParameter("tourGuideID");

            //valid data
            boolean valid = true;
            Date timeBegin = Date.valueOf(start);
            Date timeEnd = Date.valueOf(end);
            long date = System.currentTimeMillis();
            Date today = new Date(date);
            if (timeBegin.before(today) || timeEnd.before(today)) {
                request.setAttribute("INVALID_DAY", "Invalid day. You entered the day in past");
                valid = false;
            }
            if (timeEnd.compareTo(timeBegin) < 0) {
                request.setAttribute("INVALID_DAY", "Invalid day. The Time End must be after Time Begin");
                valid = false;
            }
            String timeLiving = days + " days " + nights + " nights";
            description = description.replace(".", "//");
            agenda = agenda.replaceAll("\n", "//");
            if (valid) {
                TourDAO dao = new TourDAO();
                int num = dao.getNumOfTourByCategory(categoryID);
                num++;
                String tourID = categoryID + num;
                String pictureName = "";
                TourDTO tour = new TourDTO(tourID, categoryID, journey, description, agenda, departure, timeBegin, timeEnd, timeLiving, pictureName, priceForAdult, priceForKid, quantity, vehicle, tourGuideID);
                boolean insert = dao.insert(tour);
                if (insert) {
                    request.setAttribute("INSERT_TOUR", "This tour is stored");
                    request.setAttribute("TOURID", tourID);
                    HttpSession session = request.getSession();
                    session.setAttribute("ACTION", "UploadImage");
                    session.setAttribute("TOURID_UPLOAD", tourID);
                    url = SUCCESS;
                } else {
                    request.setAttribute("INSERT_TOUR", "Sorry! Cannot store this tour");
                }
            }
        } catch (Exception e) {
            log("Error at InsertTourController: " + e.getMessage());
            if(e.getMessage().contains("String or binary data would be truncated")) {
                request.setAttribute("INSERT_TOUR", "Data is over 4000 characters. Must be reduce it");
                url = FAIL;
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
