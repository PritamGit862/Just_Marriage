/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.justmerriage.dao;

import com.justmerriage.entities.Category;
import com.justmerriage.entities.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    Connection con;

    public ProductDao(Connection con) {
        this.con = con;
    }
    
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        try{
            String query="select *from category";
            PreparedStatement st=this.con.prepareStatement(query);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                int cId=rs.getInt("cid");
                String name=rs.getString("name");
                String desc=rs.getString("description");
                Category ct=new Category(cId,name,desc);
                list.add(ct);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return list;
        
    }
    
    public boolean saveProduct(Product p){
        boolean f=false;
        try{
            String query="insert into product(name,price,description,cid,userid,image) values(?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, p.getName());
            ps.setString(2, p.getPrice());
            ps.setString(3, p.getDescription());
            ps.setInt(4, p.getCatId());
            ps.setInt(5, p.getClientId());
            ps.setString(6, p.getImage());
            ps.executeUpdate();
            f=true;
        }
        catch(Exception e){}
        return f;
    }
    
        public List<Product>  getAllProduct(){
        List<Product> list=new ArrayList<>();
        //Fetch all product
        try{
            PreparedStatement ps=this.con.prepareStatement("select *from product");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                int id=rs.getInt("id");
                String name=rs.getString("name");
                String price=rs.getString("price");
                String disc=rs.getString("description");
                String image=rs.getString("image");
                int categoryId=rs.getInt("cid");
                int clientId=rs.getInt("userid");
                Product product=new Product(id,name,image,disc, price, categoryId, clientId);
                list.add(product);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return list;
        }
        public List<Product> getAllProductByCatId(int catId){
        List<Product> list=new ArrayList<Product>();
        //Fetch product by id
        try{
            PreparedStatement ps=con.prepareStatement("select * from product where cid=?");
            ps.setInt(1, catId);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                int id=rs.getInt("id");
                String name=rs.getString("name");
                String price=rs.getString("price");
                String disc=rs.getString("description");
                String image=rs.getString("image");
                int categoryId=rs.getInt("cid");
                int clientId=rs.getInt("userid");
                Product product=new Product(id,name,image,disc, price, categoryId, clientId);
                list.add(product);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return list;
        }
}
