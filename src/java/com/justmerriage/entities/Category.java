/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.justmerriage.entities;

/**
 *
 * @author Dell
 */
public class Category {

    private int cId;
    private String cName;
    private String description;

    public Category() {
    }

    public Category(int cId, String cName, String description) {
        this.cId = cId;
        this.cName = cName;
        this.description = description;
    }

    public Category(String cName, String description) {
        this.cName = cName;
        this.description = description;
    }

    /**
     * @return the cId
     */
    public int getcId() {
        return cId;
    }

    /**
     * @param cId the cId to set
     */
    public void setcId(int cId) {
        this.cId = cId;
    }

    /**
     * @return the cName
     */
    public String getcName() {
        return cName;
    }

    /**
     * @param cName the cName to set
     */
    public void setcName(String cName) {
        this.cName = cName;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }
   
}
