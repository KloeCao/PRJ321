/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cm.controllers;

import cm.daoes.ContactDAO;
import cm.errors.ContactErrorObj;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CaoThu
 */
public class ContactController extends HttpServlet {

    private final String FEEDBACK = "contact.jsp";
    private final String SUCCESS = "notiContact.html";

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
        String name = request.getParameter("txtName");
        String mail = request.getParameter("txtMail");
        String fb = request.getParameter("txtFeedback");

        String url = FEEDBACK;
        ContactErrorObj errors = new ContactErrorObj();
        boolean err = false;
        try {
            //Error Name
            if (name.isEmpty()) {
                err = true;
                errors.setErrName("Name is not empty!");
            } else if (name.trim().length() > 50) {
                err = true;
                errors.setErrName("Name is not over 50 characters");
            }

            //Error Mail
            if (mail.isEmpty()) {
                err = true;
                errors.setErrMail("Mail is not empty!");
            } else if (mail.trim().length() > 50) {
                err = true;
                errors.setErrMail("Mail is not over 50 characters");
            }

            //Error Feedback
            if (fb.isEmpty()) {
                err = true;
                errors.setErrFb("Feedback is not empty!");
            } else if (fb.trim().length() > 500) {
                err = true;
                errors.setErrFb("Feedback is not over 500 characters");
            }

            //show error
            if (err) {
                //TRANFER - SHOW : USERS
                request.setAttribute("CONTACTERRORS", errors);
            } else {
                //STORE TO DB
                ContactDAO dao = new ContactDAO();
                boolean result = dao.insertContact(name, mail, fb);
                if (result) {
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
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
