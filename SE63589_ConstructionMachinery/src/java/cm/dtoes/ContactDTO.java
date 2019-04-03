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
public class ContactDTO implements Serializable {

    private String name;
    private String mail;
    private String request;

    public ContactDTO() {
    }

    public ContactDTO(String name, String mail, String request) {
        this.name = name;
        this.mail = mail;
        this.request = request;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getRequest() {
        return request;
    }

    public void setRequest(String request) {
        this.request = request;
    }

}
