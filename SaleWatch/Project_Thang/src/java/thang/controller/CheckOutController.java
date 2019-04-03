/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thang.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thang.daoes.Tbl_orderDAO;
import thang.daoes.Tbl_orderDetailDAO;
import thang.dtoes.Tbl_orderDTO;
import thang.dtoes.Tbl_orderDetailDTO;

/**
 *
 * @author User
 */
public class CheckOutController extends HttpServlet {

    public static final String SUCCESS = "successOrder.GOTOJSP";
    public static final String ERROR = "error.jsp";

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
//            Insert to tbl_Order
            Date date = new Date();
            long time = date.getTime();
            Timestamp dateOrder = new Timestamp(time);

            Tbl_orderDAO orderDAO = new Tbl_orderDAO();
            HttpSession session = request.getSession();
            String custID = (String) session.getAttribute("ACCOUNTID");
            float totalBill = Float.parseFloat(request.getParameter("txtTotal"));
            String orderID = "OR" + (orderDAO.countOrder() + 1);
            String delivery = request.getParameter("txtDelivery");
            int isDelivery = 0;
            if (!delivery.isEmpty()) {
                isDelivery = 1;
            }
            Tbl_orderDTO orderDTO = new Tbl_orderDTO(orderID, custID, delivery, dateOrder, totalBill, isDelivery);
            boolean insertOrder = orderDAO.insertOrder(orderDTO);
            Tbl_orderDetailDAO detailDAO = new Tbl_orderDetailDAO();
            if (insertOrder) {
                //            Insert to orderDetails
                ArrayList<Tbl_orderDetailDTO> list = new ArrayList<>();
                int count = Integer.parseInt(request.getParameter("txtRow"));
                int countID = detailDAO.countDetail();
                for (int i = 1; i <= count; i++) {
                    int detailID = countID + i;
                    int quantity = Integer.parseInt(request.getParameter("txtQBuy" + i));
                    float unitPrice = Float.parseFloat(request.getParameter("txtPrice" + i));
                    float total = Float.parseFloat(request.getParameter("txtTotal" + i));
                    String productID = request.getParameter("txtID" + i);

                    Tbl_orderDetailDTO detailDTO = new Tbl_orderDetailDTO(detailID, quantity, productID, orderID, unitPrice, total);
                    list.add(detailDTO);
                }
                boolean insertDetail = detailDAO.insertDetails(list);
                if (insertDetail) {
                    url = SUCCESS;
                    session.removeAttribute("CART");
                }
            }
        } catch (Exception e) {
            log("ERROR at CheckOutController: " + e.getMessage());
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
