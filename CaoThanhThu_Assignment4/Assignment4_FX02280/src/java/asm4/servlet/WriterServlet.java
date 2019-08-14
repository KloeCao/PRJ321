/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asm4.servlet;

import asm4.daoes.PostsDAO;
import asm4.error.PostsError;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CaoThu
 */
public class WriterServlet extends HttpServlet {

    private static final String SUCCESS = "Posts.jsp";
    private static final String INVALID = "author.jsp";

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String url = INVALID;
        HttpSession session = request.getSession();
        PostsDAO dao = new PostsDAO();
        int id = dao.getLastId() + 1;
        System.out.println(id);
        String username = (String) session.getAttribute("USERNAME");
        String title, topic, post;
        Date date = SqlDate();
        boolean publish = false;
        if (request.getParameter("chkPublish") != null) {
            publish = true;
        }
        PostsError errors = new PostsError();
        boolean err = false;

        try {
            title = request.getParameter("txtTitle");
            if (title.isEmpty()) {
                err = true;
                errors.setTitleError("Title is not be empty");
            } else if (title.trim().length() > 200) {
                err = true;
                errors.setTitleError("Title is not be over 200 characters");
            }

            topic = request.getParameter("txtTopic");
            if (topic.trim().length() > 200) {
                err = true;
                errors.setTopicError("Topic is not be over 200 characters");
            }

            post = request.getParameter("txtPost");
            if (post.isEmpty()) {
                err = true;
                errors.setPostError("Post is not be empty");
            } else if (post.trim().length() > 5000) {
                err = true;
                errors.setPostError("Post is not be over 5000 characters");
            }

            if (err) {
                errors.setHaveTrouble("Have some trouble<br/>"
                        + "Please scroll down for more details.<br/>"
                        + "Please try again, thank you!");
                request.setAttribute("POST_ERROR", errors);
            } else {
                boolean create = dao.createPost(id, username, title, topic, post, publish, date);
                if (create) {
                    url = SUCCESS;
                }
            }

        } catch (Exception e) {
            log("ERROR at WriterServlet: " + e.getMessage());
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(WriterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(WriterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    public Date SqlDate() {
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        return date;
    }
}
