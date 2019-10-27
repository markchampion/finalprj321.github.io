/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.dao;

import com.mark.context.DBContext;
import com.mark.model.Writer;
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
public class WriterDAO {

    private String ID;

    public WriterDAO() {
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getID() {
        return ID;
    }
    
    public static void insert(Writer w) {
        String sql = "insert into writer (id, name, birthdate, address, description) values (?,?,?,?,?)";
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, w.getID());
            ps.setString(2, w.getName());
            ps.setString(3, w.getBirthDate());
            ps.setString(4, w.getAddress());
            ps.setString(5, w.getDescription());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Writer> getWriters() {
        String sql = "select * from writer";
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery();) {
            List<Writer> list = new LinkedList<>();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String birth = new SimpleDateFormat("dd-MM-yyyy").format(rs.getDate("birthdate"));
                String address = rs.getString("address");
                String des = rs.getString("description");
                list.add(new Writer(id, name, address, birth, des));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Writer getWriter() {
        String sql = "select * from writer where id = " + "'" + ID + "'";
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery();) {
            List<Writer> list = new LinkedList<>();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String birth = new SimpleDateFormat("dd-MM-yyyy").format(rs.getDate("birthdate"));
                String address = rs.getString("address");
                String des = rs.getString("description");
                return new Writer(id, name, address, birth, des);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
