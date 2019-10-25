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
public class Comment {
    private int ID;
    private int songID;
    private String user;
    private String avatar;
    private String content;
    private String createdDate;
    private int likes;

    public Comment() {
    }

    public Comment(int ID, int songID, String user, String avatar, String content, String createdDate, int likes) {
        this.ID = ID;
        this.songID = songID;
        this.user = user;
        this.avatar = avatar;
        this.content = content;
        this.createdDate = createdDate;
        this.likes = likes;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getSongID() {
        return songID;
    }

    public void setSongID(int songID) {
        this.songID = songID;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String userID) {
        this.user = userID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }
    
    

}
