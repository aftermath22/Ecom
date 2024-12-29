package org.keval.ecom.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.keval.ecom.model.Cart;
import org.keval.ecom.model.Customer;
import org.keval.ecom.service.CartService;
import org.keval.ecom.service.CustomerService;
import org.keval.ecom.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasRole('USER')")
public class CustomerController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private CartService cartService;
    @Autowired
    private ItemService itemService;

    @GetMapping("portal")
    public String userPortal(Model model, Principal principal) {
        Customer cust=customerService.getCustomerByEmail(principal.getName());
        cust.setPassword(null);
        model.addAttribute("customer", cust);
        return "UserPortal";
    }

    @GetMapping("cart")
    public String userCart(Model model, Principal principal) {
        Customer cust=customerService.getCustomerByEmail(principal.getName());
        model.addAttribute("customer", cust);
        List<Cart> ucart=cartService.getCustomerCart(cust.getCid());
        System.out.println(ucart);
        model.addAttribute("cart", ucart);
        model.addAttribute("itemService", itemService);
        return "ViewCart";
    }


    @PostMapping("buyItem")
    public String buyItem(Model model, Principal principal, HttpServletRequest req) {
        if(principal==null) return "redirect:/login";
        Customer customer=customerService.getCustomerByEmail(principal.getName());
        if(customer.getRole().toString().equals("ADMIN")) {
            System.out.println("admin cannot buy stuff");
            return "redirect:/login";
        }
        long quantity=Integer.parseInt(req.getParameter("quantity"));
        long id=Integer.parseInt(req.getParameter("itId"));

        Cart c=cartService.getCartByCustomerAndItem(customer.getCid(),id);
        if(c==null){
            c=new Cart();
            c.setItemId(id); c.setCustomerId(customer.getCid());
            c.setItQuantity(quantity);
        }
        else c.setItQuantity(c.getItQuantity()+quantity);
        cartService.saveOrUpdateCart(c);
        return "redirect:/items";
    }

    @PostMapping("adds")
    public String useradds(Model model, Principal principal,HttpServletRequest req) {
        Customer cust=customerService.getCustomerByEmail(principal.getName());
        int adds=Integer.parseInt(req.getParameter("adds"));
        long itid=Integer.parseInt(req.getParameter("itid"));
        Cart cart=cartService.getCartByCustomerAndItem(cust.getCid(),itid);
        cart.setItQuantity(cart.getItQuantity()+adds);
        cartService.saveOrUpdateCart(cart);
        return "redirect:/user/cart";
    }

    @PostMapping("remove")
    public String userRemoves(Model model, Principal principal,HttpServletRequest req) {
        Customer cust=customerService.getCustomerByEmail(principal.getName());
        int rems=Integer.parseInt(req.getParameter("rems"));
        long itid=Integer.parseInt(req.getParameter("itid"));
        Cart cart=cartService.getCartByCustomerAndItem(cust.getCid(),itid);
        if(cart.getItQuantity()==rems) cartService.deleteCart(cart);
        else{
            cart.setItQuantity(cart.getItQuantity()-rems);
            cartService.saveOrUpdateCart(cart);
        }
        return "redirect:/user/cart";
    }

    @GetMapping("/edit")
    public String userEdit(Principal principal,HttpSession sess) {
        Customer cust=customerService.getCustomerByEmail(principal.getName());
        sess.setAttribute("customer", cust);
        return "EditUser";
    }

    @PostMapping("/edit")
    public String editU(Principal principal, HttpServletRequest req) {
        Customer cust=customerService.getCustomerByEmail(principal.getName());
        String uname=req.getParameter("uname");
        String upass=req.getParameter("pass");
        cust.setPassword(upass);
        cust.setName(uname);
        customerService.save(cust);
        return "redirect:/user/portal";
    }

}
