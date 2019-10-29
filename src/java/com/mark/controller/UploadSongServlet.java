/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.controller;

import com.google.api.client.util.IOUtils;
import com.mark.dao.ArtistListDAO;
import com.mark.dao.SongDAO;
import com.mark.drive.DriveQuickstart;
import com.mark.model.Artist;
import com.mark.model.Song;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
@MultipartConfig
public class UploadSongServlet extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String name = request.getParameter("name");
            String writerID = request.getParameter("writer");
            String[] artists = request.getParameterValues("artists");
            String genre = request.getParameter("genre");
            int userid = Integer.parseInt(request.getParameter("userid"));
            String lyrics = request.getParameter("lyrics");

            javax.servlet.http.Part fileMp3 = request.getPart("fileattach");
            javax.servlet.http.Part fileAvatar = request.getPart("fileavatar");
            if (action.equals("Add song")) {
                Song s = new Song(name, writerID, genre, userid,
                        new SimpleDateFormat("dd-MM-yyyy").format(new Date()),
                        0,
                        getLink(fileMp3, true), getLink(fileAvatar, false), lyrics);
                new SongDAO().insert(s);
                ArtistListDAO.insert(artists);
                response.sendRedirect("list");
            } else if (action.equals("Save")) {
                int ID = Integer.parseInt(request.getParameter("songid"));
                Song s = new SongDAO().getSongs(ID);
                s.setName(name);
                s.setWriter(writerID);
                s.setGenre(genre);
                s.setLyrics(lyrics);
                if (!fileMp3.getName().isEmpty() && fileMp3.getSize() > 0) s.setDownLink(getLink(fileMp3, true));
                else s.setDownLink(s.getDownLink().split("id=")[1]);
                if (!fileAvatar.getName().isEmpty() && fileMp3.getSize() > 0) s.setAvatar(getLink(fileAvatar, false));
                else s.setAvatar(s.getAvatar().split("id=")[1]);
                SongDAO.updateSong(s);
                ArtistListDAO.update(artists, ID);
                response.sendRedirect("list");
            }
        }
    }

    private String getLink(javax.servlet.http.Part fileMp, boolean isMp3) {
        InputStream fileContentMp3 = null;
        try {
            String fileNameMp3 = Paths.get(fileMp.getSubmittedFileName()).getFileName().toString();
            fileContentMp3 = fileMp.getInputStream();
            java.io.File filePath = new File("fileName");
            FileOutputStream fosMp3 = new FileOutputStream(filePath);
            IOUtils.copy(fileContentMp3, fosMp3);
            if (isMp3) {
                return DriveQuickstart.uploadMp3(fileNameMp3, filePath).getId();
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
