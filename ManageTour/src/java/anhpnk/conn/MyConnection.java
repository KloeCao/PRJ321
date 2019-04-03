/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.conn;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Kim Anh
 */
public class MyConnection implements Serializable {
    public static Connection getMyConnection() throws Exception {
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1456;database=TourManagement";
        conn = DriverManager.getConnection(url, "sa", "11031998");
        return conn;
    }
}
