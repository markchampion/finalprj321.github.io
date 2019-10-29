/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.dao;

import com.mark.context.DBContext;
import com.mark.model.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

/**
 *
 * @author PC
 */
public class UserDAO {

    //SELECT ALL USER
    //CHECK LOGIN
    public User verifyLogin(String username, String pass) {
        String sql = "select * from users where username = '" + username + "'";
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery();) {
            if (rs.next() && rs.getString("password").equals(pass)) {
                int ID = rs.getInt("ID");
                String firstName = rs.getString("firstname");
                String lastName = rs.getString("lastname");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String role = rs.getString("role");
                String createdDate = new SimpleDateFormat("dd-MM-yyyy").format(rs.getDate("createddate"));
                boolean isActivated = rs.getInt("isactivated") == 1;
                String avatar = "https://docs.google.com/uc?export=download&id=" + rs.getString("avatar");
                return new User(ID, username, pass, firstName, lastName, address, phone, email, role, createdDate, isActivated, avatar);
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public User select(int ID) {
        System.out.println("user id = " + ID);
        String sql = "select * from users where id = " + ID;
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery();) {
            if (rs.next()) {
                String username = rs.getString("username");
                String pass = rs.getString("password");
                String firstName = rs.getString("firstname");
                String lastName = rs.getString("lastname");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String role = rs.getString("role");
                String createdDate = new SimpleDateFormat("dd-MM-yyyy").format(rs.getDate("createddate"));
                boolean isActivated = rs.getInt("isactivated") == 1;
                String avatar = "https://docs.google.com/uc?export=download&id=" + rs.getString("avatar");
                
                return new User(ID, username, pass, firstName, lastName, address, phone, email, role, createdDate, isActivated, avatar);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
