/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asm4.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CaoThu
 */
public class MainController extends HttpServlet {

    private static final String LOGIN = "loginProcess";
    private static final String SIGNUP = "SignUpProcess";
    private static final String SUBMIT = "WriterServlet";
    private static final String DIRECT = "EditDirectServlet";
    private static final String EDIT = "EditServlet";
    private static final String ERROR = "error.jsp";

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
            if (action.equals("Login")) {
                url = LOGIN;
            } else if (action.equals("Sign Up")) {
                url = SIGNUP;
            } else if (action.equals("Submit Post")) {
                url = SUBMIT;
            } else if (action.equals("Edit")) {
                url = DIRECT;
            }else if (action.equals("Submit Edit")) {
                url = EDIT;
            } else if (action.equals("Details")) {
                url = "DetailServlet";
            } else {
                request.setAttribute("ERROR", "Action is not support");
            }
        } catch (Exception e) {
            log("Error at Main Controller: " + e.getMessage());
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
