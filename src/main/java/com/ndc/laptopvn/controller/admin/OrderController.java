package com.ndc.laptopvn.controller.admin;

import com.ndc.laptopvn.domain.Order;
import com.ndc.laptopvn.service.OrderService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }
    @GetMapping("/admin/order")
    public String getDashboard(Model model,
                               @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            } else {

            }
        } catch (NumberFormatException e) {

        }
        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<Order> orders = this.orderService.fetchOrders(pageable);
        List<Order> orderList = orders.getContent();
        model.addAttribute("orders", orderList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", orders.getTotalPages());
        return "admin/order/show";
    }

    @GetMapping("/admin/order/{id}")
    public String getOrderDetail(Model model, @PathVariable("id") long id) {
        Order order = this.orderService.fetchOrderById(id).get();
        model.addAttribute("order", order);
        model.addAttribute("orderDetails", order.getOrderDetails());
        model.addAttribute("id", id);
        return "admin/order/detail";
    }

    @GetMapping("/admin/order/update/{id}")
    public String getOrderUpdatePage(Model model, @PathVariable("id") long id) {
        Order order = this.orderService.fetchOrderById(id).get();
        model.addAttribute("newOrder", order);
        model.addAttribute("orderDetail", order.getOrderDetails());
        model.addAttribute("id", id);
        return "admin/order/update";
    }

    @PostMapping("/admin/order/update")
    public String updateOrder(Model model, @ModelAttribute("newOrder") Order order){
        this.orderService.updateOrder(order);
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/delete/{id}")
    public String getDeleteOrderPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newOrder", new Order());
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/delete")
    public String postDeleteOrder(@ModelAttribute("newOrder") Order order) {
        this.orderService.deleteOrderById(order.getId());
        return "redirect:/admin/order";
    }

    @GetMapping("/api/statistics/sales")
    public ResponseEntity<List<Map<String, Object>>> getSalesStatistics(
            @RequestParam("startDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam("endDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        List<Map<String, Object>> statistics = orderService.getSalesStatistics(startDate, endDate);
        return ResponseEntity.ok(statistics);
    }

    @GetMapping("/api/statistics/sales-by-factory")
    public ResponseEntity<List<Map<String, Object>>> getSalesStatisticsByFactory(
            @RequestParam("startDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam("endDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        List<Map<String, Object>> statistics = orderService.getSalesStatisticsByFactory(startDate, endDate);
        return ResponseEntity.ok(statistics);
    }
}

