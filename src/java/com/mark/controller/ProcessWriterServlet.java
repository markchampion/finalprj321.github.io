/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.controller;

import com.google.gson.Gson;
import com.mark.dao.ArtistDAO;
import com.mark.dao.WriterDAO;
import com.mark.model.Artist;
import com.mark.model.Writer;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class ProcessWriterServlet extends HttpServlet {

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
        response.setContentType("application/json;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            if (action != null && action.equals("delete")) {
                if (WriterDAO.delete(request.getParameter("id"))) {
                    response.sendRedirect("/PRJ321_FINAL_PROJECT/page-admin/info-writer.jsp");
                } else {
                    request.setAttribute("delError", "You'll need to delete writer's song first!!!");
                    request.getRequestDispatcher("page-admin/info-writer.jsp").forward(request, response);
                }
            } else if (action != null && action.equals("update")) {
                Gson gson = new Gson();
                Writer w = gson.fromJson(request.getParameter("obj"), Writer.class);
                WriterDAO.update(w);
                out.write(gson.toJson(w));
            } else {
                StringBuilder buffer = new StringBuilder();
                BufferedReader reader = request.getReader();
                String line;
                while ((line = reader.readLine()) != null) {
                    buffer.append(line);
                }
                String data = buffer.toString();
                String prevURL = "";
                String decodeURL = data;
                while (!prevURL.equals(decodeURL)) {
                    prevURL = decodeURL;
                    decodeURL = URLDecoder.decode(decodeURL, StandardCharsets.UTF_8.name());
                }
                Gson gson = new Gson();
                Writer w = gson.fromJson(decodeURL, Writer.class);
                WriterDAO.insert(w);
                out.write(gson.toJson(w));
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
