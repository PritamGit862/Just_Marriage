/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.justmerriage.servlet;

import com.justmerriage.dao.ClientDao;
import com.justmerriage.dao.UserDao;
import com.justmerriage.entities.Client;
import com.justmerriage.entities.User;
import com.justmerriage.helper.ConnectionProvider;
import com.justmerriage.helper.EmailOTP;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
@MultipartConfig
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    static boolean checkAuth=false;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int emailOTP = 0;
            int userOTP = 0;
            //get all form details of User
            String otp = request.getParameter("userotp");
            String check = request.getParameter("check");
            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            String userGender = request.getParameter("user_gender");
            
            String post=request.getParameter("post");
           
            //get Detail of Bussness form
            String shopName=request.getParameter("shop_name");
            
            
            if (check != null) {
                //setCheckAuthrise(true);
                if (otp.equals("")) {
                    out.print("OTP is send to your Email! Please Check and enter!");
                     out.flush();
                    emailOTP=EmailOTP.sendEmail(userEmail);
                    userOTP=Integer.parseInt(otp);
                } else {
                    if(emailOTP==userOTP){
                         out.flush();
                        //Register data save for User
                        if(post.equals("user")){
                        User user=new User(userName,userEmail,userPassword,userGender);
                        UserDao userDao=new UserDao(ConnectionProvider.getConnection());
                        if(userDao.saveUser(user)){
                            out.flush();
                            out.println("Done");
                        }
                        else{
                            out.flush();
                            out.println("Error");
                        }
                        }
                        
                        if(post.equals("client")){
                            Client client=new Client(userName,userEmail,userPassword,userGender,shopName);
                            ClientDao clientDao=new ClientDao(ConnectionProvider.getConnection());
                            if(clientDao.saveUser(client)){
                                out.flush();
                                out.print("Done");
                            }
                            else{
                            out.flush();
                            out.println("Error");
                            }
                        }
                        else{}
                        
                    }
                    else{
                        out.println("OTP is wrong......!");
                    }
                }
            } else {
                setCheckAuthrise(false);
                out.println("Plz check terms&Conditions.....!");
            }
            

        }
    }

    public void setCheckAuthrise(boolean checkAuth) {
        RegisterServlet.checkAuth = checkAuth;
    }

    public static boolean getCheckAuthrise() {
        return checkAuth;
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
