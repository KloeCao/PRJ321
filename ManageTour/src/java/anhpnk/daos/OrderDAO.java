/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.daos;

import anhpnk.conn.MyConnection;
import anhpnk.dtos.OrderDTO;
import anhpnk.objects.OverDateOrderObject;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kim Anh
 */
public class OrderDAO implements Serializable {
    private Connection conn = null;
    private PreparedStatement preStm = null;
    private ResultSet rs = null;

    public OrderDAO() {
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
    
    public boolean insert(OrderDTO order) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Insert Into dbo.[Order](orderID, dateCreate, username, payment,tourID, numOfAdult, numOfKid, orderStatus, isReturn) Values(?,?,?,?,?,?,?,?,?)";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, order.getOrderID());
            preStm.setTimestamp(2, order.getDateCreate());
            preStm.setString(3, order.getUsername());
            preStm.setString(4, order.getPayment());
            preStm.setString(5, order.getTourID());
            preStm.setInt(6, order.getNumOfAdult());
            preStm.setInt(7, order.getNumOfKid());
            preStm.setInt(8, order.getOrderStatus());
            preStm.setBoolean(9, order.isIsReturn());
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public int countOrderByTour(String tourID) throws Exception {
        int result = 0;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select Count(orderID) as numOfOrder From dbo.[Order] Where tourID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, tourID);
            rs = preStm.executeQuery();
            if(rs.next()) {
                result = rs.getInt("numOfOrder");
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<OrderDTO> getOrdersByUsername(String username) throws Exception {
        List<OrderDTO> result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select orderID, dateCreate, tourID, orderStatus From dbo.[Order] Where username = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            rs = preStm.executeQuery();
            String orderID, tourID;
            Timestamp dateCreate;
            int orderStatus;
            OrderDTO order = null;
            result = new ArrayList<>();
            while(rs.next()) {
                orderID = rs.getString("orderID");
                dateCreate = rs.getTimestamp("dateCreate");
                tourID = rs.getString("tourID");
                orderStatus = rs.getInt("orderStatus");
                order = new OrderDTO(orderID, dateCreate, tourID, orderStatus);
                result.add(order);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public OrderDTO getOrderDetails(String orderID) throws Exception {
        OrderDTO result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select orderID, dateCreate, tourID, numOfAdult, numOfKid, orderStatus From dbo.[Order] Where orderID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, orderID);
            rs = preStm.executeQuery();
            Timestamp dateCreate = null;
            String tourID;
            int numOfAdult, numOfKid, orderStatus;
            
            if(rs.next()) {
                dateCreate = rs.getTimestamp("dateCreate");
                tourID = rs.getString("tourID");
                numOfAdult = rs.getInt("numOfAdult");
                numOfKid = rs.getInt("numOfKid");
                orderStatus = rs.getInt("orderStatus");
                result = new OrderDTO(orderID, dateCreate, tourID, numOfAdult, numOfKid, orderStatus);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean updateOrderStatus(String orderID, int orderStt) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update dbo.[Order] Set orderStatus = ? Where orderID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, orderStt);
            preStm.setString(2, orderID);
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public Timestamp getCreateDate(String orderID) throws Exception {
        Timestamp result = null;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Select dateCreate From dbo.[Order] Where orderID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, orderID);
            rs = preStm.executeQuery();
            if(rs.next()) {
                result = rs.getTimestamp("dateCreate");
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean returnMoney(String orderID) throws Exception {
        boolean result = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "Update dbo.[Order] Set isReturn = 1 Where orderID = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, orderID);
            result = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<OverDateOrderObject> getOverdateOrder() throws Exception {
        List<OverDateOrderObject> result = null;
        try {
            conn = MyConnection.getMyConnection();
            long date = System.currentTimeMillis();
            Timestamp now = new Timestamp(date);
            String sql = "Select O.orderID, O.dateCreate, C.fullname, T.journey, DATEDIFF(HH, dateCreate, ?) as TimeOver "
                    + "From [Order] O "
                    + "Inner Join Customer C On O.username = C.username "
                    + "Inner Join Tour T On T.tourID = O.tourID "
                    + "Where orderStatus = 0 and DATEDIFF(HH, dateCreate, ?) > 1";
            preStm = conn.prepareStatement(sql);
            preStm.setTimestamp(1, now);
            preStm.setTimestamp(2, now);
            rs = preStm.executeQuery();
            String orderID, fullname, journey;
            Timestamp dateCreate;
            OverDateOrderObject order = null;
            result = new ArrayList<>();
            while(rs.next()) {
                orderID = rs.getString("orderID");
                dateCreate = rs.getTimestamp("dateCreate");
                fullname = rs.getString("fullname");
                journey = rs.getString("journey");
                order = new OverDateOrderObject(orderID, fullname, journey, dateCreate);
                result.add(order);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
