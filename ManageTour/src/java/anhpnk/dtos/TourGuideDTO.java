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
public class TourGuideDTO implements Serializable {
    private String tourGuideID, fullname, address, phone, email;
    private Date birthday;

    public TourGuideDTO() {
    }

    public TourGuideDTO(String tourGuideID, String fullname, String address, String phone) {
        this.tourGuideID = tourGuideID;
        this.fullname = fullname;
        this.address = address;
        this.phone = phone;
    }

    public TourGuideDTO(String tourGuideID, String fullname, String address, String phone, String email, Date birthday) {
        this.tourGuideID = tourGuideID;
        this.fullname = fullname;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getTourGuideID() {
        return tourGuideID;
    }

    public void setTourGuideID(String tourGuideID) {
        this.tourGuideID = tourGuideID;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
}
