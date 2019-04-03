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
public class Tbl_watchDTO implements Serializable {

    String watchID, name, brandName, description;
    float price;
    int quantity, quantityBuy;

    public Tbl_watchDTO() {
    }

    public Tbl_watchDTO(String watchID, String name, String brandName, float price) {
        this.watchID = watchID;
        this.name = name;
        this.brandName = brandName;
        this.price = price;
    }

    public Tbl_watchDTO(String watchID, String name, String brandName, String description, float price, int quantity) {
        this.watchID = watchID;
        this.name = name;
        this.brandName = brandName;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
    }

    public String getWatchID() {
        return watchID;
    }

    public void setWatchID(String watchID) {
        this.watchID = watchID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantityBuy() {
        return quantityBuy;
    }

    public void setQuantityBuy(int quantityBuy) {
        this.quantityBuy = quantityBuy;
    }
    
}
