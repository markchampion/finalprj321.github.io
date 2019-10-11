/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.dao;

import com.mark.context.DBContext;
import com.mark.model.Song;
import java.sql.Connection;
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
        String sql = "select * from song";
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery()){
            while(rs.next()) {
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
                list.add(new Song(ID, name, author, singer, genre, userID, uploadedDate, viewCount, downlink, avatar, lyrics));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
