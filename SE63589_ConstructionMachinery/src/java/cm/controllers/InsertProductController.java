/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cm.controllers;

import cm.daoes.MachineDAO;
import cm.errors.MachineErrorObj;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author CaoThu
 */
@MultipartConfig
public class InsertProductController extends HttpServlet {

    private final String INSERT = "manageInsertProduct.jsp";
    private final String SUCCESS = "notiInsertProduct.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @return
     */
    public Date SqlDate() {
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        return date;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String machineID = request.getParameter("txtMachineID");
        String machineName = request.getParameter("txtMachineName");
        Part picture = request.getPart("picture");
        String description = request.getParameter("txtDescription");
        int price = 0;
        Date date = SqlDate();
        request.getSession().setAttribute("DATE", date);
        boolean sale = false;
        if (request.getParameter("chkSale") != null) {
            sale = true;
        }
        boolean unavailable = false;
        if (request.getParameter("chkUnavailable") != null) {
            unavailable = true;
        }
        String url = INSERT;
        MachineErrorObj errors = new MachineErrorObj();
        boolean err = false;

        try {
            //Machine ID
            if (machineID.isEmpty()) {
                err = true;
                errors.setErrMachineID("Machine ID is not empty");
            } else if (machineID.trim().length() > 10) {
                err = true;
                errors.setErrMachineID("Machine ID is not over 10 characters");
            }
            //Machine Name
            if (machineName.isEmpty()) {
                err = true;
                errors.setErrMachineName("Machine Name is not empty");
            } else if (machineName.trim().length() > 100) {
                err = true;
                errors.setErrMachineName("Machine Name is not over 100 characters");
            }

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
                request.setAttribute("INSERT_PRODUCT_ERROR", errors);
            } else {
                MachineDAO dao = new MachineDAO();
                //======== Picture ==============
                String picName = Paths.get(picture.getSubmittedFileName()).getFileName().toString();
                picName = picName.replaceAll(" ", "_");
                String pictureStr = "./images/" + picName;
                InputStream is = picture.getInputStream();
                File file = new File(this.getServletContext().getRealPath("/images") + File.separator + picName);
                try (
                        FileOutputStream out = new FileOutputStream(file);) {
                    byte[] buffer = new byte[1024];
                    int len;
                    while ((len = is.read(buffer)) != -1) {
                        out.write(buffer, 0, len);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                //=================================
                boolean result = dao.insertMachine(machineID, machineName, pictureStr, description, price, sale, date, unavailable);
                if (result) {
                    url = SUCCESS;
                }
            }
        } catch (Exception ex) {
            //Machine ID is existed.
            if (ex.getMessage().toLowerCase().contains("duplicate")) {
                errors.setErrMachineIDExist(machineID + " is existed!");
                request.setAttribute("INSERT_PRODUCT_ERROR", errors);
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
