/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asm4.error;

import java.io.Serializable;

/**
 *
 * @author CaoThu
 */
public class AccountError implements Serializable {

    String userError;
    String pwdError;
    String userPwdWrong;
    String haveTrouble;
    String confirmError;
    String userExited;
    String nameError;

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }
    
    

    public String getHaveTrouble() {
        return haveTrouble;
    }

    public void setHaveTrouble(String haveTrouble) {
        this.haveTrouble = haveTrouble;
    }

    public String getUserPwdWrong() {
        return userPwdWrong;
    }

    public void setUserPwdWrong(String userPwdWrong) {
        this.userPwdWrong = userPwdWrong;
    }

    public String getPwdError() {
        return pwdError;
    }

    public void setPwdError(String pwdError) {
        this.pwdError = pwdError;
    }

    public String getUserError() {
        return userError;
    }

    public void setUserError(String userError) {
        this.userError = userError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

    public String getUserExited() {
        return userExited;
    }

    public void setUserExited(String userExited) {
        this.userExited = userExited;
    }
    
}
