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
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author PC
 */
public class CommentDAO {

    //INSERT
    public boolean insert(Comment c) {
        String sql = "insert into commentlist (songid, userid, content, createddate, likes) values (?,?,?,?,?)";
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, c.getSongID());
            ps.setInt(2, c.getUserID());
            ps.setString(3, c.getCreatedDate());
            ps.setString(4, c.getContent());
            ps.setInt(5, c.getLikes());

            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    //SELECT
    public List<Comment> select() {
        String sql = "select * from commentlist";
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();) {
            List<Comment> list = new LinkedList<>();
            while (rs.next()) {
                int ID = rs.getInt("id");
                int songID = rs.getInt("songid");
                int userID = rs.getInt("userid");
                String content = rs.getString("content");
                String createdDate = new SimpleDateFormat("dd-MM-yyyy").format(rs.getDate("createddate"));
                int likes = rs.getInt("likes");
                list.add(new Comment(ID, songID, userID, content, createdDate, likes));
            }
            return list;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
