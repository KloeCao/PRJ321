/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cm.daoes;

import cm.utils.DBUtils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author CaoThu
 */
public class ContactDAO implements Serializable {

    Connection conn;
    PreparedStatement stm;

    private void closeConnection() throws SQLException {
        if (stm != null) {
            stm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    // Help user to submit their request, feedback to webmaster
    public boolean insertContact(String name, String mail, String feedback) throws SQLException {
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblContact(name, mail, request)"
                        + "VALUES(?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, name);
                stm.setString(2, mail);
                stm.setString(3, feedback);
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
