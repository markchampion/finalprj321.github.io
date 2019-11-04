/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.controller;

import com.mark.dao.ArtistDAO;
import com.mark.dao.UserDAO;
import com.mark.dao.WriterDAO;
import com.mark.javamail.GmailSending;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class VerifyFormServlet extends HttpServlet {

    private static String capcha = "";

    public static String getCapcha() {
        return capcha;
    }
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
            String from = request.getParameter("from");
            if (from != null && from.equals("writer")) {
                String id = request.getParameter("writerid");
                if (WriterDAO.isExist(id)) {
                    out.write("ID has been used!!!");
                }
            } else if (from != null && from.equals("artist")) {
                String id = request.getParameter("artistid");
                if (ArtistDAO.isExist(id)) {
                    out.write("ID has been used!!!");
                }
            } else if (from != null && from.equals("forgot")) {
                String email = request.getParameter("email");
                if (UserDAO.checkEmail(email)){
                    capcha = GmailSending.send(email);
                    out.write("success");
                } else {
                    out.write("error");
                }
            } else if (from != null && from.equals("capcha")) {
                if(capcha.equals(request.getParameter("capcha"))) {
                    out.write("success");
                } else {
                    out.write("error");
                }
            } else if (from != null && from.equals("registerEmail")) {
                if(UserDAO.checkEmail(request.getParameter("email"))) {
                    out.write("Email has been used");
                }
            } else if (from != null && from.equals("registerUser")) {
                if(UserDAO.checkUser(request.getParameter("user"))) {
                    out.write("Username has been used");
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
