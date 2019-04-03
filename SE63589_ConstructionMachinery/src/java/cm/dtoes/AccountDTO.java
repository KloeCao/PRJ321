/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cm.dtoes;

import java.io.Serializable;

/**
 *
 * @author CaoThu
 */
public class AccountDTO implements Serializable {

    private String accountID;
    private String password;
    private String accountName;
    private String numberPhone;
    private String address;
    private int role;

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public AccountDTO() {
    }

    public AccountDTO(int role) {
//        this.accountID = accountID;
//        this.password = password;
        this.role = role;
    }

    public AccountDTO(String accountID, String password, String accountName, String numberPhone, String address, int role) {
        this.accountID = accountID;
        this.password = password;
        this.accountName = accountName;
        this.numberPhone = numberPhone;
        this.address = address;
        this.role = role;
    }
}
