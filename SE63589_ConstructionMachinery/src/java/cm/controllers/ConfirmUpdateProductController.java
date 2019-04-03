/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cm.controllers;

import cm.daoes.MachineDAO;
import cm.errors.MachineErrorObj;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CaoThu
 */
public class ConfirmUpdateProductController extends HttpServlet {

    private static String UPDATE = "manageUpdateProduct.jsp";
    private static String SUCCESS = "ManageProductController";
    private static String ERROR = "error.jsp";

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
        String machineID = request.getParameter("txtMachineID");
        String machineName = request.getParameter("txtMachineName");
//        String picture = request.getParameter("txtPicture");
        String description = request.getParameter("txtDescription");
        int price = 0;

        boolean sale = false;
        if (request.getParameter("chkSale") != null) {
            sale = true;
        }
        boolean unavailable = false;
        if (request.getParameter("chkUnavailable") != null) {
            unavailable = true;
        }
        String url = ERROR;
        MachineErrorObj errors = new MachineErrorObj();
        boolean err = false;

        try {
            //Machine Name
            if (machineName.isEmpty()) {
                err = true;
                errors.setErrMachineName("Machine Name is not empty");
            } else if (machineName.trim().length() > 100) {
                err = true;
                errors.setErrMachineName("Machine Name is not over 100 characters");
            }
            //Picture
//            if (picture.isEmpty()) {
//                err = true;
//                errors.setErrPicture("Picture is not empty");
//            } else if (picture.trim().length() > 250) {
//                err = true;
//                errors.setErrPicture("Picture is not over 250 characters");
//            }
            //Description
            if (description.isEmpty()) {
                err = true;
                errors.setErrDescription("Description is not empty");
            } else if (description.trim().length() > 500) {
                err = true;
                errors.setErrDescription("Description is not over 500 characters");
            }
            //Price
            try {
                price = Integer.parseInt(request.getParameter("txtPrice"));
                if (price < 0) { //price <0
                    err = true;
                    errors.setErrPrice("Price must be > 0");
                }

            } catch (NumberFormatException e) { //price not number
                err = true;
                errors.setErrPrice("Price must be number");
            }

            //SHOW ERROR 
            if (err) {
                request.setAttribute("UPDATE_PRODUCT_ERROR", errors);
                url = UPDATE;
            } else {
                MachineDAO dao = new MachineDAO();
                boolean result = dao.updateMachine(machineID, machineName, description, price, sale, unavailable);
                if (result) {
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
