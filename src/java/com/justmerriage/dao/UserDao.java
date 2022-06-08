
package com.justmerriage.dao;

import com.justmerriage.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //User Registration or Save data to data base table
    public boolean saveUser(User user) {
        boolean status = false;
        try {
            String query = "insert into user(name,email,password,gender) values(?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.executeUpdate();
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public User getEmailAndPassword(String userEmail, String userPassword) {
        User user = null;
        try {
            String query = "select *from user where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, userEmail);
            ps.setString(2, userPassword);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setProfile(rs.getString("profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String query = "update user set name=?,email=?,password=?,profile=? where id=?";
            PreparedStatement p=con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getProfile());
            p.setInt(5, user.getId());
            
            p.executeUpdate();
            f=true;
        } catch (Exception e) {
        }
        return f;
    }
}

