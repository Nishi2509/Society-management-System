package com.society.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.society.models.MemberVo;
import com.society.services.MemberService;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RestController
public class MembersController {

    @Autowired
    private MemberService memberService;

    @GetMapping(value = "user/members")
    public ModelAndView manageOwners() {
        List<MemberVo> memberList = this.memberService.searchMembers();
        // System.out.println(memberList.get(0).getMemberEmail());
        return new ModelAndView("user/members").addObject("memberList", memberList);
    }

    @PostMapping(value = "user/saveMembers")
    public ModelAndView saveMembers(@RequestParam List<MultipartFile> memberFile, HttpServletRequest request) {

        String[] memberNames = request.getParameterValues("memberName");
        String[] memberPhoneNumber = request.getParameterValues("memberPhone");
        String[] memberEmailAddress = request.getParameterValues("memberEmail");
        this.memberService.addMembers(0, memberNames, memberPhoneNumber, memberEmailAddress, memberFile, request);
        return new ModelAndView("redirect:members");
    }

    @RequestMapping(value = "user/getMembersById/{memberId}", method = RequestMethod.GET)
    public MemberVo searchMemberById(@PathVariable("memberId") int memberId) {
        return this.memberService.findMemberById(memberId);
    }

    // public MemberVo searchMember

    @GetMapping(value = "user/deleteMember/{id}")
    public ModelAndView deleteMember(@PathVariable("id") int id) {
        this.memberService.deleteMember(id);
        return new ModelAndView("redirect:/user/members");
    }

    @PostMapping(value = "user/updateMember")
    public ModelAndView updateMember(HttpServletRequest request, MultipartFile memberFile) {
        this.memberService.updateMember(request, memberFile);
        return new ModelAndView("redirect:/user/members");
    }

    @RequestMapping(value = "user/checkForDuplicateMail", method = RequestMethod.GET)
    public Map getAllMembersMails(@RequestParam String email) {
        return this.memberService.checkForMemberDuplicateMail(email);
    }

}
