/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhpnk.dtos;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Kim Anh
 */
public class OrderDTO implements Serializable {
    private String orderID;
    private Timestamp dateCreate;
    private String username, payment, tourID;
    private int numOfAdult, numOfKid;
    private int orderStatus;
    private boolean isReturn;

    public OrderDTO(String orderID, Timestamp dateCreate, String username, String payment, String tourID, int numOfAdult, int numOfKid, int orderStatus) {
        this.orderID = orderID;
        this.dateCreate = dateCreate;
        this.username = username;
        this.payment = payment;
        this.tourID = tourID;
        this.numOfAdult = numOfAdult;
        this.numOfKid = numOfKid;
        this.orderStatus = orderStatus;
    }

    public OrderDTO(String orderID, Timestamp dateCreate, String username, String tourID) {
        this.orderID = orderID;
        this.dateCreate = dateCreate;
        this.username = username;
        this.tourID = tourID;
    }

    public OrderDTO(String orderID, Timestamp dateCreate, String tourID, int numOfAdult, int numOfKid, int orderStatus) {
        this.orderID = orderID;
        this.dateCreate = dateCreate;
        this.tourID = tourID;
        this.numOfAdult = numOfAdult;
        this.numOfKid = numOfKid;
        this.orderStatus = orderStatus;
    }

    public OrderDTO(String orderID, Timestamp dateCreate, String tourID, int orderStatus) {
        this.orderID = orderID;
        this.dateCreate = dateCreate;
        this.tourID = tourID;
        this.orderStatus = orderStatus;
    }

    public OrderDTO() {
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public Timestamp getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Timestamp dateCreate) {
        this.dateCreate = dateCreate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getTourID() {
        return tourID;
    }

    public void setTourID(String tourID) {
        this.tourID = tourID;
    }

    public int getNumOfAdult() {
        return numOfAdult;
    }

    public void setNumOfAdult(int numOfAdult) {
        this.numOfAdult = numOfAdult;
    }

    public int getNumOfKid() {
        return numOfKid;
    }

    public void setNumOfKid(int numOfKid) {
        this.numOfKid = numOfKid;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public boolean isIsReturn() {
        return isReturn;
    }

    public void setIsReturn(boolean isReturn) {
        this.isReturn = isReturn;
    }
    
    
}
