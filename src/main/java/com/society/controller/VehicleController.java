package com.society.controller;

import com.society.models.VehicleVo;
import com.society.services.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RestController
public class VehicleController {

    @Autowired
    private VehicleService vehicleService;

    @GetMapping(value = "user/vehicles")
    public ModelAndView vehicles() {
        return new ModelAndView("user/vehicles");
    }

    @GetMapping(value = "user/getCurrentOwnerVehicles")
    public List<VehicleVo> getCurrentUserVehicle() {
        List<VehicleVo> list = this.vehicleService.getCurrentUserVehicle();
        return list;
    }

    @GetMapping(value = "user/deleteVehicleByUser/{id}")
    public ModelAndView deleteVehicle(@PathVariable("id") int id) {
        this.vehicleService.deleteVehicle(id);
        return new ModelAndView("redirect:/user/vehicles");
    }

    @GetMapping(value = "user/getVehicle/{id}")
    public VehicleVo getVehicle(@PathVariable("id") int id) {
        return this.vehicleService.getVehicleById(id);
    }

    @PostMapping(value = "user/saveVehicle")
    public ModelAndView saveVehicles(HttpServletRequest request, MultipartFile vehicleImageFile) {
        System.out.println(request.getParameter("vehicleId"));
        if (request.getParameter("vehicleId").equals("")) {
            this.vehicleService.saveVehicle(request, vehicleImageFile);
        } else {
            this.vehicleService.updateVehicle(request, vehicleImageFile);
        }
        return new ModelAndView("redirect:/user/vehicles");
    }

    @GetMapping(value = "admin/getVehicleDetails/{ownerId}")
    public List<VehicleVo> getVehicleDetails(@PathVariable("ownerId") int ownerId) {
        List<VehicleVo> list = this.vehicleService.getVehicleByOwnerId(ownerId);
        return list;
    }

    @PostMapping(value = "admin/allocateParking")
    public  void allocateParkingSpace(@RequestBody ArrayList<VehicleVo> listOfVehicle)
    {
        this.vehicleService.allocateParking(listOfVehicle);
    }


}
