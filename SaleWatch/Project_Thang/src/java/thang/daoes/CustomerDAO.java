/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thang.daoes;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import thang.db.DBUtils;
import thang.dtoes.CustomerDTO;

/**
 *
 * @author User
 */
public class CustomerDAO implements Serializable {

    Connection conn;
    PreparedStatement stm;
    ResultSet rs;

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
    private CustomerDTO dto = new CustomerDTO();

    public CustomerDTO getDto() {
        return dto;
    }

    public boolean checkLogin(String custID, String password) throws SQLException {
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * "
                        + "FROM customer "
                        + "WHERE custID=? AND password=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, custID);
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

    public String custName(String custID) throws SQLException {
        String first = null;
        String middle = null;
        String last = null;
        String full = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT firstName, middleName, lastName from customer where custID =?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, custID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    first = rs.getString("firstName");
                    middle = rs.getString("middleName");
                    last = rs.getString("lastName");
                }
                if (middle == "") {
                    full = first + " " + last;
                } else {
                    full = first + " " + middle + " " + last;
                }
            }
        } finally {
            closeConnection();
        }
        return full;
    }

    public CustomerDTO informationCust(String custID) throws SQLException {
        CustomerDTO cus = new CustomerDTO();
        try {
            conn = DBUtils.getConnection();
            if (conn!=null) {
                String sql = "SELECT * FROM Customer WHERE custID=?";
                stm=conn.prepareStatement(sql);
                stm.setString(1, custID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    custID = rs.getString("custID");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    cus = new CustomerDTO(custID, address, phone);
                }
            }
        } finally {
            closeConnection();
        }
        return cus;
    }

    public boolean insertAccount(String custID, String password, String firstname, String middlename, String lastname, String address, String phone)
            throws SQLException {
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Customer(custID, password, firstname, middlename, lastname, address, phone) "
                        + "VALUES(?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, custID);
                stm.setString(2, password);
                stm.setString(3, firstname);
                stm.setString(4, middlename);
                stm.setString(5, lastname);
                stm.setString(6, address);
                stm.setString(7, phone);
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
