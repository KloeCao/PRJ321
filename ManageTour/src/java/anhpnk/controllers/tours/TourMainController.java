/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.controllers.tours;

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
public class TourMainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SEARCHTOURBYCATEGORY = "SearchTourByCategoryController";
    private static final String SEARCHTOURBYDESTINATION = "SearchTourByDestinationController";
    private static final String VIEWTOURDETAILS = "ViewTourDetailsController";
    private static final String NEAREST_TOUR = "SearchNearestTourController";
    private static final String SEARCH_TOURGUIDE_SCHEDULE = "SearchScheduleTourController";
    private static final String GET_VALID_TOURGUIDE = "GetValidTourGuideController";
    private static final String INSERT_TOUR = "InsertTourController";
    private static final String GET_TOUR_UPDATE = "GetTourForUpdateController";
    private static final String GET_TOURDETAILS_UPDATE = "GetTourDetailsController";
    private static final String UPLOAD_IMAGE = "UploadImageController";
    private static final String UPDATE_TOUR = "UpdateTourController";

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
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                HttpSession session = request.getSession();
                action = (String) session.getAttribute("ACTION");
                if (action == null) {
                    url = NEAREST_TOUR;
                } else if (action.equals("UploadImage")) {
                    url = UPLOAD_IMAGE;
                }
            } else {
                switch (action) {
                    case "SearchTourByCategory":
                        url = SEARCHTOURBYCATEGORY;
                        break;
                    case "SearchByDestination":
                        url = SEARCHTOURBYDESTINATION;
                        break;
                    case "ViewTourDetails":
                        url = VIEWTOURDETAILS;
                        break;
                    case "SearchSchedule":
                        url = SEARCH_TOURGUIDE_SCHEDULE;
                        break;
                    case "GetValidTourGuideForUpdate":
                        url = GET_VALID_TOURGUIDE;
                        break;
                    case "GetValidTourGuideForInsert":
                        url = GET_VALID_TOURGUIDE;
                        break;
                    case "InsertTour":
                        url = INSERT_TOUR;
                        break;
                    case "GetTourForUpdate":
                        url = GET_TOUR_UPDATE;
                        break;
                    case "GetTourDetails":
                        url = GET_TOURDETAILS_UPDATE;
                        break;
                    case "UploadImage":
                        url = UPLOAD_IMAGE;
                        break;
                    case "UpdateTour":
                        url = UPDATE_TOUR;
                        break;
                    default:
                        request.setAttribute("ERROR", "Sorry! We have a problem.");
                        break;
                }
            }

        } catch (Exception e) {
            log("Error at TourMainController: " + e.getMessage());
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
