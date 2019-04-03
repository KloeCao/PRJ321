/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.daos;

import anhpnk.conn.MyConnection;
import anhpnk.dtos.PassengerDTO;
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
public class PassengerDAO implements Serializable {
    private Connection conn = null;
    private PreparedStatement preStm = null;
    private ResultSet rs = null;

    public PassengerDAO() {
        
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
    
    public int getNumOfPasseneger(String tourID) throws Exception {
        int result = 0;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "select count(passengerID) as numOfPassenger from Passenger where orderID in (select orderID from dbo.[Order] where tourID = ? and (orderStatus = 0 or orderStatus =1))";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, tourID);
            rs = preStm.executeQuery();
            if(rs.next()) {
                result = rs.getInt("numOfPassenger");
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean insertPassenger(PassengerDTO passenger) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Insert Into Passenger(passengerID, orderID, fullname, birthday, phone, isAdult, passengerStatus) Values(?,?,?,?,?,?,?)";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, passenger.getPassengerID());
            preStm.setString(2, passenger.getOrderID());
            preStm.setString(3, passenger.getFullname());
            preStm.setDate(4, passenger.getBirthday());
            preStm.setString(5, passenger.getPhone());
            preStm.setBoolean(6, passenger.isIsAdult());
            preStm.setBoolean(7, false);
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<PassengerDTO> getPassengerOfOrder(String orderID) throws Exception {
        List<PassengerDTO> result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select fullname, birthday, phone, isAdult From Passenger Where orderID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, orderID);
            rs = preStm.executeQuery();
            String fullname, phone;
            Date birthday;
            boolean isAdult;
            PassengerDTO passenger = null;
            result = new ArrayList<>();
            while(rs.next()) {
                fullname = rs.getString("fullname");
                phone = rs.getString("phone");
                birthday = rs.getDate("birthday");
                isAdult = rs.getBoolean("isAdult");
                passenger = new PassengerDTO(fullname, birthday, phone, isAdult);
                result.add(passenger);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<PassengerDTO> getPassengerOfTour(String tourID) throws Exception {
        List<PassengerDTO> result = null;
        
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select passengerID, fullname, phone, birthday, isAdult "
                    + "From dbo.[Order] O "
                    + "Inner Join Tour T On O.tourID = T.tourID "
                    + "Inner Join Passenger P On O.orderID = P.orderID "
                    + "Where T.tourID = ? And P.passengerStatus = 1";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, tourID);
            rs = preStm.executeQuery();
            String passengerID, fullname, phone;
            Date birthday;
            boolean isAdult;
            PassengerDTO passenger = null;
            result = new ArrayList<>();
            while(rs.next()) {
                passengerID = rs.getString("passengerID");
                fullname = rs.getString("fullname");
                phone = rs.getString("phone");
                birthday = rs.getDate("birthday");
                isAdult = rs.getBoolean("isAdult");
                passenger = new PassengerDTO(passengerID, fullname, birthday, phone, isAdult);
                result.add(passenger);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean updatePassengerStatus(boolean status, String orderID) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update Passenger Set passengerStatus = ? Where orderID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setBoolean(1, status);
            preStm.setString(2, orderID);
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
}
