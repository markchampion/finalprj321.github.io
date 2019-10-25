/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.dao;

import com.mark.context.DBContext;
import com.mark.model.Comment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author PC
 */
public class CommentDAO {
    private int songID;

    public CommentDAO() {
    }

    public void setSongID(int songID) {
        this.songID = songID;
    }

    public int getSongID() {
        return songID;
    }
    
    //INSERT
    public static boolean insert(Comment c) {
        String sql = "insert into commentlist (songid, userid, content, createddate, likes) values (?,?,?,?,?)";
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, c.getSongID());
            ps.setInt(2, Integer.parseInt(c.getUser()));
            ps.setString(3, c.getContent());
            ps.setDate(4, new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(c.getCreatedDate()).getTime()));
            ps.setInt(5, c.getLikes());
            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    //SELECT
    public List<Comment> getComments() {
        String sql = "select * from commentlist,users where commentlist.userid = users.id and commentlist.songID = "+songID+" order by commentlist.id desc";
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();) {
            List<Comment> list = new LinkedList<>();
            while (rs.next()) {
                int ID = rs.getInt("id");
                int songID = rs.getInt("songid");
                String user = rs.getString("username");
                String avatar = "https://docs.google.com/uc?export=download&id=" + rs.getString("avatar");
                String content = rs.getString("content");
                String createdDate = new SimpleDateFormat("dd-MM-yyyy").format(rs.getDate("createddate"));
                int likes = rs.getInt("likes");
                list.add(new Comment(ID, songID, user, avatar, content, createdDate, likes));
            }
            return list;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
