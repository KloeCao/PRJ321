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
public class StaffDTO implements Serializable {
    private String username, fullname, phone, address, email;
    private Date birthday;

    public StaffDTO(String username, String fullname, String phone, String address, String email, Date birthday) {
        this.username = username;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.birthday = birthday;
    }

    public StaffDTO(String username, String fullname, String phone, String email) {
        this.username = username;
        this.fullname = fullname;
        this.phone = phone;
        this.email = email;
    }

    public StaffDTO() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
    
}
