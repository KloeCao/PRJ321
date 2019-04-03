/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.controllers.tours;

import anhpnk.daos.TourDAO;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Kim Anh
 */
@MultipartConfig
public class UploadImageController extends HttpServlet {

    private static final String SUCCESS = "uploadImage.jsp";
    private static final String FAIL = "error.jsp";
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
        
        String url = FAIL;
        boolean uploadImg = false;
        String pictureName = "";
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            HttpSession session = request.getSession();
            String tourID = (String) session.getAttribute("TOURID_UPLOAD");
            Map<String, List<FileItem>> parseParam = upload.parseParameterMap(request);
            Set<String> keysOfParse = parseParam.keySet();
            for (String key : keysOfParse) {
                List<FileItem> fileItems = parseParam.get(key);
                for (FileItem item : fileItems) {
                    if (!item.isFormField()) {
                        String name = item.getName();
                        pictureName = pictureName + name + ";";
                        if (!name.equals("")) {
                            String storedFolder = request.getServletContext().getRealPath("") + File.separator + "images" + File.separator + tourID;
                            File folder = new File(storedFolder);
                            if (!folder.exists()) {
                                folder.mkdir();
                            }
                            String imagePath = storedFolder + File.separator + name;
                            File image = new File(imagePath);
                            try {
                                item.write(image);
                                uploadImg = true;
                            } catch (Exception e) {
                                uploadImg = false;
                                log("Error at UploadImageAction: " + e.getMessage());
                            }
                        }
                    }
                }
            }
            TourDAO dao = new TourDAO();
            boolean update = dao.updatePicture(tourID, pictureName);
            if(uploadImg && update) {
                url = SUCCESS;
                request.setAttribute("UPLOAD", "Done Insert New Tour Task");
                session.removeAttribute("TOURID_UPLOAD");
                session.removeAttribute("ACTION");
            } else {
                request.setAttribute("ERROR", "Upload Fail");
            }
        } catch (Exception e) {
            log("Error at UploadImageController: " + e.getMessage());
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
