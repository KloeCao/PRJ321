/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thang.dtoes;

import java.io.Serializable;

/**
 *
 * @author User
 */
public class Tbl_orderDetailDTO implements Serializable {

    int id, quantity;
    String productID, orderID;
    float unitPrice, total;

    public Tbl_orderDetailDTO() {
    }

    public Tbl_orderDetailDTO(int id, int quantity, String productID, String orderID, float unitPrice, float total) {
        this.id = id;
        this.quantity = quantity;
        this.productID = productID;
        this.orderID = orderID;
        this.unitPrice = unitPrice;
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

}
