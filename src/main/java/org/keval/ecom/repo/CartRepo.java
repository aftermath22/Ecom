package org.keval.ecom.repo;

import org.keval.ecom.model.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartRepo extends JpaRepository<Cart, Long> {
    public List<Cart> findAllByCustomerId(Long customerId);
    public Cart findByItemId(Long itemId);
    public Cart findByCustomerIdAndItemId(Long customerId, Long itemId);
}
