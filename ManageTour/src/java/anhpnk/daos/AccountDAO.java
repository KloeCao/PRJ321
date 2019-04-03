/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.daos;

import anhpnk.conn.MyConnection;
import anhpnk.dtos.AccountDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Kim Anh
 */
public class AccountDAO implements Serializable {
    private Connection conn = null;
    private PreparedStatement preStm = null;
    private ResultSet rs = null;

    public AccountDAO() {
    }
    
    private void closeConnection() throws Exception {
        if(rs != null) {
            rs.close();
        }
        if(preStm != null) {
            preStm.close();
        }
        if(conn != null) {
            conn.close();
        }
    }
    
    public String checkLogin(String username, String password) throws Exception {
        String role = "failed";
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select role From Account Where username=? And password=? and status='true'";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            preStm.setString(2, password);
            rs = preStm.executeQuery();
            if(rs.next()) {
                role = rs.getString("role");
            }
        } finally {
            closeConnection();
        }
        return role;
    }
    
    public String getPassword(String username) throws Exception {
        String result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select password From Account Where username = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            rs = preStm.executeQuery();
            if(rs.next()) {
                result = rs.getString("password");
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean updatePassword(String username, String password) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update Account Set password = ? Where username = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, password);
            preStm.setString(2, username);
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public HashMap<String, String> getAllTourGuide() throws Exception {
        HashMap<String, String> result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select username, fullname From Account AC Join TourGuide TG On AC.username = TG.tourGuideID Where role = 'guide' and status = 1";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            String id, fullname;
            result = new HashMap<>();
            while(rs.next()) {
                id = rs.getString("username");
                fullname = rs.getString("fullname");
                result.put(id, fullname);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean insert(AccountDTO account) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Insert Into Account(username, password, role, status) Values(?,?,?,?)";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, account.getUsername());
            preStm.setString(2, account.getPassword());
            preStm.setString(3, account.getRole());
            preStm.setBoolean(4, account.isStatus());
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean updateStatus(String username) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update Account Set status = 0 Where username = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
}
