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
public class FavoriteDAO {
    public boolean isFavorite(int songID, int userID) {
        String sql = "select * from favorite where userid = " +userID+ " and songID = " + songID;
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery()){
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static void insert(int userID, int songID) {
        String sql = "insert into favorite (userid, songid) values ("+userID+","+songID+")";
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);){
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void delete(int userID, int songID) {
        String sql = "delete from favorite where userid = " + userID+" and songid = " + songID;
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);){
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
