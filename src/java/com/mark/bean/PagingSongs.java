package com.mark.bean;

import com.mark.context.DBContext;
import com.mark.model.Song;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author PC
 */
public class PagingSongs {
    private int page,size;
    {
        size = 5;
        page = 1;
    }

    public PagingSongs() {
    }

    public PagingSongs(int page, int size) {
        this.page = page;
        this.size = size;
    }



    public void setPage(int page) {
        this.page = page;
    }

    public void setSize(int size) {
        this.size = size;
    }
    
      public int getPages() {
        String sql = "select count(*) from song";
        int row = 0;
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                row = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return row < 5 ? 1 : (int)Math.ceil((double)row/5);
    }
    
    public List<Song> getSongs(){
            int from = (page - 1) * size + 1;
        int to = page * size;
        List<Song> list = new LinkedList<>();
        String sql = "exec SelectPageSong " + from + ", " + to;
        try (Connection conn = new DBContext().getConnection();
                CallableStatement cs = conn.prepareCall("{call SelectPageSong(?,?)}");) {
            cs.setInt(1, from);
            cs.setInt(2, to);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                int ID = rs.getInt("id");
                String name = rs.getString("name");
                String writer = rs.getString("writerID");
                String album = rs.getString("albumid");
                String genre = rs.getString("genre");
                int userID = rs.getInt("uploaderid");
                String uploadedDate = new SimpleDateFormat("dd-MM-yyyy").format(rs.getDate("uploadeddate"));
                int viewCount = rs.getInt("viewcount");
                String downlink = "https://docs.google.com/uc?export=download&id=" + rs.getString("downlink");
                String avatar = "https://docs.google.com/uc?export=download&id=" + rs.getString("avatar");
                String lyrics = rs.getString("lyrics");
                list.add(new Song(ID, name, writer, album, genre, userID, uploadedDate, viewCount, downlink, avatar, lyrics));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
}
