/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.dao;

import com.mark.context.DBContext;
import com.mark.model.Song;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author PC
 */
public class SongDAO {

    //SELECT SONGS
    public List<Song> select() {
        List<Song> list = new LinkedList<>();
        String sql = "select * from Song, Artist, Writer \n" +
        "where song.ArtistID = Artist.ID and song.WriterID = Writer.ID";
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery()) {
            while (rs.next()) {
                int ID = rs.getInt("id");
                String name = rs.getString("name");
                String author = rs.getString("author");
                String singer = rs.getString("singer");
                String genre = rs.getString("genre");
                int userID = rs.getInt("uploaderid");
                String uploadedDate = new SimpleDateFormat("dd-MM-yyyy").format(rs.getDate("uploadeddate"));
                int viewCount = rs.getInt("viewcount");
                String avatar = rs.getString("avatar");
                String downlink = "https://docs.google.com/uc?export=download&id=" + rs.getString("downlink");
                String lyrics = rs.getString("lyrics");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //INSERT SONG
    public void insert(Song s) {
        String sql = "insert into song ( [name], writerid, albumid, artistid, genre, UploaderId,UploadedDate, Viewcount, Downlink, Avatar, Lyrics) values \n"
                + "(?,?,?,?,?,?,?,?,?,?)";
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, s.getName());
            ps.setString(2, s.getWriterID());
            ps.setString(3, s.getAlbumID());
            ps.setString(4, s.getArtistID());
            ps.setString(5, s.getGenre());
            ps.setInt(6, s.getUploaderID());
            ps.setDate(7, new Date(new java.util.Date().getTime()));
            ps.setInt(8, 0);//VIEWCOUNT
            ps.setString(9, s.getDownLink());
            ps.setString(10, s.getAvatar());
            ps.setString(11, s.getLyrics());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
