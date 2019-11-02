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
    public List<Song> getFavoriteSongs(int userID) {
        List<Song> list = new LinkedList<>();
        String sql = "select * from song, Writer, Favorite, users\n"
                + "where song.WriterID = writer.ID and song.id = Favorite.songID\n"
                + "and Favorite.userID = users.ID and users.ID = "+userID;
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery()) {
            while (rs.next()) {
                int ID = rs.getInt("id");
                String name = rs.getString(2);
                String writer = rs.getString(13);
                String album = rs.getString("albumid");
                String genre = rs.getString("genre");
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

    public List<Song> getSongsByViews() {
        List<Song> list = new LinkedList<>();
        String sql = "select * from song, Writer\n"
                + "where song.WriterID = writer.ID order by viewcount desc";
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery()) {
            while (rs.next()) {
                int ID = rs.getInt("id");
                String name = rs.getString(2);
                String writer = rs.getString(13);
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

    public List<Song> getSongsByDate() {
        List<Song> list = new LinkedList<>();
        String sql = "select * from song, Writer\n"
                + "where song.WriterID = writer.ID order by uploadeddate desc";
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery()) {
            while (rs.next()) {
                int ID = rs.getInt("id");
                String name = rs.getString(2);
                String writer = rs.getString(13);
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

    public Song getSongs(int ID) {
        String sql = "select * from Song where id = " + ID;
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery()) {
            while (rs.next()) {
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
                return new Song(ID, name, writer, album, genre, userID, uploadedDate, viewCount, downlink, avatar, lyrics);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //SEACHING BY NAME
    public static List<Song> search(String pattern) {
        List<Song> list = new LinkedList<>();
        String sql = "select * from Song where lower([name]) like N'%" + pattern.toLowerCase() + "%'";
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery()) {
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

    //UPDATE VIEWS
    public static void increaseView(int ID, int view) {
        String sql = " UPDATE song\n"
                + "SET viewcount = " + (view + 1) + " "
                + "WHERE ID = " + ID;
        try (Connection conn = new DBContext().getConnection();) {
            conn.prepareStatement(sql).executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //INSERT SONG
    public void insert(Song s) {
        String sql = "insert into song ( [name], writerid, albumid, genre, UploaderId,UploadedDate, Viewcount, Downlink, Avatar, Lyrics) values \n"
                + "(?,?,?,?,?,?,?,?,?,?)";
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, s.getName());
            ps.setString(2, s.getWriter());
            ps.setString(3, s.getAlbumID());
            ps.setString(4, s.getGenre());
            ps.setInt(5, s.getUploaderID());
            ps.setDate(6, new Date(new java.util.Date().getTime()));
            ps.setInt(7, 0);//VIEWCOUNT
            ps.setString(8, s.getDownLink());
            ps.setString(9, s.getAvatar());
            ps.setString(10, s.getLyrics());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void updateSong(Song s) {
        String sql = "update song set name = ?, writerid = ?, genre = ?, downlink = ?, avatar = ?, lyrics = ? where id = " + s.getID();
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, s.getName());
            ps.setString(2, s.getWriter());
            ps.setString(3, s.getGenre());
            ps.setString(4, s.getDownLink());
            ps.setString(5, s.getAvatar());
            ps.setString(6, s.getLyrics());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
