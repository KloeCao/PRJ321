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
import java.util.ArrayList;
import thang.db.DBUtils;
import thang.dtoes.Tbl_orderDetailDTO;

/**
 *
 * @author User
 */
public class Tbl_orderDetailDAO implements Serializable {

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

    public boolean insertDetails(ArrayList<Tbl_orderDetailDTO> dto) throws SQLException {
        boolean insert = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                conn.setAutoCommit(false);
                String sql = "INSERT INTO tbl_orderDetail(id, productID, quantity, unitPrice, total, orderID) "
                        + "VALUES(?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                for (int i = 0; i < dto.size(); i++) {
                    stm.setInt(1, dto.get(i).getId());
                    stm.setString(2, dto.get(i).getProductID());
                    stm.setInt(3, dto.get(i).getQuantity());
                    stm.setFloat(4, dto.get(i).getUnitPrice());
                    stm.setFloat(5, dto.get(i).getTotal());
                    stm.setString(6, dto.get(i).getOrderID());

                    stm.addBatch();
                }
                stm.executeBatch();
                conn.commit();
                insert = true;
            }
        } catch (SQLException e) {
            conn.rollback();
            insert = false;
        } finally {
            closeConnection();
        }
        return insert;
    }

    public int countDetail() throws SQLException {
        int count = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(id) as Detail FROM tbl_orderDetail";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt("Detail");
                }
            }
        } finally {
            closeConnection();
        }
        return count;
    }
}
