package org.keval.ecom.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.keval.ecom.model.Cart;
import org.keval.ecom.model.Customer;
import org.keval.ecom.model.Items;
import org.keval.ecom.service.CartService;
import org.keval.ecom.service.CustomerService;
import org.keval.ecom.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;

@Controller
public class ItemController {

    @Autowired
    private ItemService itemService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private CartService cartService;

    @GetMapping("/items")
    public String items(HttpSession session) {
        session.setAttribute("items",itemService.getAllItems());
        return "ViewItems";
    }


}
