/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.controller;

import com.google.api.client.util.IOUtils;
import com.mark.dao.SongDAO;
import com.mark.drive.DriveQuickstart;
import com.mark.model.Song;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author PC
 */
@MultipartConfig
public class LoadSongServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            if (action == null) {
                List<Song> songs = new SongDAO().select();
                request.setAttribute("songs", songs);
                request.getRequestDispatcher("home.jsp").forward(request, response);
            } else if (action != null && action.equals("Add Song")) {
//                String name = request.getParameter("name");
//                String author = request.getParameter("author");
//                String singer = request.getParameter("singer");
//                String genre = request.getParameter("genre");
//                int userid = Integer.parseInt(request.getParameter("userid"));
//                Date d = new Date();
//                int viewCount = Integer.parseInt(request.getParameter("viewCount"));
//                String downLink = request.getParameter("downlink");
//                String avatar = request.getParameter("avatar");
//                String lyrics = request.getParameter("lyrics");
//              
                Part filePart = request.getPart("fileattach");
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                InputStream fileContent = filePart.getInputStream();
                java.io.File filePath = new File("fileName"+".mp3");
                FileOutputStream fos = new FileOutputStream(filePath);
                IOUtils.copy(fileContent, fos);
                try {
                    DriveQuickstart.uploadMp3(fileName, filePath);
                } catch (GeneralSecurityException ex) {
                    Logger.getLogger(LoadSongServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
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
