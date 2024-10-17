package com.society.controller;


import com.society.models.BlockVo;
import com.society.services.BlockService;
import com.society.services.DashboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
@RestController
public class DashboardController {

    @Autowired
    private DashboardService dashboardService;

    @Autowired
    private BlockService blockService;

    @GetMapping(value = "/getPaidAndUnpaidOwners/{year}/{month}/{blockId}")
    public HashMap getPaidAndUnpaidOwners(@PathVariable("year") String year, @PathVariable("month") String month, @PathVariable("blockId") int blockId) {
        return this.dashboardService.getPaidAndUnpaidOwners(year, month, blockId);
    }

    @GetMapping(value = "/getBlockDetails")
    public List<BlockVo> getBlockDetails() {
        return this.blockService.searchBlock();
    }

    @GetMapping(value = "/getDasBlockDetails/{blockId}")
    public HashMap getDasBlockDetails(@PathVariable("blockId") int blockId) {
        return this.dashboardService.getDasBlockDetails(blockId);
    }

    @GetMapping(value = "/getDasDetails")
    public HashMap getDasDetails() {
        return this.dashboardService.getDasDetails();
    }

    @GetMapping(value = "/userDasDetails")
    public HashMap userDasDetails() {
        return this.dashboardService.getUserDasDetails();
    }

}
