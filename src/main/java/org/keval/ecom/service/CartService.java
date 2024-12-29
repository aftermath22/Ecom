package org.keval.ecom.service;

import org.keval.ecom.model.Cart;
import org.keval.ecom.model.Items;
import org.keval.ecom.repo.CartRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {
    @Autowired
    private CartRepo repo;

    public List<Cart> getCustomerCart(Long cid) {
        return repo.findAllByCustomerId(cid);
    }
    public Cart getCustomerCartByItem(Long itemId){
        return repo.findByItemId(itemId);
    }
    public Cart saveOrUpdateCart(Cart cart){
        return repo.save(cart);
    }
    public void deleteCart(Cart cart){
        repo.delete(cart);
    }
    public Cart getCartByCustomerAndItem(Long cid, Long itemId){
        return repo.findByCustomerIdAndItemId(cid, itemId);
    }
}
