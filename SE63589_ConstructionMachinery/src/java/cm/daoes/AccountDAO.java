/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cm.daoes;

import cm.dtoes.AccountDTO;
import cm.utils.DBUtils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CaoThu
 */
public class AccountDAO implements Serializable {

    Connection conn;
    PreparedStatement stm;
    ResultSet rs;

    private void closeConnection() throws SQLException{
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
    private AccountDTO dto = new AccountDTO();

    public AccountDTO getDto() {
        return dto;
    }

    //Login for Admin (1), User (2), Banned (3)
    public boolean checkLogin(String accountID, String password) throws SQLException {
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT role "
                        + "FROM tblAccount "
                        + "WHERE accountID=? AND password=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, accountID);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int role = rs.getInt("role");

                    dto = new AccountDTO(role);
                    check = true;
                }
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    //search account name to Welcome...
    public String showAccountName(String accountID) throws SQLException {
        String name = "";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT accountName "
                        + "FROM tblAccount "
                        + "WHERE accountID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, accountID);

                rs = stm.executeQuery();
                if (rs.next()) {
                    name = rs.getString("accountName");
                }
            }
        } finally {
            closeConnection();
        }
        return name;
    }

    //Insert Account for User, role set default = 2
    public boolean insertAccount(String accountID, String password, String accountName, String numberPhone, String address, int role)
            throws SQLException {
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblAccount(accountID, password, accountName, numberPhone, address, role) "
                        + "VALUES(?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, accountID);
                stm.setString(2, password);
                stm.setString(3, accountName);
                stm.setString(4, numberPhone);
                stm.setString(5, address);
                stm.setInt(6, role);

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

    //Update for Admin: edit password, name, phone, addr, role | cannot edit ID
    public boolean updateAccount(String accountID, String password, String accountName, String numberPhone, String address, int role) throws SQLException {
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblAccount "
                        + "SET password=?, accountName=?, numberPhone=?, address=?, role=? "
                        + "WHERE accountID=?";
                stm = conn.prepareStatement(sql);

                stm.setString(1, password);
                stm.setString(2, accountName);
                stm.setString(3, numberPhone);
                stm.setString(4, address);
                stm.setInt(5, role);
                stm.setString(6, accountID);

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

    // getAccount to Update page 
    public AccountDTO getAccount(String accountID) throws SQLException {
        AccountDTO account = new AccountDTO();
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT accountID, password, accountName, numberPhone, address, role "
                    + "FROM tblAccount "
                    + "WHERE accountID =?";
            stm = conn.prepareStatement(sql);
            stm.setString(1, accountID);
            rs = stm.executeQuery();
            if (rs.next()) {
                String accID = rs.getString("accountID");
                String password = rs.getString("password");
                String accountName = rs.getString("accountName");
                String numberPhone = rs.getString("numberPhone");
                String address = rs.getString("address");
                int role = rs.getInt("role");
                account = new AccountDTO(accID, password, accountName, numberPhone, address, role);
            }
        } finally {
            closeConnection();
        }
        return account;
    }

    //List Account for admin: management
    public List<AccountDTO> getListAccount() throws SQLException {
        List<AccountDTO> listAccount = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT accountID, password, accountName, "
                        + "numberPhone, address, role "
                        + "FROM tblAccount";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String accountID = rs.getString("accountID");
                    String password = rs.getString("password");
                    String accountName = rs.getString("accountName");
                    String numberPhone = rs.getString("numberPhone");
                    String address = rs.getString("address");
                    int role = rs.getInt("role");

                    listAccount.add(new AccountDTO(accountID, password,
                            accountName, numberPhone, address, role));
                }
            }
        } finally {
            closeConnection();
        }
        return listAccount;
    }

    //Search Account for admin: management
    public List<AccountDTO> searchListAccount(String searchIDName)
            throws SQLException {
        List<AccountDTO> listSearchAccount = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT accountID, password, accountName, "
                        + "numberPhone, address, role "
                        + "FROM tblAccount "
                        + "WHERE accountID LIKE ? OR accountName LIKE ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + searchIDName + "%");
                stm.setString(2, "%" + searchIDName + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String accountID = rs.getString("accountID");
                    String password = rs.getString("password");
                    String accountName = rs.getString("accountName");
                    String numberPhone = rs.getString("numberPhone");
                    String address = rs.getString("address");
                    int role = rs.getInt("role");

                    listSearchAccount.add(new AccountDTO(accountID, password,
                            accountName, numberPhone, address, role));
                }
            }
        } finally {
            closeConnection();
        }
        return listSearchAccount;
    }
}
