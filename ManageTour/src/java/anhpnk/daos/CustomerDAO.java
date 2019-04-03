/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.daos;

import anhpnk.conn.MyConnection;
import anhpnk.dtos.CustomerDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kim Anh
 */
public class CustomerDAO implements Serializable {
    private Connection conn = null;
    private PreparedStatement preStm = null;
    private ResultSet rs = null;

    public CustomerDAO() {
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
    
    public CustomerDTO getInformation(String username) throws Exception {
        CustomerDTO result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select fullname, email, phone From Customer Where username = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            rs = preStm.executeQuery();
            String fullname, email, phone;
            if(rs.next()) {
                fullname = rs.getString("fullname");
                email = rs.getString("email");
                phone = rs.getString("phone");
                result = new CustomerDTO(username, fullname, email, phone);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public String getFullname(String username) throws Exception {
        String result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select fullname From Customer Where username = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            rs = preStm.executeQuery();
            if(rs.next()) {
                result = rs.getString("fullname");
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean update(CustomerDTO customer) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update Customer Set fullname = ?, phone = ?, email = ? Where username = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, customer.getFullname());
            preStm.setString(2, customer.getPhone());
            preStm.setString(3, customer.getEmail());
            preStm.setString(4, customer.getUsername());
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean insert(CustomerDTO customer) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Insert Into Customer(username, fullname, phone, email) Values(?,?,?,?)";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, customer.getUsername());
            preStm.setString(2, customer.getFullname());
            preStm.setString(3, customer.getPhone());
            preStm.setString(4, customer.getEmail());
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<CustomerDTO> searchByLikeName(String name) throws Exception {
        List<CustomerDTO> result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select username, fullname, phone, email From Customer Where fullname Like ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + name + "%");
            rs = preStm.executeQuery();
            String username, fullname, phone, email;
            CustomerDTO customer = null;
            result = new ArrayList<>();
            while(rs.next()) {
                username = rs.getString("username");
                fullname = rs.getString("fullname");
                phone = rs.getString("phone");
                email = rs.getString("email");
                customer = new CustomerDTO(username, fullname, email, phone);
                result.add(customer);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
