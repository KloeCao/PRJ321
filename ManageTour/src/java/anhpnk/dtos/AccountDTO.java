/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.dtos;

import java.io.Serializable;

/**
 *
 * @author Kim Anh
 */
public class AccountDTO implements Serializable {
    private String username, password, role;
    private boolean status;

    public AccountDTO(String username, String password, String role, boolean status) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.status = status;
    }

    public AccountDTO() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
}
