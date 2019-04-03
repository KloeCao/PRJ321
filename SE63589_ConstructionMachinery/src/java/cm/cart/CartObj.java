package cm.cart;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author CaoThu
 */
public class CartObj implements Serializable {

    private Map<String, Integer> items;

    public Map<String, Integer> getItems() {
        return items;
    }

    public void setItems(Map<String, Integer> items) {
        this.items = items;
    }

    public void addItemToCart(String machineID) {
        if (items == null) {
            items = new HashMap<>();
        }
        int quantity = 1;
        if (this.items.containsKey(machineID)) {
            quantity = this.items.get(machineID) + 1;
        }
        this.items.put(machineID, quantity);
    }

    public void removeItemFromCart(String title) {
        if (this.items == null) {
            return;
        }
        if (this.items.containsKey(title)) {
            this.items.remove(title);
            if (this.items.isEmpty()) {   //obj tồn tại mà ko có phần tử => null
                this.items = null;
            }
        }
    }
}
