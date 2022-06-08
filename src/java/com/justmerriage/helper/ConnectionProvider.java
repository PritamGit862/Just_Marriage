package com.justmerriage.helper;

import java.sql.*;


public class ConnectionProvider {
    public static Connection con;
    public static Connection getConnection(){
        try{
            //Driver load
            if(con==null){
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/justmerriage","root","123");
            }
        }    
        catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
    
}
