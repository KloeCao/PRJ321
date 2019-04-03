/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.controllers.orders;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kim Anh
 */
public class OrderMainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String CHECKOUT = "CheckOutController";
    private static final String VIEW_MY_ORDERS = "ViewMyOrderController";
    private static final String MY_ORDER_DETAILS = "ViewOrderDetailController";
    private static final String CANCEL_ORDER = "CancelOrderController";
    private static final String PAY_ORDER = "PayOrderController";
    private static final String RETURN_MONEY = "ReturnMoneyController";
    private static final String GET_OVERDATE_ORDER = "GetOverDateOrderController";
    private static final String DESTROY_OVERDATE_ORDER = "DestroyOverDateOrderController";
    
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
            switch(action) {
                case "CheckOut":        url = CHECKOUT;
                                        break;
                case "ViewMyOrder":     url = VIEW_MY_ORDERS;
                                        break;
                case "ViewOrderDetail": url = MY_ORDER_DETAILS;
                                        break;
                case "CancelOrder":     url = CANCEL_ORDER;
                                        break;
                case "SearchOrder":     url = MY_ORDER_DETAILS;
                                        break;
                case "PayOrder":        url = PAY_ORDER;
                                        break;
                case "ReturnMoney":     url = RETURN_MONEY;
                                        break;
                case "GetOverDateOrder":    url = GET_OVERDATE_ORDER;
                                            break;
                case "DestroyOverDateOrder":    url = DESTROY_OVERDATE_ORDER;
                                                break;
                default:                request.setAttribute("ERROR", "Sorry! We have a problem.");
                                        break;
            }
        } catch (Exception e) {
            log("Error at OrderMainController: " + e.getMessage());
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
