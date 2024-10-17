package com.society.controller;


import com.society.models.MaintenancePaidVo;
import com.society.models.MemberVo;
import com.society.models.VehicleVo;
import com.society.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

@Controller
@RestController
public class UserProfileController {

    @Autowired
    private OwnerService ownerService;

    @Autowired
    private SocietyService societyService;

    @Autowired
    private MemberService memberService;

    @Autowired
    private VehicleService vehicleService;

    @Autowired
    private MaintenancePaidService maintenancePaidService;

    @RequestMapping(value = "user/profile",method = RequestMethod.GET)
    public ModelAndView profile() {
        return new ModelAndView("user/userProfile");
    }

    @RequestMapping(value = "getOwnerDetails", method = RequestMethod.GET)
    public HashMap getOwnerDetails() {
        HashMap map = new HashMap();
        map.put("ownerDetails",this.ownerService.getCurrentOwner());
        map.put("societyDetails",this.societyService.search());
        map.put("memberDetails",this.memberService.findMemberByOwnerId(this.ownerService.getCurrentOwner().getId()));
        return map;
    }

    @RequestMapping(value = "getMemberInfo", method = RequestMethod.GET)
    public List<MemberVo> getMemberInfo() {
        return this.memberService.findMemberByOwnerId(this.ownerService.getCurrentOwner().getId());
    }

    @RequestMapping(value = "getVehicleInfo", method = RequestMethod.GET)
    public List<VehicleVo> getVehicleInfo() {
        return this.vehicleService.getVehicleByOwnerId(this.ownerService.getCurrentOwner().getId());
    }

    @RequestMapping(value = "getMaintenanceInfo", method = RequestMethod.GET)
    public List<MaintenancePaidVo> getMaintenanceInfo() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy");
        LocalDateTime now = LocalDateTime.now();
        return this.maintenancePaidService.getMaintenancePaidDetailsForOwner(this.ownerService.getCurrentOwner().getId(),dtf.format(now));
    }

    @RequestMapping(value = "/user/editOwnerProfile",method = RequestMethod.POST)
    public ModelAndView editOwnerProfile(HttpServletRequest request, MultipartFile ownerImage) {
        this.ownerService.editOwnerProfile(request,ownerImage);
        return new ModelAndView("redirect:/user/profile");
    }

}
