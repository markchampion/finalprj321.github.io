/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.controller;

import com.google.api.client.util.IOUtils;
import com.google.gson.Gson;
import com.mark.dao.ArtistDAO;
import com.mark.drive.DriveQuickstart;
import com.mark.model.Artist;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
@MultipartConfig
public class ProcessArtistServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            if (action != null && action.equals("delete")) {
                if(ArtistDAO.delete(request.getParameter("id")))
                    response.sendRedirect("/PRJ321_FINAL_PROJECT/personal/info-artist.jsp");
                else {
                    request.setAttribute("delError", "You'll need to delete artist's song first!!!");
                    request.getRequestDispatcher("page-admin/info-artist.jsp").forward(request, response);
                }
            } else if (action != null && action.equals("update")) {
                String id = request.getParameter("ID");
                String name = request.getParameter("name");
                String nickName = request.getParameter("nickName");
                String birthDate = request.getParameter("birthDate");
                String address = request.getParameter("address");
                String description = request.getParameter("description");
                String avatar = "";
                //GET AVATAR FILE
                javax.servlet.http.Part fileAvatar = request.getPart("avatar");
                if (!fileAvatar.getName().isEmpty() && fileAvatar.getSize() > 0) {
                    avatar = getLink(new ArtistDAO().getArtist(id).getAvatar().split("id=")[1], fileAvatar, true);
                } else {
                    avatar = new ArtistDAO().getArtist(id).getAvatar().split("id=")[1];
                }
                ArtistDAO.update(new Artist(id, name, nickName, birthDate, address, description, avatar));
                response.sendRedirect("/PRJ321_FINAL_PROJECT/page-admin/info-artist.jsp");
            } else {
                String id = request.getParameter("ID");
                String name = request.getParameter("name");
                String nickName = request.getParameter("nickName");
                String birthDate = request.getParameter("birthDate");
                String address = request.getParameter("address");
                String description = request.getParameter("description");
                String avatar = "";
                javax.servlet.http.Part fileAvatar = request.getPart("avatar");
                if (!fileAvatar.getName().isEmpty() && fileAvatar.getSize() > 0) {
                    avatar = getLink("", fileAvatar, false);
                }
                ArtistDAO.insert(new Artist(id, name, nickName, birthDate, address, description, avatar));
                response.sendRedirect("/PRJ321_FINAL_PROJECT/page-admin/info-artist.jsp");
            }
        }
    }

    private String getLink(String oldID, javax.servlet.http.Part fileMp, boolean isUpdate) {
        InputStream fileContentMp3 = null;
        try {
            String fileNameMp3 = Paths.get(fileMp.getSubmittedFileName()).getFileName().toString();
            fileContentMp3 = fileMp.getInputStream();
            java.io.File filePath = new File("fileName");
            FileOutputStream fosMp3 = new FileOutputStream(filePath);
            IOUtils.copy(fileContentMp3, fosMp3);
            if (isUpdate) {
                return DriveQuickstart.updateImage(oldID, fileNameMp3, filePath).getId();
            } else {
                return DriveQuickstart.uploadImage(fileNameMp3, filePath).getId();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                fileContentMp3.close();
            } catch (IOException ex) {
                Logger.getLogger(UploadSongServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
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
