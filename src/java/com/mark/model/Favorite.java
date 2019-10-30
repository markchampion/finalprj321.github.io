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
public class Favorite {
    private int userID;
    private int songID;

    public Favorite() {
    }

    public Favorite(int userID, int songID) {
        this.userID = userID;
        this.songID = songID;
    }

    public void setSongID(int songID) {
        this.songID = songID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getSongID() {
        return songID;
    }

    public int getUserID() {
        return userID;
    }
    
}
