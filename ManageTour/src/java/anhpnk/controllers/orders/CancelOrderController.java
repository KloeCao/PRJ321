/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.controllers.orders;

import anhpnk.daos.OrderDAO;
import anhpnk.daos.PassengerDAO;
import anhpnk.daos.TourDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kim Anh
 */
public class CancelOrderController extends HttpServlet {

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
            String orderID = request.getParameter("orderID");
            
            int orderStt = Integer.parseInt(request.getParameter("orderStt"));
            String tourID = request.getParameter("tourID");
            TourDAO daoT = new TourDAO();
            int remainDays = daoT.getRemainDays(tourID);
            int returnPercent = 0;
            if(remainDays < 3) {
                returnPercent = 0;
                orderStt = -1;
            }
            if(remainDays >= 15) {
                returnPercent = 100;
                orderStt = 100;
            }
            if(remainDays >= 7 && remainDays < 15) {
                returnPercent = 50;
                orderStt = 50;
            }
            if(remainDays >= 3 && remainDays < 7) {
                returnPercent = 25;
                orderStt = 25;
            }
            OrderDAO daoO = new OrderDAO();
            boolean cancelled = daoO.updateOrderStatus(orderID, orderStt);
            if(cancelled) {
                PassengerDAO daoP = new PassengerDAO();
                boolean updatePassenger = daoP.updatePassengerStatus(false, orderID);
                if(updatePassenger) {
                    float total = Float.parseFloat(request.getParameter("total"));
                    float returnPrice = total * (returnPercent / 100);
                    request.setAttribute("RETURN", "The Return Fee: " + returnPrice + "$");
                } else {
                    request.setAttribute("RETURN", "Sorry! Cannot cancel your order. Please contact us to be served.");
                }
            } else {
                request.setAttribute("RETURN", "Sorry! Cannot cancel your order. Please contact us to be served.");
            }
        } catch (Exception e) {
            log("Error at CancelOrderController: " + e.getMessage());
        } finally {
//            String orderID = request.getParameter("orderID");
            request.getRequestDispatcher("ViewOrderDetailController").forward(request, response);
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
