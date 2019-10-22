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
public class Song {

    private int ID;
    private String name;
    private String writerID;
    private String albumID;
    private String genre;
    private int uploaderID;
    private String uploadedDate;
    private int viewCount;
    private String downLink;
    private String avatar;
    private String lyrics;

    public Song() {
    }

    public Song(String name, String writerID, String genre, int uploaderID, String uploadedDate, int viewCount, String downLink, String avatar, String lyrics) {
        this.name = name;
        this.writerID = writerID;
        this.genre = genre;
        this.uploaderID = uploaderID;
        this.uploadedDate = uploadedDate;
        this.viewCount = viewCount;
        this.downLink = downLink;
        this.avatar = avatar;
        this.lyrics = lyrics;
    }

    public Song(int ID, String name, String writerID, String albumID, String genre, int uploaderID, String uploadedDate, int viewCount, String downLink, String avatar, String lyrics) {
        this.ID = ID;
        this.name = name;
        this.writerID = writerID;
        this.albumID = albumID;
        this.genre = genre;
        this.uploaderID = uploaderID;
        this.uploadedDate = uploadedDate;
        this.viewCount = viewCount;
        this.downLink = downLink;
        this.avatar = avatar;
        this.lyrics = lyrics;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getWriterID() {
        return writerID;
    }

    public void setWriterID(String writerID) {
        this.writerID = writerID;
    }

    public String getAlbumID() {
        return albumID;
    }

    public void setAlbumID(String albumID) {
        this.albumID = albumID;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getUploaderID() {
        return uploaderID;
    }

    public void setUploaderID(int uploaderID) {
        this.uploaderID = uploaderID;
    }

    public String getUploadedDate() {
        return uploadedDate;
    }

    public void setUploadedDate(String uploadedDate) {
        this.uploadedDate = uploadedDate;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }

    public String getDownLink() {
        return downLink;
    }

    public void setDownLink(String downLink) {
        this.downLink = downLink;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getLyrics() {
        return lyrics;
    }

    public void setLyrics(String lyrics) {
        this.lyrics = lyrics;
    }

}
