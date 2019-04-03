/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.daos;

import anhpnk.conn.MyConnection;
import anhpnk.dtos.TourGuideDTO;
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
public class TourGuideDAO {
    private Connection conn = null;
    private PreparedStatement preStm = null;
    private ResultSet rs = null;

    public TourGuideDAO() {
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
    
    public List<String> getAllTourGuide() throws Exception {
        List<String> result = null;
        try {
            conn = MyConnection.getMyConnection();
            
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public String getFullname(String tourGudeID) throws Exception {
        String result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select fullname From TourGuide Where tourGuideID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, tourGudeID);
            rs = preStm.executeQuery();
            if(rs.next()) {
                result = rs.getString("fullname");
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean update(TourGuideDTO tourguide) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update TourGuide Set fullname = ?, address = ?, phone = ?, birthday = ? Where tourGuideID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, tourguide.getFullname());
            preStm.setString(2, tourguide.getAddress());
            preStm.setString(3, tourguide.getPhone());
            preStm.setDate(4, tourguide.getBirthday());
            preStm.setString(5, tourguide.getTourGuideID());
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public TourGuideDTO getTourguideInformation(String tourguideID) throws Exception {
        TourGuideDTO result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select fullname, address, phone, email, birthday From TourGuide Where tourGuideID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, tourguideID);
            rs = preStm.executeQuery();
            String fullname, address, phone, email;
            Date birthday;
            if(rs.next()) {
                fullname = rs.getString("fullname");
                address = rs.getString("address");
                phone = rs.getString("phone");
                email = rs.getString("email");
                birthday = rs.getDate("birthday");
                result = new TourGuideDTO(tourguideID, fullname, address, phone, email, birthday);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<TourGuideDTO> searchByLikeName(String name) throws Exception {
        List<TourGuideDTO> result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select tourguideID, fullname, email, phone From TourGuide Where fullname Like ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + name + "%");
            rs = preStm.executeQuery();
            String username, fullname, email, phone;
            TourGuideDTO tourguide = null;
            result = new ArrayList<>();
            while(rs.next()) {
                username = rs.getString("tourguideID");
                fullname = rs.getString("fullname");
                email = rs.getString("email");
                phone = rs.getString("phone");
                tourguide = new TourGuideDTO();
                tourguide.setTourGuideID(username);
                tourguide.setFullname(fullname);
                tourguide.setEmail(email);
                tourguide.setPhone(phone);
                result.add(tourguide);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean insert(TourGuideDTO tourguide) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Insert Into TourGuide(tourguideID, fullname, email, address, phone, birthday) Values(?,?,?,?,?)";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, tourguide.getTourGuideID());
            preStm.setString(2, tourguide.getFullname());
            preStm.setString(3, tourguide.getEmail());
            preStm.setString(4, tourguide.getAddress());
            preStm.setString(5, tourguide.getPhone());
            preStm.setDate(6, tourguide.getBirthday());
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
}
