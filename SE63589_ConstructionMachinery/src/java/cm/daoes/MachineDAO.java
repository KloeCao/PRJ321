/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cm.daoes;

import cm.dtoes.MachineDTO;
import cm.utils.DBUtils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CaoThu
 */
public class MachineDAO implements Serializable {

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

    private MachineDTO dto = new MachineDTO();

    public MachineDTO getDto() {
        return dto;
    }

    //Show all Machinery items: short description and picture only && sort by published date
    //unavailable = false
    public List<MachineDTO> showAllMachine(boolean unavailable) throws SQLException {
        List<MachineDTO> listAllMachine = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT machineName, machineID, picture, description "
                        + "FROM tblMachine "
                        + "WHERE unavailable =? "
                        + "ORDER BY date";
                stm = conn.prepareStatement(sql);
                stm.setBoolean(1, unavailable);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String machineID = rs.getString("machineID");
                    String picture = rs.getString("picture");
                    String description = rs.getString("description");
                    String machineName = rs.getString("machineName");
                    MachineDTO dto = new MachineDTO(machineID, picture, description);
                    dto.setMachineName(machineName);
                    listAllMachine.add(dto);
                }
            }
        } finally {
            closeConnection();
        }
        return listAllMachine;
    }

    //Search on showAll Page: by Name: unavailable = false
    public List<MachineDTO> searchMachineByName(String searchMachineName, boolean unavailable)
            throws SQLException {
        List<MachineDTO> searchAllbyName = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT machineID, machineName, picture, description, price "
                        + "FROM tblMachine "
                        + "WHERE machineName LIKE ? AND unavailable=? "
                        + "ORDER BY date";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + searchMachineName + "%");
                stm.setBoolean(2, unavailable);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String machineID = rs.getString("machineID");
                    String machineName = rs.getString("machineName");
                    String picture = rs.getString("picture");
                    String description = rs.getString("description");
                    int price = rs.getInt("price");

                    searchAllbyName.add(new MachineDTO(machineID, machineName, picture, description, price));
                }
            }
        } finally {
            closeConnection();
        }
        return searchAllbyName;
    }

    //Search on showAll Page: by Price: unavailable = false
    public List<MachineDTO> searchMachineByPrice(float minPrice, float maxPrice, boolean unavailable) throws SQLException {
        List<MachineDTO> searchAllbyPrice = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT machineID, machineName, picture, description, price "
                        + "FROM tblMachine "
                        + "WHERE (price BETWEEN ? AND ?) AND unavailable=? "
                        + "ORDER BY date";
                stm = conn.prepareStatement(sql);
                stm.setFloat(1, minPrice);
                stm.setFloat(2, maxPrice);
                stm.setBoolean(3, unavailable);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String machineID = rs.getString("machineID");
                    String machineName = rs.getString("machineName");
                    String picture = rs.getString("picture");
                    String description = rs.getString("description");
                    int price = rs.getInt("price");
                    searchAllbyPrice.add(new MachineDTO(machineID, machineName, picture, description, price));
                }
            }
        } finally {
            closeConnection();
        }
        return searchAllbyPrice;
    }

    // Show Machinery for Sale: detail of all items: sale = true & unavailable = false
    public List<MachineDTO> showSale(boolean sale, boolean unavailable) throws SQLException {
        List<MachineDTO> listSaleMachine = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT machineID, machineName, picture, description, price "
                        + "FROM tblMachine "
                        + "WHERE sale=? AND unavailable=?";
                stm = conn.prepareStatement(sql);
                stm.setBoolean(1, sale);
                stm.setBoolean(2, unavailable);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String machineID = rs.getString("machineID");
                    String machineName = rs.getString("machineName");
                    String picture = rs.getString("picture");
                    String description = rs.getString("description");
                    int price = rs.getInt("price");
                    listSaleMachine.add(new MachineDTO(machineID, machineName, picture, description, price));
                }
            }
        } finally {
            closeConnection();
        }
        return listSaleMachine;
    }

    //Search on saleMachine Page: by Name: sale = true & unavailable = false
    public List<MachineDTO> searchSaleByName(String searchMachineName, boolean sale, boolean unavailable) throws SQLException {
        List<MachineDTO> searchAllbyName = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT machineID, machineName, picture, description, price "
                        + "FROM tblMachine "
                        + "WHERE machineName LIKE ? "
                        + "AND sale=? AND unavailable=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + searchMachineName + "%");
                stm.setBoolean(2, sale);
                stm.setBoolean(3, unavailable);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String machineID = rs.getString("machineID");
                    String machineName = rs.getString("machineName");
                    String picture = rs.getString("picture");
                    String description = rs.getString("description");
                    int price = rs.getInt("price");
                    searchAllbyName.add(new MachineDTO(machineID, machineName, picture, description, price));
                }
            }
        } finally {
            closeConnection();
        }
        return searchAllbyName;
    }

    //Search on saleMachine Page: by Price: sale = true & unavailable = false
    public List<MachineDTO> searchSaleByPrice(float minPrice, float maxPrice, boolean sale, boolean unavailable) throws SQLException {
        List<MachineDTO> searchAllbyPrice = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT machineID, machineName, picture, description, price "
                        + "FROM tblMachine "
                        + "WHERE (price BETWEEN ? AND ?) "
                        + "AND sale =? AND unavailable = ?";
                stm = conn.prepareStatement(sql);
                stm.setFloat(1, minPrice);
                stm.setFloat(2, maxPrice);
                stm.setBoolean(3, sale);
                stm.setBoolean(4, unavailable);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String machineID = rs.getString("machineID");
                    String machineName = rs.getString("machineName");
                    String picture = rs.getString("picture");
                    String description = rs.getString("description");
                    int price = rs.getInt("price");
                    searchAllbyPrice.add(new MachineDTO(machineID, machineName, picture, description, price));
                }
            }
        } finally {
            closeConnection();
        }
        return searchAllbyPrice;
    }

    //Manage Administrator: show detail: all
    public List<MachineDTO> manageProduct() throws SQLException {
        List<MachineDTO> listAllMachine = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT machineID, machineName, picture, description, price, sale, date, unavailable "
                        + "FROM tblMachine ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String machineID = rs.getString("machineID");
                    String machineName = rs.getString("machineName");
                    String picture = rs.getString("picture");
                    String description = rs.getString("description");
                    int price = rs.getInt("price");
                    boolean sale = rs.getBoolean("sale");
                    Date date = rs.getDate("date");
                    boolean unavailable = rs.getBoolean("unavailable");

                    listAllMachine.add(new MachineDTO(machineID, machineName, picture, description, price, sale, date, unavailable));
                }
            }
        } finally {
            closeConnection();
        }
        return listAllMachine;
    }

    public List<MachineDTO> searchManageProduct(String searchMachineName) throws SQLException {
        List<MachineDTO> searchListName = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT machineID, machineName, picture, description, price, sale, date, unavailable "
                        + "FROM tblMachine "
                        + "WHERE machineName LIKE ? OR machineID LIKE ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + searchMachineName + "%");
                stm.setString(2, "%" + searchMachineName + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String machineID = rs.getString("machineID");
                    String machineName = rs.getString("machineName");
                    String picture = rs.getString("picture");
                    String description = rs.getString("description");
                    int price = rs.getInt("price");
                    boolean sale = rs.getBoolean("sale");
                    Date date = rs.getDate("date");
                    boolean unavailable = rs.getBoolean("unavailable");
                    searchListName.add(new MachineDTO(machineID, machineName, picture, description, price, sale, date, unavailable));
                }
            }
        } finally {
            closeConnection();
        }
        return searchListName;
    }

    //Admin control panel: update items
    public boolean updateMachine(String machineID, String machineName, String description, int price, boolean sale, boolean unavailable) throws SQLException {
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblMachine "
                        + "SET machineName=?, description=?, price=?, sale =?, unavailable=? "
                        + "WHERE machineID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, machineName);
                stm.setString(2, description);
                stm.setInt(3, price);
                stm.setBoolean(4, sale);
                stm.setBoolean(5, unavailable);
                stm.setString(6, machineID);
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

    public MachineDTO getMachine(String machineID) throws SQLException {
        MachineDTO machine = new MachineDTO();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT machineID, machineName, picture, description, price, sale, date, unavailable "
                        + "FROM tblMachine "
                        + "WHERE machineID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, machineID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String machID = rs.getString("machineID");
                    String machineName = rs.getString("machineName");
                    String picture = rs.getString("picture");
                    String description = rs.getString("description");
                    int price = rs.getInt("price");
                    boolean sale = rs.getBoolean("sale");
                    Date date = rs.getDate("date");
                    boolean unavailable = rs.getBoolean("unavailable");
                    machine = new MachineDTO(machID, machineName, picture, description, price, sale, date, unavailable);
                }
            }
        } finally {
            closeConnection();
        }
        return machine;
    }

    //Admin control panel: insert items
    public boolean insertMachine(String machineID, String machineName, String picture, String description, int price, boolean sale, Date date, boolean unavailable) throws SQLException {
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblMachine(machineID, machineName, picture, description, price, sale, date, unavailable) "
                        + "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, machineID);
                stm.setString(2, machineName);
                stm.setString(3, picture);
                stm.setString(4, description);
                stm.setInt(5, price);
                stm.setBoolean(6, sale);
                stm.setDate(7, date);
                stm.setBoolean(8, unavailable);
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

    public String getPicture(String machineID) throws SQLException {
        String picture = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT picture "
                        + "FROM tblMachine "
                        + "WHERE machineID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, machineID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    picture = rs.getString("picture");
                }
            }
        } finally {
            closeConnection();
        }
        return picture;
    }
}
