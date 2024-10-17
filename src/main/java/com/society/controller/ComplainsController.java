package com.society.controller;

import java.util.List;

import com.society.models.ComplainVo;
import com.society.services.ComplainService;
import com.society.services.OwnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;


@Controller
@RestController
public class ComplainsController {

    @Autowired
    private ComplainService complainService;

    @Autowired
    private OwnerService ownerService;

    @GetMapping(value = "user/complain")
    public ModelAndView complain() {
        try {
            List<ComplainVo> list = this.complainService.searchComplain(this.ownerService.getCurrentOwner().getId());
            return new ModelAndView("user/complains", "complainList", list);
        } catch (Exception e) {
            System.out.println("No Complains were found for user!");
            return new ModelAndView("user/complains");
        }
    }

    @GetMapping(value = "admin/complains")
    public ModelAndView complains() {
        try {
            List<ComplainVo> list = this.complainService.searchAllComplains();
            return new ModelAndView("admin/manageComplain", "complainList", list);
        } catch (Exception e) {
            System.out.println("No Complains were found for user!");
            return new ModelAndView("admin/manageComplain");
        }
    }

    @PostMapping(value = "user/saveComplain")
    public ModelAndView saveComplain(HttpServletRequest request, MultipartFile complainAttachments) {
        this.complainService.saveComplain(request,complainAttachments);
        return new ModelAndView("redirect:/user/complain");
    }

    @GetMapping(value = "user/getComplainInfo/{id}")
    public ComplainVo getComplain(@PathVariable("id") int id) {
        return this.complainService.getComplain(id);
    }

    @GetMapping(value = "admin/getComplainInfoForAdmin/{id}")
    public ComplainVo getComplainAdmin(@PathVariable("id") int id) {
        return this.complainService.getComplain(id);
    }

    @GetMapping(value = "user/deleteComplain/{id}")
    public ModelAndView deleteComplain(@PathVariable("id") int id) {
        this.complainService.deleteComplain(id);
        return new ModelAndView("redirect:/user/complain");
    }

    @GetMapping(value = "admin/deleteComplainByAdmin/{id}")
    public ModelAndView deleteComplainByAdmin(@PathVariable("id") int id) {
        this.complainService.deleteComplain(id);
        return new ModelAndView("redirect:/admin/complains");
    }

    @PostMapping(value = "admin/saveReply")
    public ModelAndView saveReply(HttpServletRequest request) {
        this.complainService.saveReply(Integer.parseInt(request.getParameter("complainId")),request.getParameter("complainReply"));
        return new ModelAndView("redirect:/admin/complains");
    }

    @GetMapping(value = "admin/getUnreadComplain")
    public int getUnreadComplain() {
        return this.complainService.getUnreadComplain();
    }
}

