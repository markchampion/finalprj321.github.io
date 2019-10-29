/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.dao;

import com.mark.context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author PC
 */
public class ArtistListDAO {

    //INSERT
    public static boolean insert(String[] artists) {
        String sql = "insert into artistlist (artistid, songid) values(?,?)";
        String sqlSong = "select top 1 *\n"
                + "from song \n"
                + "order by id desc";
        int songID = 0;
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sqlSong).executeQuery();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            if (rs.next()) {
                songID = rs.getInt("ID");
            }
            for (String artist : artists) {
                ps.setString(1, artist);
                ps.setInt(2, songID);
                ps.executeUpdate();
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void update(String[] artists, int songID) {
        String delSql = "delete from artistlist where songid = " + songID;
        String upSql = "insert into artistlist (artistid, songid) values(?,?)";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(delSql);
            ps.executeUpdate();
            ps = conn.prepareStatement(upSql);
            for (String artist : artists) {
                ps.setString(1, artist);
                ps.setInt(2, songID);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
