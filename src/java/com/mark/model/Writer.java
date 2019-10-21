/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.model;

/**
 *
 * @author PC
 */
public class Writer {

    private String ID;
    private String name;
    private String address;
    private String birthDate;
    private String description;

    public Writer() {
    }

    public Writer(String ID, String name, String address, String birthDate, String description) {
        this.ID = ID;
        this.name = name;
        this.address = address;
        this.birthDate = birthDate;
        this.description = description;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
