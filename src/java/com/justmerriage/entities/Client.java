package com.justmerriage.entities;

public class Client {

    private int id;
    private String name;
    private String email;
    private String password;
    private String gender;
    private String shopName;
    private String address;
    private String profile;

    public Client() {
    }

    public Client(int id, String name, String email, String password, String gender, String shopName, String address, String profile) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.shopName = shopName;
        this.address = address;
        this.profile = profile;
    }

    public Client(String name, String email, String password, String gender, String shopName, String address, String profile) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.shopName = shopName;
        this.address = address;
        this.profile = profile;
    }

    public Client(String name, String email, String password, String gender, String shopName) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.shopName = shopName;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the shopName
     */
    public String getShopName() {
        return shopName;
    }

    /**
     * @param shopName the shopName to set
     */
    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the profile
     */
    public String getProfile() {
        return profile;
    }

    /**
     * @param profile the profile to set
     */
    public void setProfile(String profile) {
        this.profile = profile;
    }

}
