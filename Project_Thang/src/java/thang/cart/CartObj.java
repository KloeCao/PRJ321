package thang.cart;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import thang.dtoes.Tbl_watchDTO;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author User
 */
public class CartObj implements Serializable {

    private Map<String, Tbl_watchDTO> items;

    public CartObj() {
        items = new HashMap<>();
    }

    public Map<String, Tbl_watchDTO> getItems() {
        return items;
    }

    public void setItems(Map<String, Tbl_watchDTO> items) {
        this.items = items;
    }

    public void addItemToCart(Tbl_watchDTO dto) {
        if (items == null) {
            items = new HashMap<>();
        }
//        dto.setQuantityBuy(1);
        if (this.items.containsKey(dto.getWatchID())) {
            int quantity = this.items.get(dto.getWatchID()).getQuantityBuy() + 1;
            dto.setQuantityBuy(quantity);
        }
        this.items.put(dto.getWatchID(), dto);
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

    public float getTotal() throws Exception {
        float result = 0;
        for (Tbl_watchDTO dto : this.items.values()) {
            result += dto.getQuantityBuy() * dto.getPrice();
        }
        return result;
    }

    public void update(String id, int quantity) throws Exception {
        if (this.items.containsKey(id)) {
            this.items.get(id).setQuantityBuy(quantity);
        }
    }
    
    public String toString() {
        return  "";
    }
}
