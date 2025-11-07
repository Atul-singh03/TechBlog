package com.tech.blog.dao;

import java.sql.*;

public class LikeDao {

    private Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pid, int uid) {
        boolean f = false;
        try {
            String q = "INSERT INTO liked(pid, uid) VALUES(?, ?)";
            PreparedStatement p = con.prepareStatement(q);
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public int countLikeOnPost(int pid) {
        int count = 0;
        try {
            String q = "SELECT COUNT(*) AS cnt FROM liked WHERE pid=?";
            PreparedStatement p = con.prepareStatement(q);
            p.setInt(1, pid);
            ResultSet set = p.executeQuery();
            if (set.next()) {
                count = set.getInt("cnt");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean isLikedByUser(int pid, int uid) {
        boolean f = false;
        try {
            String q = "SELECT * FROM liked WHERE pid=? AND uid=?";
            PreparedStatement p = con.prepareStatement(q);
            p.setInt(1, pid);
            p.setInt(2, uid);
            ResultSet set = p.executeQuery();
            if (set.next()) f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean deleteLike(int pid, int uid) {
        boolean f = false;
        try {
            String q = "DELETE FROM liked WHERE pid=? AND uid=?";
            PreparedStatement p = con.prepareStatement(q);
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
