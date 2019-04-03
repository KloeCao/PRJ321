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
import thang.dtoes.Tbl_orderDTO;

/**
 *
 * @author User
 */
public class Tbl_orderDAO implements Serializable {

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

    public boolean insertOrder(Tbl_orderDTO dto) throws SQLException {
        boolean insert = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tbl_order(orderID, orderDate, custID, total, addressDelivery, isDeliver) "
                        + "VALUES (?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, dto.getOrderID());
                stm.setTimestamp(2, dto.getOrderDate());
                stm.setString(3, dto.getCustID());
                stm.setFloat(4, dto.getTotal());
                stm.setString(5, dto.getAddressDelivery());
                stm.setInt(6, dto.getIsDeliver());
                int result = stm.executeUpdate();
                if (result > 0) {
                    insert = true;
                }
            }
        } finally {
            closeConnection();
        }
        return insert;
    }

    public int countOrder() throws SQLException {
        int count = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(orderID) as OrderCounter FROM tbl_order";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt("OrderCounter");
                }
            }
        } finally {
            closeConnection();
        }
        return count;
    }
}
