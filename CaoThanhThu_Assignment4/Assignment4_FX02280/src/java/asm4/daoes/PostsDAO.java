/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asm4.daoes;

import asm4.connect.DBUtils;
import asm4.dtoes.PostsDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CaoThu
 */
public class PostsDAO implements Serializable {

    public PostsDAO() {
    }

    private Connection conn = null;
    private PreparedStatement stm = null;
    private ResultSet rs = null;

    private PostsDTO dto = new PostsDTO();

    private void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (stm != null) {
            stm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public boolean createPost(int id, String userID, String title, String topic, String post, boolean publish, Date date) throws SQLException {
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Posts(id, username, title, topic, post, publish, date) "
                        + "VALUES(?, ?, ?, ?, ?, ?, ?)";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, id);
                stm.setString(2, userID);
                stm.setString(3, title);
                stm.setString(4, topic);
                stm.setString(5, post);
                stm.setBoolean(6, publish);
                stm.setDate(7, date);
                int result = stm.executeUpdate();
                if (result > 0) {
                    check = true;
                }
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean editPost(Integer id, String title, String topic, String post, boolean publish) throws SQLException {
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Posts "
                        + "SET title=?, topic=?, post=?, publish =? "
                        + "WHERE id=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, title);
                stm.setString(2, topic);
                stm.setString(3, post);
                stm.setBoolean(4, publish);
                stm.setInt(5, id);

                int result = stm.executeUpdate();
                if (result > 0) {
                    check = true;
                }
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    public int getLastId() throws SQLException {
        int count = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT id FROM posts ORDER BY id DESC LIMIT 1";
                stm = conn.prepareStatement(sql);

                rs = stm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt("id");
                } else {
                    count = 0;
                }
            }
        } finally {
            closeConnection();
        }
        return count;
    }

    public List<PostsDTO> showAllPost() throws SQLException {
        List<PostsDTO> listPost = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT id, name,posts.username as 'user', title, topic, publish, date "
                        + "FROM posts LEFT JOIN accounts ON posts.username = accounts.username "
                        + "ORDER BY date";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String username = rs.getString("user");
                    String title = rs.getString("title");
                    String topic = rs.getString("topic");
                    boolean pub = rs.getBoolean("publish");
                    Date date = rs.getDate("date");
                    listPost.add(new PostsDTO(id, username, title, topic, name, pub, date));
                }
            }
        } finally {
            closeConnection();
        }
        return listPost;
    }

    public PostsDTO showDetails(int id) throws SQLException {
        PostsDTO dto = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT name, posts.username as 'user', title, topic, post, publish, date "
                        + "FROM posts "
                        + "LEFT JOIN accounts ON posts.username = accounts.username "
                        + "WHERE posts.id=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                while (rs.next()) {
//                    id = rs.getInt("id");
                    String name = rs.getString("name");
                    String username = rs.getString("user");
                    String title = rs.getString("title");
                    String topic = rs.getString("topic");
                    String post = rs.getString("post");
                    boolean pub = rs.getBoolean("publish");
                    Date date = rs.getDate("date");

                    dto = new PostsDTO(id, username, title, topic, post, name, pub, date);
                }
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
}
