/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.bean;

import com.mark.context.DBContext;
import com.mark.model.Artist;
import com.mark.model.Writer;
import java.sql.CallableStatement;
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
public class PagingArtists {
     private int page;
    {
        page = 1;
    }

    public PagingArtists() {
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }
    
     public List<Artist> getArtists() {
         int size = 5;
        int from = (page - 1) * size + 1;
        int to = page * size;
        List<Artist> list = new LinkedList<>();
        String sql = "exec SelectPageArtist" + from + ", " + to;
        try (Connection conn = new DBContext().getConnection();
                CallableStatement cs = conn.prepareCall("{call SelectPageArtist(?,?)}");) {
            cs.setInt(1, from);
            cs.setInt(2, to);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("fullname");
                String birth = new SimpleDateFormat("dd-MM-yyyy").format(rs.getDate("birthdate"));
                String address = rs.getString("address");
                String des = rs.getString("description");
                list.add(new Artist(id, name, birth, address, des));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public int getPages() {
        String sql = "select count(*) from writer";
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
}
