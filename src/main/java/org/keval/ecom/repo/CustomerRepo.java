package org.keval.ecom.repo;

import org.keval.ecom.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CustomerRepo extends JpaRepository<Customer, Long> {
    public Optional<Customer> findByEmail(String email);
    public Optional<Customer> findByEmailAndPassword(String email, String password);
    public void deleteByEmail(String email);
}
