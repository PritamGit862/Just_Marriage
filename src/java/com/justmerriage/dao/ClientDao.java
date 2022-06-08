package com.justmerriage.dao;

import com.justmerriage.entities.Client;
import com.justmerriage.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ClientDao {

    private Connection con;

    public ClientDao(Connection con) {
        this.con = con;
    }

    //Client Registration or Save data to data base table
    public boolean saveUser(Client client) {
        boolean status = false;
        try {
            String query = "insert into client(name,email,password,gender,shopname) values(?,?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, client.getName());
            ps.setString(2, client.getEmail());
            ps.setString(3, client.getPassword());
            ps.setString(4, client.getGender());
            ps.setString(5, client.getShopName());
            ps.executeUpdate();
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public Client getEmailAndPassword(String userEmail, String userPassword) {
        Client client = null;
        try {
            String query = "select *from client where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, userEmail);
            ps.setString(2, userPassword);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                client = new Client();
                client.setId(rs.getInt("id"));
                client.setName(rs.getString("name"));
                client.setEmail(rs.getString("email"));
                client.setPassword(rs.getString("password"));
                client.setGender(rs.getString("gender"));
                client.setProfile(rs.getString("profile"));
                client.setShopName(rs.getString("shopname"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return client;
    }

    public boolean updateUser(Client client) {
        boolean f = false;
        try {
            String query = "update client set name=?,email=?,password=?,profile=?,shopname=?,address=? where id=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, client.getName());
            p.setString(2, client.getEmail());
            p.setString(3, client.getPassword());
            p.setString(4, client.getProfile());
            p.setString(5, client.getShopName());
            p.setString(6, client.getAddress());
            p.setInt(7, client.getId());

            p.executeUpdate();
            f = true;
        } catch (Exception e) {
        }
        return f;
    }

}
