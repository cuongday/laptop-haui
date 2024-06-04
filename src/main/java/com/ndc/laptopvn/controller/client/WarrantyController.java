package com.ndc.laptopvn.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WarrantyController {
    @GetMapping("/warranty")
    public String getWarrantyPage(){
        return "client/policy/warranty";
    }

    @GetMapping("/img-warranty")
    public String getWarrantyImg() { return "webapp/resources/client/img"; }
}
