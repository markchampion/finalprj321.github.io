/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.dao;

import com.mark.context.DBContext;
import com.mark.model.Artist;
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
public class ArtistDAO {
    
    public List<Artist> getArtists() {
        String sql = "select * from artist";
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery();){
                List<Artist> list = new LinkedList<>();
                while(rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("fullname");
                    String birth = new SimpleDateFormat("dd-MM-yyyy").format(rs.getDate("birthdate"));
                    String address = rs.getString("address");
                    String des = rs.getString("description");
                    list.add(new Artist(id, name, birth, address, des));
                }
                return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public List<Artist> getArtistList(int songID) {
        String sql = "select * from artist, artistlist where artist.id = artistlist.artistid and artistlist.songid = " + songID;
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery();){
                List<Artist> list = new LinkedList<>();
                while(rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("fullname");
                    String birth = new SimpleDateFormat("dd-MM-yyyy").format(rs.getDate("birthdate"));
                    String address = rs.getString("address");
                    String des = rs.getString("description");
                    list.add(new Artist(id, name, birth, address, des));
                }
                return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    //INSERT
    public static void insert(Artist a) {
          String sql = "insert into artist (id, fullname, birthdate, address, description) values (?,?,?,?,?)";
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, a.getID());
            ps.setString(2, a.getName());
            ps.setString(3, a.getBirthDate());
            ps.setString(4, a.getAddress());
            ps.setString(5, a.getDescription());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
