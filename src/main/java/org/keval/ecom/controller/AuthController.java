package org.keval.ecom.controller;

import jakarta.servlet.http.HttpSession;
import org.keval.ecom.config.SecurityConfig;
import org.keval.ecom.model.Customer;
import org.keval.ecom.model.Role;
import org.keval.ecom.service.BlacklistService;
import org.keval.ecom.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private BlacklistService blacklistService;

    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/auth")
    public ModelAndView authenticate(@RequestParam String email, @RequestParam String password, HttpSession session) {
        System.out.println("Attempting to authenticate user: " + email);
        try {
            Authentication auth = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(email, password)
            );

            // Manually set the SecurityContext
            SecurityContext securityContext = SecurityContextHolder.createEmptyContext();
            securityContext.setAuthentication(auth);
            SecurityContextHolder.setContext(securityContext);

            // Store SecurityContext in the session
            session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, securityContext);

            System.out.println("Session ID: " + session.getId());
            System.out.println("Authenticated user: " + auth.getName());
            System.out.println("Authorities: " + auth.getAuthorities());

            Customer customer = customerService.getCustomerByEmail(email);
            if (customer.getRole().toString().equals("ROLE_ADMIN")) {
                return new ModelAndView("redirect:/admin/portal");
            } else {
                return new ModelAndView("redirect:/user/portal");
            }
        } catch (Exception e) {
            System.out.println("Authentication failed: " + e.getMessage());
            return new ModelAndView("login", "error", "Invalid credentials");
        }
    }





    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("customer");
        session.invalidate();
        return "home";
    }

    @PostMapping("/register")
    public String register(@RequestParam String username,@RequestParam String email,@RequestParam String password) {
        if(blacklistService.getBlackById(email)!=null) return "redirect:/register";
        Customer customer=new Customer();
        customer.setName(username); customer.setEmail(email); customer.setPassword(password);
        customer.setRole(Role.ROLE_USER);
        customerService.save(customer);
        return "login";
    }

    @GetMapping("/register")
    public String registerpage(){
        return "register";
    }

    @GetMapping("/error")
    public String showError(HttpSession session) {
        session.invalidate();
        return "error";
    }

}
