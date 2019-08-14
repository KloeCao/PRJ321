/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asm4.connect;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author CaoThu
 */
public class DBUtils implements Serializable {

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/asm4", "root", "123456");
        } catch (Exception e) {
            System.out.println("Can't connect");
        }
        return conn;
    }
}
