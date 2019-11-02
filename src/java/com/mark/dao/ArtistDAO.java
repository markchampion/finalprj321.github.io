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
                ResultSet rs = conn.prepareStatement(sql).executeQuery();) {
            List<Artist> list = new LinkedList<>();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("fullname");
                String nickname = rs.getString("nickname");
                String birth = new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate("birthdate"));
                String address = rs.getString("address");
                String des = rs.getString("description");
                String avatar = rs.getString("avatar");
                list.add(new Artist(id, name, nickname, birth, address, des, avatar));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Artist getArtist(String id) {
        String sql = "select * from artist where id = '" + id + "'";
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery();) {
            List<Artist> list = new LinkedList<>();
            if (rs.next()) {
                String name = rs.getString("fullname");
                String nickname = rs.getString("nickname");
                String birth = new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate("birthdate"));
                String address = rs.getString("address");
                String des = rs.getString("description");
                String avatar = "https://docs.google.com/uc?export=download&id=" + rs.getString("avatar");
                return new Artist(id, name, nickname, birth, address, des, avatar);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Artist> getArtistList(int songID) {
        String sql = "select * from artist, artistlist where artist.id = artistlist.artistid and artistlist.songid = " + songID;
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery();) {
            List<Artist> list = new LinkedList<>();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("fullname");
                String nickname = rs.getString("nickname");
                String birth = new SimpleDateFormat("dd-MM-yyyy").format(rs.getDate("birthdate"));
                String address = rs.getString("address");
                String des = rs.getString("description");
                String avatar = "https://docs.google.com/uc?export=download&id=" + rs.getString("avatar");
                list.add(new Artist(id, name, nickname, birth, address, des, avatar));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    //INSERT
    public static void insert(Artist a) {
        String sql = "insert into artist (id, fullname, nickname, birthdate, address, description, avatar) values (?,?,?,?,?,?,?)";
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, a.getID());
            ps.setString(2, a.getName());
            ps.setString(3, a.getNickName());
            ps.setString(4, a.getBirthDate());
            ps.setString(5, a.getAddress());
            ps.setString(6, a.getDescription());
            ps.setString(7, a.getAvatar());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void delete(String id) {
        String sql = "delete from artist where id = '" + id + "'";
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void update(Artist w) {
        String sql = "update artist set fullname = ?, nickname = ?, address = ?, birthdate = ?, description = ?, avatar = ? where id = ?";
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, w.getName());
            ps.setString(2, w.getNickName());
            ps.setString(3, w.getAddress());
            ps.setString(4, w.getBirthDate());
            ps.setString(5, w.getDescription());
            ps.setString(6, w.getAvatar());
            ps.setString(7, w.getID());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean isExist(String id) {
        String sql = "select * from artist where id = '" + id + "'";
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery();) {
            System.out.println("hahahaha");
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
