/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cm.dtoes;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author CaoThu
 */
public class MachineDTO implements Serializable {

    private String machineID;
    private String machineName;
    private String picture;
    private String description;
    private int price;
    private boolean sale;
    private Date date;
    private boolean unavailable;

    public boolean isUnavailable() {
        return unavailable;
    }

    public void setUnavailable(boolean unavailable) {
        this.unavailable = unavailable;
    }

    public String getMachineID() {
        return machineID;
    }

    public void setMachineID(String machineID) {
        this.machineID = machineID;
    }

    public String getMachineName() {
        return machineName;
    }

    public void setMachineName(String machineName) {
        this.machineName = machineName;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public boolean isSale() {
        return sale;
    }

    public void setSale(boolean sale) {
        this.sale = sale;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public MachineDTO(String machineID, String picture, String description) {
        this.machineID = machineID;
        this.picture = picture;
        this.description = description;
    }

    public MachineDTO() {
    }

    public MachineDTO(String machineID, String machineName, String picture, String description, int price) {
        this.machineID = machineID;
        this.machineName = machineName;
        this.picture = picture;
        this.description = description;
        this.price = price;
    }

    public MachineDTO(String machineID, String machineName, String picture, String description, int price, boolean sale, Date date, boolean unavailable) {
        this.machineID = machineID;
        this.machineName = machineName;
        this.picture = picture;
        this.description = description;
        this.price = price;
        this.sale = sale;
        this.date = date;
        this.unavailable = unavailable;
    }

}
