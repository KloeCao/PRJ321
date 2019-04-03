/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.daos;

import anhpnk.conn.MyConnection;
import anhpnk.dtos.StaffDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kim Anh
 */
public class StaffDAO implements Serializable {
    private Connection conn = null;
    private PreparedStatement preStm = null;
    private ResultSet rs = null;

    public StaffDAO() {
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
    
    public String getFullname(String username) throws Exception {
        String result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select fullname From Staff Where username = ?";
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
    
    public boolean update(StaffDTO staff) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update Staff Set fullname = ?, address = ?, phone = ?, birthday = ? Where username = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, staff.getFullname());
            preStm.setString(2, staff.getAddress());
            preStm.setString(3, staff.getPhone());
            preStm.setDate(4, staff.getBirthday());
            preStm.setString(5, staff.getUsername());
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public StaffDTO getStaffInformation(String username) throws Exception {
        StaffDTO result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select username, fullname, address, email, phone, birthday From Staff Where username = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            rs = preStm.executeQuery();
            String fullname, address, email, phone;
            Date birthday;
            if(rs.next()) {
                fullname = rs.getString("fullname");
                address = rs.getString("address");
                email = rs.getString("email");
                phone = rs.getString("phone");
                birthday = rs.getDate("birthday");
                result = new StaffDTO(username, fullname, phone, address, email, birthday);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<StaffDTO> searchByLikeName(String name) throws Exception {
        List<StaffDTO> result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select username, fullname, email, phone From Staff Where fullname Like ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + name + "%");
            rs = preStm.executeQuery();
            String username, fullname, email, phone;
            StaffDTO staff = null;
            result = new ArrayList<>();
            while(rs.next()) {
                username = rs.getString("username");
                fullname = rs.getString("fullname");
                email = rs.getString("email");
                phone = rs.getString("phone");
                staff = new StaffDTO(username, fullname, phone, email);
                result.add(staff);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean insert(StaffDTO staff) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Insert Into Staff(username, fullname, email, address, phone, birthday) Values(?,?,?,?,?,?)";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, staff.getUsername());
            preStm.setString(2, staff.getFullname());
            preStm.setString(3, staff.getEmail());
            preStm.setString(4, staff.getAddress());
            preStm.setString(5, staff.getPhone());
            preStm.setDate(6, staff.getBirthday());
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
}
