package com.society.controller;

import com.society.services.MaintenanceChargesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RestController
public class MaintenanceChargesController {

    @Autowired
    private MaintenanceChargesService maintenanceChargesService;

    @GetMapping(value = "/addMaintenanceCharges/{id}/{type}/{amount}")
    public String addMaintenanceCharges(@PathVariable("id") int id,@PathVariable("type") String type,@PathVariable("amount") String amount) {
        this.maintenanceChargesService.addMaintenanceCharges(id,type,amount);
        return "Success";
    }
}
