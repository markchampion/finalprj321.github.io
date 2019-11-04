/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mark.dao;

import com.mark.context.DBContext;
import com.mark.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

    public static boolean checkEmail(String email) {
        String sql = "select * from users where email = '" + email + "'";
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery();) {
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean checkUser(String user) {
        String sql = "select * from users where username = '" + user + "'";
        try (Connection conn = new DBContext().getConnection();
                ResultSet rs = conn.prepareStatement(sql).executeQuery();) {
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
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

    public static void insert(User u) {
        String sql = "insert into users (username,[password],firstName,lastName,[Role], Address, Email, Phone, CreatedDate)\n"
                + "values(?,?,?,?,?,?,?,?,?)";
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getFirstName());
            ps.setString(4, u.getLastName());
            ps.setString(5, u.getRole());
            ps.setString(6, u.getAddress());
            ps.setString(7, u.getEmail());
            ps.setString(8, u.getPhone());
            ps.setString(9, u.getCreatedDate());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
