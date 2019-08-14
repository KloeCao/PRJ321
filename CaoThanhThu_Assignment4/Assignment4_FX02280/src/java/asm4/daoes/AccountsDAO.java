/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asm4.daoes;

import asm4.connect.DBUtils;
import asm4.dtoes.AccountsDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author CaoThu
 */
public class AccountsDAO implements Serializable{

    public AccountsDAO() {
    }
    
    private AccountsDTO dto = new AccountsDTO();
    
            
    private Connection conn = null;
    private PreparedStatement stm = null;
    private ResultSet rs = null;

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
    
    public boolean checkLogin(String userID, String password) throws SQLException {
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * "
                        + "FROM accounts "
                        + "WHERE username=? AND pwd=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public String showAccountName(String userID) throws SQLException {
        String name = "";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT name "
                        + "FROM accounts "
                        + "WHERE username = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);

                rs = stm.executeQuery();
                if (rs.next()) {
                    name = rs.getString("name");
                }
            }
        } finally {
            closeConnection();
        }
        return name;
    }
    
    public String getRole(String userID) throws SQLException {
        String role = "";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT role "
                        + "FROM accounts "
                        + "WHERE username = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);

                rs = stm.executeQuery();
                if (rs.next()) {
                    role = rs.getString("role");
                }
            }
        } finally {
            closeConnection();
        }
        return role;
    }
    
    public boolean insertAccount(String accountID, String password, String name, String role)
            throws SQLException {
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO accounts(username, pwd, name, role) "
                        + "VALUES(?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, accountID);
                stm.setString(2, password);
                stm.setString(3, name);
                stm.setString(4, role);

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
}
