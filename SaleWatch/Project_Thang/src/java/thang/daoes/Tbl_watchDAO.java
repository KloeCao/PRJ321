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
import java.util.List;
import thang.db.DBUtils;
import thang.dtoes.Tbl_watchDTO;

/**
 *
 * @author User
 */
public class Tbl_watchDAO implements Serializable {

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

    public List<Tbl_watchDTO> findByPrice(float minPrice, float maxPrice) throws SQLException {
        List<Tbl_watchDTO> listPrice = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * "
                        + "FROM tbl_watch "
                        + "WHERE price BETWEEN ? AND ?";
                stm = conn.prepareStatement(sql);
                stm.setFloat(1, minPrice);
                stm.setFloat(2, maxPrice);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("watchID");
                    String name = rs.getString("name");
                    String brandName = rs.getString("brandName");
                    int quantity = rs.getInt("quantity");
                    float price = rs.getFloat("price");
                    String description = rs.getString("description");
                    listPrice.add(new Tbl_watchDTO(id, name, brandName, description, price, quantity));
                }
            }
        } finally {
            closeConnection();
        }
        return listPrice;
    }
    public Tbl_watchDTO getProduct(String watchID) throws SQLException {
        Tbl_watchDTO product = new Tbl_watchDTO();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * "
                        + "FROM Tbl_watch "
                        + "WHERE watchID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, watchID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    watchID = rs.getString("watchID");
                    String name = rs.getString("name");
                    String brandName  = rs.getString("brandName");
                    int price = rs.getInt("price");
                    product = new Tbl_watchDTO(watchID, name, brandName, price);
                }
            }
        } finally {
            closeConnection();
        }
        return product;
    }
    
}
