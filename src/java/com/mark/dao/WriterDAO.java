/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.dao;

import com.mark.context.DBContext;
import com.mark.model.Writer;
import java.sql.Connection;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author PC
 */
public class WriterDAO {
      public List<Writer> getWriters() {
        String sql = "select * from writer";
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery();){
                List<Writer> list = new LinkedList<>();
                while(rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    String birth = new SimpleDateFormat("dd-MM-yyyy").format(rs.getDate("birthdate"));
                    String address = rs.getString("address");
                    String des = rs.getString("description");
                    list.add(new Writer(id, name, birth, des));
                }
                return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
