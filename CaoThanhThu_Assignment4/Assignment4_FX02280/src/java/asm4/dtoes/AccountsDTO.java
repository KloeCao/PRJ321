/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asm4.dtoes;

import java.io.Serializable;

/**
 *
 * @author CaoThu
 */
public class AccountsDTO implements Serializable{
    String username;
    String pwd;
    String name;
    String role;

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    

    public AccountsDTO(String name) {
        this.name = name;
    }

    public AccountsDTO() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
}
