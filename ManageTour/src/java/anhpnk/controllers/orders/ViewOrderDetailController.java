/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.controllers.orders;

import anhpnk.daos.OrderDAO;
import anhpnk.daos.PassengerDAO;
import anhpnk.daos.TourDAO;
import anhpnk.dtos.OrderDTO;
import anhpnk.dtos.PassengerDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kim Anh
 */
public class ViewOrderDetailController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String USER = "orderDetails.jsp";
    private static final String ADMIN = "customerOrder.jsp";
    private static final String USER_BACK = "ViewMyOrderController";
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
            HttpSession session = request.getSession();
            String role = (String) session.getAttribute("ROLE");
            String orderID = request.getParameter("orderID");
            if (orderID.isEmpty()) {
                if (role.equals("admin")) {
                    url = ADMIN;
                } else if(role.equals("user")) {
                    url = USER_BACK;
                }
            } else {
                OrderDAO daoO = new OrderDAO();
                OrderDTO order = daoO.getOrderDetails(orderID);
                request.setAttribute("ORDER_DETAILS", order);

                String tourID = order.getTourID();
                TourDAO daoT = new TourDAO();
                String tourName = daoT.getTourNameByTourID(tourID);
                request.setAttribute("TOUR_NAME", tourName);

                PassengerDAO daoP = new PassengerDAO();
                List<PassengerDTO> listPassenger = daoP.getPassengerOfOrder(orderID);
                request.setAttribute("LIST_PASSENGER_IN_ORDER", listPassenger);

                float[] prices = daoT.getPriceOfTour(tourID);
                request.setAttribute("PRICES", prices);

                float totalOfAdult = prices[0] * order.getNumOfAdult();
                float totalOfKid = prices[1] * order.getNumOfKid();
                float total = totalOfAdult + totalOfKid;
                request.setAttribute("AKT", totalOfAdult + "-" + totalOfKid + "-" + total);

                if (role.equals("user")) {
                    url = USER;
                } else if (role.equals("admin")) {
                    url = ADMIN;
                }
            }
            

        } catch (Exception e) {
            log("Error at ViewOrderDetailController: " + e.getMessage());
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
