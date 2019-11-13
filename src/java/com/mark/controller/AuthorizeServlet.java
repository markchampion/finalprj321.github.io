package com.mark.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.mark.dao.UserDAO;
import com.mark.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
public class AuthorizeServlet extends HttpServlet {

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
            HttpSession session = request.getSession(true);
            if (action != null && action.equals("login")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                User user;
                if (username != null && password != null) {
                    user = new UserDAO().verifyLogin(username, password);
                    if (user != null) {
                        if (request.getParameter("remember") != null) {
                            Cookie c1 = new Cookie("username", username);
                            c1.setMaxAge(60 * 60 * 24 * 365);
                            Cookie c2 = new Cookie("password", password);
                            c2.setMaxAge(60 * 60 * 24 * 365);
                            response.addCookie(c1);
                            response.addCookie(c2);
                        } else {
                            for (Cookie c : request.getCookies()) {
                                if (c.getValue().equals(username) || c.getValue().equals(password)) {
                                    c.setMaxAge(0);
                                    response.addCookie(c);
                                }
                            }
                        }
                        session.setAttribute("logStatus", user);
                        response.sendRedirect("/PRJ321_FINAL_PROJECT/list");
                        return;
                    }
                }
                session.setAttribute("error", "Username or Password incorrect!!!");
                response.sendRedirect("login.jsp");
            } else if (action != null && action.equals("logout")) {
                session.removeAttribute("logStatus");
                session.removeAttribute("error");
                response.sendRedirect("/PRJ321_FINAL_PROJECT/login.jsp");
            } else if (action != null && action.equals("register")) {
                String defaultAvatar = "1uuiw3Y-YnuE9bYrnx-7tzGsw5KRUIluS";
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String firstName = request.getParameter("firstname");
                String lastName = request.getParameter("lastname");
                String email = request.getParameter("email");
                User user = new User(username, password, firstName, lastName, email, "user", new SimpleDateFormat("yyyy-MM-dd").format(new Date()), true);
                user.setAvatar("https://docs.google.com/uc?export=download&id=" + defaultAvatar);
                UserDAO.insert(user);
                session.setAttribute("logStatus", user);
                response.sendRedirect("/PRJ321_FINAL_PROJECT/list");
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
