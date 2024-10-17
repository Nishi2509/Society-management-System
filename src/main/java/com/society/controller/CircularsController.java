package com.society.controller;

import com.society.models.CircularVo;
import com.society.services.CircularService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RestController
public class CircularsController {

    @Autowired
    private CircularService circularService;

    @GetMapping(value = "admin/circulars")
    public ModelAndView viewCircularForAdmin() {
        List<CircularVo> list=this.circularService.viewCircularsAdmin();
        return new ModelAndView("admin/manageCirculars","circularList",list).addObject("circularVo",new CircularVo());
    }

    @GetMapping(value = "admin/getCircular/{id}")
    public CircularVo viewCircularForAdmin(@PathVariable("id") int id) {
        return this.circularService.getCircularById(id);
       }

    @GetMapping(value = "user/circulars")
    public ModelAndView viewCircularForUser() {
        List<CircularVo> list=this.circularService.viewCircularsUser();
        return new ModelAndView("user/circulars","circularList",list);
    }

    @GetMapping(value = "admin/deleteCircular/{id}")
    public ModelAndView deleteCircular(@PathVariable("id") int id) {
        this.circularService.deleteCircular(id);
        return new ModelAndView("redirect:/admin/circulars");
    }
    @PostMapping(value = "admin/saveCircular")
    public ModelAndView saveCircular(@ModelAttribute CircularVo circularVo,MultipartFile circularAttachment, HttpServletRequest request) {
        this.circularService.saveCircular(circularVo,circularAttachment,request);
        return new ModelAndView("redirect:/admin/circulars");
    }
}