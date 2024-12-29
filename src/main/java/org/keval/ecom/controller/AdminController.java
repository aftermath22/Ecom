package org.keval.ecom.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.keval.ecom.model.Blacklist;
import org.keval.ecom.model.Customer;
import org.keval.ecom.model.Items;
import org.keval.ecom.service.BlacklistService;
import org.keval.ecom.service.CustomerService;
import org.keval.ecom.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasRole('ADMIN')")
public class AdminController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private ItemService itemService;
    @Autowired
    private BlacklistService blacklistService;
    @Autowired
    private Items items;

    @GetMapping("/portal")
    public String adminPortal(Model model, Principal principal) {
        Customer admin=customerService.getCustomerByEmail(principal.getName());
        admin.setPassword(null);
        model.addAttribute("admin", admin);
        return "AdminPortal";
    }
    @PostMapping("/addItem")
    public ModelAndView addItems(@ModelAttribute Items it) {
        System.out.println("i got ... " + it.toString());
        itemService.addOrUpdateItem(it);
        return new ModelAndView("addItems");
    }
    @GetMapping("/add")
    public ModelAndView add() {
        return new ModelAndView("addItems");
    }
    @GetMapping("/users")
    public ModelAndView users(){
        ModelAndView mav = new ModelAndView("UserList");
        List<Customer> users=customerService.getAllCustomers();
        for(int i=0;i<users.size();i++){
            if(users.get(i).getRole().toString().equals("ROLE_ADMIN")){
                users.remove(i);
            }
            else users.get(i).setPassword(null);
        }
        mav.addObject("users", users);
        return mav;
    }
    @GetMapping("/ban")
    public String ban(HttpServletRequest request){
        String email=request.getParameter("email");
        System.out.println("want to remove usr with email: "+email);
        customerService.deleteCustomer(customerService.getCustomerByEmail(email).getCid());
        blacklistService.addBlack(new Blacklist(email));
        return "redirect:/admin/users";
    }
    @GetMapping("/unban")
    public String unban(HttpServletRequest request){
        String email=request.getParameter("email");
        blacklistService.deleteBlack(email);
        return "redirect:/admin/blacklist";
    }
    @GetMapping("/blacklist")
    public ModelAndView getBlacklist(){
        ModelAndView mav = new ModelAndView("Blacklist");
        mav.addObject("blacklist",blacklistService.getAllBlacks());
        return mav;
    }
    @GetMapping("/manage")
    public String manage(HttpSession session){
        session.setAttribute("items",itemService.getAllItems());
        return "ManageItems";
    }
    @GetMapping("/editItem")
    public String editItem(HttpServletRequest request,HttpSession session){
        Long id=Long.parseLong(request.getParameter("id"));
        session.setAttribute("id",id);
        session.setAttribute("item",itemService.getItemById(id));
        return "ItemEditor";
    }
    @PostMapping("/editIt")
    public String editIt(@ModelAttribute Items items,HttpSession session,HttpServletRequest req){
        Long id=(Long)(session.getAttribute("id"));
//        System.out.println("id: "+id);
        System.out.println("isAvailable: "+req.getParameter("isAvailable"));
        items.setAvailable(req.getParameter("isAvailable") != null);
        System.out.println("item: "+items.toString());
        items.setItemId(id);
        itemService.addOrUpdateItem(items);
        return "redirect:/admin/manage";
    }
    @GetMapping("/deleteItem")
    public String deleteItem(HttpServletRequest request){
        Long id=Long.parseLong(request.getParameter("id"));
        itemService.deleteItem(id);
        System.out.println("item removed successfully!");
        return "redirect:/admin/manage";
    }

    @GetMapping("/edit")
    public String editA(Principal principal,HttpSession session){
        Customer cust=customerService.getCustomerByEmail(principal.getName());
        session.setAttribute("admin",cust);
        return "EditAdmin";
    }
    @PostMapping("/edit")
    public String editAdmin(Principal principal, HttpServletRequest req){
        Customer cust=customerService.getCustomerByEmail(principal.getName());
        cust.setPassword(req.getParameter("pass"));
        cust.setName(req.getParameter("aname"));
        return "redirect:/admin/portal";
    }

}
