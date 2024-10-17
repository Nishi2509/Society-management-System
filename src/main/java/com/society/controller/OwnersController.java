package com.society.controller;

import com.society.models.BlockVo;
import com.society.models.LoginVo;
import com.society.models.MemberVo;
import com.society.models.OwnerVo;
import com.society.services.BlockService;
import com.society.services.LoginService;
import com.society.services.MemberService;
import com.society.services.OwnerService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Controller
@RestController
public class OwnersController {

    @Autowired
    private BlockService blockService;

    @Autowired
    private OwnerService ownerService;

    @Autowired
    private LoginService loginService;

    @Autowired
    private MemberService memberService;


    @GetMapping(value = "admin/owners")
    public ModelAndView manageOwners() {
        List<BlockVo> blockList = this.blockService.searchBlock();
        return new ModelAndView("admin/manageOwners").addObject("blockList", blockList);
    }

    @RequestMapping(value = "/searchForFloor/{id}", method = RequestMethod.GET)
    public BlockVo searchForFloor(@PathVariable("id") int id) {
        List<BlockVo> blockList = this.blockService.searchBlock();
        BlockVo blockVo = this.blockService.findById(id);
        return blockVo;
    }

    @PostMapping(value = "admin/ownerName")
    public ModelAndView addOwner(@RequestParam int blockId, @RequestParam int floorNumber, HttpServletRequest request) {

        String[] houseNumbers = request.getParameterValues("ownerHouse");
        String[] ownerName = request.getParameterValues("ownerName");
        String[] ownerId = request.getParameterValues("ownerId");
        String[] ownerEmail = request.getParameterValues("ownerEmail");

        this.ownerService.insertOwners(houseNumbers, ownerName, ownerId, ownerEmail, blockId, floorNumber);

        return new ModelAndView("redirect:owners");
    }

    @RequestMapping(value = "/searchOwners/{floorNumber}/{blockName}", method = RequestMethod.GET)
    public List<OwnerVo> searchOwner(@PathVariable("floorNumber") int floorNumber,
                                     @PathVariable("blockName") int blockName) {
        List<OwnerVo> list = this.ownerService.findOwner(blockName, floorNumber);
        return list;
    }

    @RequestMapping(value = "/findOwner/{ownerId}", method = RequestMethod.GET)
    public OwnerVo findOwner(@PathVariable("ownerId") int ownerId) {

        return this.ownerService.findOwneById(ownerId);
    }

    @RequestMapping(value = "/updateOwner", method = RequestMethod.PUT)
    public String updateOwner(@RequestBody OwnerVo ownerVo) {
        LoginVo loginVo = this.ownerService.findOwneById(ownerVo.getId()).getLoginVo();
//        System.out.println(loginVo.getUsername());
        System.out.println(this.ownerService.findOwneById(ownerVo.getId()).getLoginVo().getId()+">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        loginVo.setUsername(ownerVo.getOwnerEmail())
        ;
        this.loginService.insertLogin(loginVo);
        ownerVo.setLoginVo(loginVo);
        this.ownerService.insertOwner(ownerVo);
        return "Owner Updated";
    }

    @RequestMapping(value = "getMemberDetails/{ownerId}", method = RequestMethod.GET)
    public ArrayList<MemberVo> getMemberForAdmin(@PathVariable("ownerId") int ownerId) {

        return (ArrayList<MemberVo>) this.memberService.findMemberByOwnerId(ownerId);
    }

    @PostMapping(value = "getOwnerEmailList")
    public List<String> getOwnerEmailList(@RequestBody List<String> emailList) {
        return this.ownerService.getOwnerEmailList(emailList);
    }

}
