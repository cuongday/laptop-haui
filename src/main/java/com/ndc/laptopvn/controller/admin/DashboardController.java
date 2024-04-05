package com.ndc.laptopvn.controller.admin;

import com.ndc.laptopvn.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {
    private final UserService userService;

    public DashboardController(UserService userService) {
        this.userService = userService;
    }
    @GetMapping("/admin")
    public String getDashboard(Model model) {
        model.addAttribute("countUsers",this.userService.countUsers());
        model.addAttribute("countOrders",this.userService.countOrders());
        model.addAttribute("countProducts",this.userService.countProducts());
        return "admin/dashboard/show";
    }
}