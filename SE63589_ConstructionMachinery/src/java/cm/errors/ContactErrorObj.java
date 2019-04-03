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
public class ContactErrorObj implements Serializable {

    private String errName;
    private String errMail;
    private String errFb;

    public ContactErrorObj() {
    }

    public ContactErrorObj(String errName, String errMail, String errFb) {
        this.errName = errName;
        this.errMail = errMail;
        this.errFb = errFb;
    }

    public String getErrName() {
        return errName;
    }

    public void setErrName(String errName) {
        this.errName = errName;
    }

    public String getErrMail() {
        return errMail;
    }

    public void setErrMail(String errMail) {
        this.errMail = errMail;
    }

    public String getErrFb() {
        return errFb;
    }

    public void setErrFb(String errFb) {
        this.errFb = errFb;
    }

}
