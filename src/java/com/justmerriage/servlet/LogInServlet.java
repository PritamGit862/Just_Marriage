/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.justmerriage.servlet;

import com.justmerriage.dao.ClientDao;
import com.justmerriage.dao.UserDao;
import com.justmerriage.entities.Client;
import com.justmerriage.entities.Message;
import com.justmerriage.entities.User;
import com.justmerriage.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
public class LogInServlet extends HttpServlet {

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
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            String post = request.getParameter("select_post");
            //System.out.println("Post is===================="+post);
            //System.out.println("Email is =>"+userEmail+"Password is =>"+userPassword);

            
            //LogIn for User
            if(post.equals("user")){
                UserDao dao = new UserDao(ConnectionProvider.getConnection());
                User user = dao.getEmailAndPassword(userEmail, userPassword);
                if (user == null) {
                    Message msg = new Message("Invalid Details! Try Again", "error", "alert-danger");
                    HttpSession session = request.getSession();
                    session.setAttribute("msg", msg);
                    response.sendRedirect("login.jsp");
                } else {
                    System.out.print("Opretor is=" + user.getName());
                    HttpSession session = request.getSession();
                    session.setAttribute("currentUser", user);
                    response.sendRedirect("userpage.jsp");

                }
            } 
            
            //login for client
            if(post.equals("client")){
                ClientDao dao = new ClientDao(ConnectionProvider.getConnection());
                Client client = dao.getEmailAndPassword(userEmail, userPassword);
                if (client == null) {
                    Message msg = new Message("Invalid Details! Try Again", "error", "alert-danger");
                    HttpSession session = request.getSession();
                    session.setAttribute("msg", msg);
                    response.sendRedirect("login.jsp");
                } else {
                    System.out.print("Opretor is=" +client.getName());
                    HttpSession session = request.getSession();
                    session.setAttribute("currentUser", client);
                    response.sendRedirect("clientpage.jsp");

                }
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            else {
                Message msg = new Message("Invalid Post! Try Again", "error", "alert-danger");
                HttpSession session = request.getSession();
                session.setAttribute("msg", msg);
 //                response.sendRedirect("login.jsp");
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
