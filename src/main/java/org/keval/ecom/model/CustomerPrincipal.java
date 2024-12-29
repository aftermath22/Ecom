package org.keval.ecom.model;

import org.keval.ecom.repo.CustomerRepo;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class CustomerPrincipal implements UserDetailsService {

    private CustomerRepo repo;
    public CustomerPrincipal(CustomerRepo repo) {
        this.repo = repo;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Customer u=repo.findByEmail(email).orElseThrow(()->new UsernameNotFoundException("customer with email "+email+" not found"));
        System.out.println(u.toString()+"\n"+u.getRole().toString());
        System.out.println("here at principal");
        return new User(
                u.getEmail(),
                u.getPassword(),
                List.of(new SimpleGrantedAuthority(u.getRole().toString()))
        );
    }
}
