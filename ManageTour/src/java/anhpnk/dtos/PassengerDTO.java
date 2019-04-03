/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.dtos;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Kim Anh
 */
public class PassengerDTO implements Serializable {
    private String passengerID, orderID, fullname;
    private Date birthday;
    private String phone;
    private boolean isAdult, passenegerStatus;

    public PassengerDTO() {
    }

    public PassengerDTO(String fullname, Date birthday, String phone, boolean isAdult, boolean passenegerStatus) {
        this.fullname = fullname;
        this.birthday = birthday;
        this.phone = phone;
        this.isAdult = isAdult;
        this.passenegerStatus = passenegerStatus;
    }

    public PassengerDTO(String fullname, Date birthday, String phone, boolean isAdult) {
        this.fullname = fullname;
        this.birthday = birthday;
        this.phone = phone;
        this.isAdult = isAdult;
    }

    public PassengerDTO(String passengerID, String fullname, Date birthday, String phone, boolean isAdult) {
        this.passengerID = passengerID;
        this.fullname = fullname;
        this.birthday = birthday;
        this.phone = phone;
        this.isAdult = isAdult;
    }

    public PassengerDTO(String passengerID, String orderID, String fullname, Date birthday, String phone, boolean isAdult, boolean passenegerStatus) {
        this.passengerID = passengerID;
        this.orderID = orderID;
        this.fullname = fullname;
        this.birthday = birthday;
        this.phone = phone;
        this.isAdult = isAdult;
        this.passenegerStatus = passenegerStatus;
    }

    public String getPassengerID() {
        return passengerID;
    }

    public void setPassengerID(String passengerID) {
        this.passengerID = passengerID;
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

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isIsAdult() {
        return isAdult;
    }

    public void setIsAdult(boolean isAdult) {
        this.isAdult = isAdult;
    }

    public boolean isPassenegerStatus() {
        return passenegerStatus;
    }

    public void setPassenegerStatus(boolean passenegerStatus) {
        this.passenegerStatus = passenegerStatus;
    }

    @Override
    public String toString() {
        return passengerID + "-" + birthday + "-" + isAdult;
    }
    
    
}
