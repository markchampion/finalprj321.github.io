/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.dao;

import com.mark.context.DBContext;
import com.mark.model.Playlist;
import com.mark.model.Song;
import com.sun.org.apache.bcel.internal.generic.AALOAD;
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
public class PlaylistDAO {

    public static void insert(int uid, String name) {
        String sql = "insert into playlist (userid, name, createdDate) values (?,?,?)";
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setInt(1, uid);
            ps.setString(2, name);
            ps.setDate(3, new Date(new java.util.Date().getTime()));
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Song> getPlaylistDetail(int id) {
        List<Song> list = new LinkedList<>();
        String sql = "select * from Playlist, PlaylistDetail, Song, writer\n"
                + "                where Playlist.ID = PlaylistDetail.ID \n"
                + "                and PlaylistDetail.Songid = song.ID\n"
                + "				and song.WriterID = writer.ID"
                + " and Playlist.ID = " + id;
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery()) {
            while (rs.next()) {
                int ID = rs.getInt("songid");
                String name = rs.getString(8);
                String writer = rs.getString(19);
                String album = rs.getString("albumid");
                String genre = rs.getString("genre");
                int userID = rs.getInt("uploaderid");
                String uploadedDate = new SimpleDateFormat("dd-MM-yyyy").format(rs.getDate("uploadeddate"));
                int viewCount = rs.getInt("viewcount");
                String downlink = "https://docs.google.com/uc?export=download&id=" + rs.getString("downlink");
                String avatar = "https://docs.google.com/uc?export=download&id=" + rs.getString("avatar");
                String lyrics = rs.getString("lyrics");
                lyrics = lyrics != null ? lyrics.replaceAll("\n", "<br/>") : "";
                list.add(new Song(ID, name, writer, album, genre, userID, uploadedDate, viewCount, downlink, avatar, lyrics));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static boolean deleteInDetail(String playID, String songID) {
        String sql = "delete from playlistdetail where id = " + playID + " and songid =" + songID;
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement rs = conn.prepareStatement(sql)) {
            return rs.executeUpdate() == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean insertInDetail(String playID, String songID) {
        String sql = "insert into playlistdetail values(" + playID + "," + songID + ")";
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement rs = conn.prepareStatement(sql)) {
            return rs.executeUpdate() == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isInPlaylist(int playID, int songID) {
        String sql = "select * from playlistdetail where id = " + playID + " and songid =" + songID;
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery()) {
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Playlist> getPlaylists(int uid) {
        String sql = "select * from playlist, users where playlist.userid = users.id and users.id = " + uid;
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery();) {
            List<Playlist> list = new LinkedList<>();
            while (rs.next()) {
                String username = rs.getString("username");
                String playlistName = rs.getString(3);
                String created = new SimpleDateFormat("dd-MM-yyyy").format(rs.getDate(4));
                list.add(new Playlist(rs.getInt(2), username, playlistName, created));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
