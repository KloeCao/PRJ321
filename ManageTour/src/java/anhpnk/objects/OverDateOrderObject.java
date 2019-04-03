/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.objects;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Kim Anh
 */
public class OverDateOrderObject implements Serializable {
    private String orderID, fullname, journey;
    Timestamp dateCreate;

    public OverDateOrderObject() {
    }

    public OverDateOrderObject(String orderID, String fullname, String jounrney, Timestamp dateCreate) {
        this.orderID = orderID;
        this.fullname = fullname;
        this.journey = jounrney;
        this.dateCreate = dateCreate;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getJourney() {
        return journey;
    }

    public void setJourney(String jounrney) {
        this.journey = jounrney;
    }

    public Timestamp getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Timestamp dateCreate) {
        this.dateCreate = dateCreate;
    }
    
}
