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
public class Artist {
    private String ID;
    private String name;
    private String nickName;
    private String birthDate;
    private String address;
    private String description;
    private String avatar;

    public Artist(String ID, String name, String nickName, String birthDate, String address, String description, String avatar) {
        this.ID = ID;
        this.name = name;
        this.nickName = nickName;
        this.birthDate = birthDate;
        this.address = address;
        this.description = description;
        this.avatar = avatar;
    }

    

    public Artist() {
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

    public String getAvatar() {
        return avatar;
    }

    public String getNickName() {
        return nickName;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
    
    
    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}
