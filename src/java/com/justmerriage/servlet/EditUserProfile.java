/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.justmerriage.servlet;

import com.justmerriage.dao.UserDao;
import com.justmerriage.entities.Message;
import com.justmerriage.entities.User;
import com.justmerriage.helper.ConnectionProvider;
import com.justmerriage.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Dell
 */
@MultipartConfig
public class EditUserProfile extends HttpServlet {

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
            String userName = request.getParameter("user_name");
            String userPassword = request.getParameter("user_password");
            Part part = request.getPart("user_image");
            String imageName = part.getSubmittedFileName();
            //out.println(userEmail+"-"+userName+"-"+userPassword+"-"+imageName);
            //Get the user from session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            user.setEmail(userEmail);
            //out.println("====="+session);
            //out.println("=====Email===="+user.getEmail());
            user.setName(userName);
            user.setPassword(userPassword);
            String oldFile=user.getProfile();
            user.setProfile(imageName);
            //Update on Data base
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            //out.print("ans");
            boolean ans = userDao.updateUser(user);

            if (ans) {
                String path = request.getRealPath("/") +"image"+ File.separator +user.getProfile();
                String pathOldFile = request.getRealPath("/") + "userimage" + File.separator + oldFile;
                Helper.deleteFile(pathOldFile);
                if (Helper.saveFile(part.getInputStream(), path)) {
                    Message msg = new Message("Profile_Updated! ", "success", "alert-success");
                    session.setAttribute("msg", msg);
                } else {
                    Message msg = new Message("Something want wrong! ", "erron", "alert-danger");
                    session.setAttribute("msg", msg);
                }
            } else {
                //out.println("Not_Update");
                Message msg = new Message("Something want wrong! ", "erron", "alert-danger");
                session.setAttribute("msg", msg);
            }
           response.sendRedirect("userpage.jsp");
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
