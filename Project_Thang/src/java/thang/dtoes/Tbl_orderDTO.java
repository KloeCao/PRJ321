/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thang.dtoes;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author User
 */
public class Tbl_orderDTO implements Serializable {

    String orderID, custID, addressDelivery;
    Timestamp orderDate;
    float total;
    int isDeliver;

    public Tbl_orderDTO(String orderID, String custID, String addressDelivery, Timestamp orderDate, float total, int isDeliver) {
        this.orderID = orderID;
        this.custID = custID;
        this.addressDelivery = addressDelivery;
        this.orderDate = orderDate;
        this.total = total;
        this.isDeliver = isDeliver;
    }

    public Tbl_orderDTO() {
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getCustID() {
        return custID;
    }

    public void setCustID(String custID) {
        this.custID = custID;
    }

    public String getAddressDelivery() {
        return addressDelivery;
    }

    public void setAddressDelivery(String addressDelivery) {
        this.addressDelivery = addressDelivery;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public int getIsDeliver() {
        return isDeliver;
    }

    public void setIsDeliver(int isDeliver) {
        this.isDeliver = isDeliver;
    }

}
