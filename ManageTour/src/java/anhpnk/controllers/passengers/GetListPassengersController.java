/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.controllers.passengers;

import anhpnk.daos.OrderDAO;
import anhpnk.daos.PassengerDAO;
import anhpnk.daos.TourDAO;
import anhpnk.dtos.OrderDTO;
import anhpnk.dtos.PassengerDTO;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
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
public class GetListPassengersController extends HttpServlet {

//    private static final String INVALID = "passenger.jsp";
    private static final String SUCCESS = "order.jsp";

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
//        String url = SUCCESS;
        try {
            HttpSession session = request.getSession();
            session.removeAttribute("LIST_PASSENGERS");
            session.removeAttribute("ORDER");

            //Order Object
            int numOfAdult = Integer.parseInt(request.getParameter("numOfAdult"));
            int numOfKid = Integer.parseInt(request.getParameter("numOfKid"));
            String tourID = request.getParameter("tourID");

            //Passenger List
            List<PassengerDTO> listPassengers = new ArrayList<>();
            PassengerDTO passenger = null;
            String typeOfTicket, birthStr;
            String passengerID, fullname, phone;
            boolean isAdult = false, passengerStt = false;
            Date birthday;
            PassengerDAO daoP = new PassengerDAO();
            int numOfPassenger = daoP.getNumOfPasseneger(tourID);
            for (int i = 1; i <= (numOfAdult + numOfKid); i++) {
                numOfPassenger++;
                passengerID = "P" + tourID + numOfPassenger;
                fullname = new String(request.getParameter("fullname" + i).getBytes("ISO-8859-1"), "UTF-8");
                phone = request.getParameter("phone" + i);

                typeOfTicket = new String(request.getParameter("typeOfTicket" + i).getBytes("ISO-8859-1"), "UTF-8");
                if (typeOfTicket.equals("Adult Ticket")) {
                    isAdult = true;
                }
                if (typeOfTicket.equals("Children Ticket")) {
                    isAdult = false;
                }

                birthStr = request.getParameter("birthday" + i);
                birthday = Date.valueOf(birthStr);
                passenger = new PassengerDTO(fullname, birthday, phone, isAdult, passengerStt);
                passenger.setPassengerID(passengerID);
                listPassengers.add(passenger);
            }

            session.setAttribute("LIST_PASSENGERS", listPassengers);

            OrderDAO daoO = new OrderDAO();
            int numOfOrder = daoO.countOrderByTour(tourID);
            String orderID = "OD" + tourID + (numOfOrder + 1) + "";
            int orderStt = 0;
            String payment = "By Cast";
            Calendar cal = Calendar.getInstance();
            Timestamp dateCreate = new Timestamp(cal.getTimeInMillis());
            String username = (String) session.getAttribute("USERNAME");
            OrderDTO order = new OrderDTO(orderID, dateCreate, username, payment, tourID, numOfAdult, numOfKid, orderStt);
            order.setIsReturn(false);
            session.setAttribute("ORDER", order);

            //More Information
            TourDAO dao = new TourDAO();
            float[] prices = dao.getPriceOfTour(tourID);
            request.setAttribute("PRICES", prices);
            float totalOfAdult = numOfAdult * prices[0];
            float totalOfKid = numOfKid * prices[1];
            float total = totalOfAdult + totalOfKid;
            request.setAttribute("AKT", totalOfAdult + "-" + totalOfKid + "-" + total);

        } catch (Exception e) {
            log("Error at GetListPassengersController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher("order.jsp").forward(request, response);
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
