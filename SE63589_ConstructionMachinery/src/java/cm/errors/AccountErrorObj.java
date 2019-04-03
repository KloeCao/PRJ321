/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cm.errors;

import java.io.Serializable;

/**
 *
 * @author CaoThu
 */
public class AccountErrorObj implements Serializable {

    private String errAccID;
    private String errAccIDExist;
    private String errAccName;
    private String errPassword;
    private String errConfirm;
    private String errPhone;
    private String errAddress;
    private String errRole;

    public String getErrRole() {
        return errRole;
    }

    public void setErrRole(String errRole) {
        this.errRole = errRole;
    }

    public String getErrAccID() {
        return errAccID;
    }

    public void setErrAccID(String errAccID) {
        this.errAccID = errAccID;
    }

    public String getErrAccIDExist() {
        return errAccIDExist;
    }

    public void setErrAccIDExist(String errAccIDExist) {
        this.errAccIDExist = errAccIDExist;
    }

    public String getErrAccName() {
        return errAccName;
    }

    public void setErrAccName(String errAccName) {
        this.errAccName = errAccName;
    }

    public String getErrPassword() {
        return errPassword;
    }

    public void setErrPassword(String errPassword) {
        this.errPassword = errPassword;
    }

    public String getErrConfirm() {
        return errConfirm;
    }

    public void setErrConfirm(String errConfirm) {
        this.errConfirm = errConfirm;
    }

    public String getErrPhone() {
        return errPhone;
    }

    public void setErrPhone(String errPhone) {
        this.errPhone = errPhone;
    }

    public String getErrAddress() {
        return errAddress;
    }

    public void setErrAddress(String errAddress) {
        this.errAddress = errAddress;
    }

}
