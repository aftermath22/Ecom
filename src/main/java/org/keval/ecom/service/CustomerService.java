package org.keval.ecom.service;

import org.keval.ecom.model.Customer;
import org.keval.ecom.repo.CustomerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService {
    @Autowired
    private CustomerRepo repo;
    private BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();

    public List<Customer> getAllCustomers() {
        return repo.findAll();
    }
    public Customer getCustomerById(Long id) {
        return repo.findById(id).orElse(null);
    }
    public Customer save(Customer customer) {
        System.out.println("before: "+customer.getPassword());
        customer.setPassword(encoder.encode(customer.getPassword()));
        System.out.println("after: "+customer.getPassword());
        return repo.save(customer);
    }
    public void deleteCustomer(Long id) {
        repo.deleteById(id);
    }
    public Customer getCustomerByEmail(String email) {
        return repo.findByEmail(email).orElse(null);
    }
    public void deleteCustomerByEmail(String email) {
        repo.deleteByEmail(email);
    }
}
