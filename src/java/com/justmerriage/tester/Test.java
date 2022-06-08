/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.justmerriage.tester;

import com.justmerriage.dao.ProductDao;
import com.justmerriage.entities.Product;
import com.justmerriage.helper.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class Test {
    Connection con =ConnectionProvider.getConnection();
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        //Fetch all product
        try {
            PreparedStatement ps = this.con.prepareStatement("select *from product");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String price = rs.getString("price");
                String disc = rs.getString("description");
                String image = rs.getString("image");
                int categoryId = rs.getInt("cid");
                int clientId = rs.getInt("userid");
                Product product = new Product(id, name, image, disc, price, categoryId, clientId);
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String... args) {
       Test test=new Test();
       List<Product> list=test.getAllProduct();
       ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
      
       System.out.println(dao.getAllProductByCatId(1));
    }
}
