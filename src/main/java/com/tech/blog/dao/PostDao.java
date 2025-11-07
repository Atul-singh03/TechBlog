package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    private Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    // Save a post to DB
    public boolean savePost(Post p) {
        boolean success = false;
        String query = "INSERT INTO post(pTitle, pContent, pCode, pPic, catId, userId) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());

            int rows = pstmt.executeUpdate();
            success = rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    // Get all categories
    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM category");
            while (rs.next()) {
                Category c = new Category(rs.getInt("cid"), rs.getString("name"), rs.getString("description"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get all posts
    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM post ORDER BY pid DESC";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Post p = new Post();
                p.setPid(rs.getInt("pid"));
                p.setpTitle(rs.getString("pTitle"));
                p.setpContent(rs.getString("pContent"));
                p.setpCode(rs.getString("pCode"));
                p.setpPic(rs.getString("pPic"));
                p.setpDate(rs.getTimestamp("pDate"));
                p.setCatId(rs.getInt("catId"));
                p.setUserId(rs.getInt("userId"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get posts by category
    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM post WHERE catId = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, catId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Post p = new Post();
                p.setPid(rs.getInt("pid"));
                p.setpTitle(rs.getString("pTitle"));
                p.setpContent(rs.getString("pContent"));
                p.setpCode(rs.getString("pCode"));
                p.setpPic(rs.getString("pPic"));
                p.setpDate(rs.getTimestamp("pDate"));
                p.setCatId(rs.getInt("catId"));
                p.setUserId(rs.getInt("userId"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get posts by user
    public List<Post> getPostByUserId(int userId) {
        List<Post> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM post WHERE userId = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Post p = new Post();
                p.setPid(rs.getInt("pid"));
                p.setpTitle(rs.getString("pTitle"));
                p.setpContent(rs.getString("pContent"));
                p.setpCode(rs.getString("pCode"));
                p.setpPic(rs.getString("pPic"));
                p.setpDate(rs.getTimestamp("pDate"));
                p.setCatId(rs.getInt("catId"));
                p.setUserId(rs.getInt("userId"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
