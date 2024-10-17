package com.society.controller;

import com.society.models.MaintenancePaidVo;
import com.society.services.MaintenancePaidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
@RestController
public class MaintenancePaidController {

    @Autowired
    private MaintenancePaidService maintenancePaidService;

    @GetMapping(value = "maintenancePaid/{ownerId}/{year}/{month}")
    public String maintenancePaid(@PathVariable("ownerId") int ownerId, @PathVariable("year") String year, @PathVariable("month") String month) {
        this.maintenancePaidService.maintenancePaid(ownerId, year, month);
        return "Success";
    }

    @GetMapping(value = "maintenanceUnpaid/{ownerId}/{year}/{month}")
    public String maintenanceUnpaid(@PathVariable("ownerId") int ownerId, @PathVariable("year") String year, @PathVariable("month") String month) {
        this.maintenancePaidService.maintenanceUnpaid(ownerId, year, month);
        return "Success";
    }

    @GetMapping(value = "getMaintenancePaidDetailsForOwner/{ownerId}/{maintenanceYear}")
    public List<MaintenancePaidVo> getMaintenancePaidDetailsForOwner(@PathVariable("ownerId") int ownerId, @PathVariable("maintenanceYear") String maintenanceYear) {
        List<MaintenancePaidVo> maintenancePaidOfOwnerList = this.maintenancePaidService.getMaintenancePaidDetailsForOwner(ownerId, maintenanceYear);
        return maintenancePaidOfOwnerList;
    }



}
