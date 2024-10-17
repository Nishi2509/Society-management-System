package com.society.services;

import com.society.models.CircularVo;
import com.society.models.LoginVo;
import com.society.models.MemberVo;
import com.society.models.OwnerVo;
import com.society.repository.MemberDao;
import com.society.repository.MemberDaoImp;
import com.society.utils.BaseMethods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.*;

@Service
@Transactional
public class MemberServiceImp implements MemberService {

    @Autowired
    private MemberDao memberDao;

    @Autowired
    private LoginService loginService;

    @Autowired
    private OwnerService ownerService;

    @Override
    public void addMembers(int ownerId, String[] memberName, String[] memberPhoneNo, String[] memberEmail,
            List<MultipartFile> files, HttpServletRequest request) {

        LoginVo loginVo = this.loginService.getCurrentUser();
        OwnerVo ownerVo = this.ownerService.getCurrentOwner();

        for (int index = 0; index < memberName.length; index++) {

            String fileName = files.get(0).getOriginalFilename() + "_" + ownerId + "_" + index;
            String filePath = request.getSession().getServletContext().getRealPath("/") + "//documents//memberPhotos//";

            try {

                byte barr[] = files.get(index).getBytes();
                BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(
                        new FileOutputStream(filePath + fileName));
                bufferedOutputStream.write(barr);
                bufferedOutputStream.flush();
                bufferedOutputStream.close();

            } catch (Exception e) {
                e.printStackTrace();
            }

            MemberVo memberVo = new MemberVo();
            memberVo.setMemberName(memberName[index]);
            memberVo.setMemberEmail(memberEmail[index]);
            memberVo.setMemberPhoneNo(memberPhoneNo[index]);
            memberVo.setFileName(fileName);
            memberVo.setLoginVo(loginVo);
            memberVo.setOwnerVo(ownerVo);
            this.memberDao.insertMember(memberVo);
        }
    }

    @Override
    public List<MemberVo> findMembers(int loginId) {
        List<MemberVo> list = this.memberDao.findMembersByLoginId(loginId);
        return list;
    }

    @Override
    public MemberVo findMemberById(int id) {
        MemberVo memberVo = this.memberDao.findMemberById(id).get(0);
        return memberVo;
    }

    @Override
    public ArrayList<MemberVo> findMemberByOwnerId(int ownerId) {

        return this.memberDao.getMemberByOwnerId(ownerId);
    }

    @Override
    public void deleteMember(int id) {
        this.memberDao.deleteMember(id);
    }

    @Override
    public List<MemberVo> searchMembers() {
        int loginId = this.loginService.getCurrentUser().getId();
        List<MemberVo> memberList = this.memberDao.findMembersByLoginId(loginId);
        return memberList;
    }

    @Override
    public void updateMember(HttpServletRequest request, MultipartFile memberFile) {
        MemberVo memberVo = this.findMemberById(Integer.parseInt(request.getParameter("memberId")));
        memberVo.setId(Integer.parseInt(request.getParameter("memberId")));
        memberVo.setMemberName(request.getParameter("memberName"));
        memberVo.setMemberEmail(request.getParameter("memberEmail"));
        memberVo.setMemberPhoneNo(request.getParameter("memberPhone"));
        String fileName = memberFile.getOriginalFilename();

        if (!fileName.equals("")) {
            try {
                // Deleting Old File
                MemberVo oldMemberObj = this.findMemberById(memberVo.getId());
                String filePath = request.getSession().getServletContext().getRealPath("/")
                        + "//documents//memberPhotos//" + oldMemberObj.getFileName();
                File file = new File(filePath);
                file.delete();
            } catch (Exception e) {
                System.out.println("Member Image Was Not updated!!");
            }
            try {
                // Saving new File
                String filePath = request.getSession().getServletContext().getRealPath("/")
                        + "//documents//memberPhotos//";
                memberVo.setFileName(fileName);
                try {
                    byte barr[] = memberFile.getBytes();
                    BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(
                            new FileOutputStream(filePath + fileName));
                    bufferedOutputStream.write(barr);
                    bufferedOutputStream.flush();
                    bufferedOutputStream.close();

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } catch (Exception e) {
                System.out.println("Circular File was not changed !!!!!!!!!!!!!!!!!!!!");
            }
        }
        this.memberDao.insertMember(memberVo);
    }

    @Override
    public List<MemberVo> getAllMembers() {
        return this.memberDao.getAllMembers();
    }

    @Override
    public List<String> getAllMembersMails() {
        List<MemberVo> list = this.getAllMembers();
        List<String> memberMails = new ArrayList<>();
        for (MemberVo memberVo : list) {
            memberMails.add(memberVo.getMemberEmail());
        }
        return memberMails;
    }

    @Override
    public Map checkForMemberDuplicateMail(String email) {
        Map map = new HashMap<>();
        map.put("email", email);
        List<MemberVo> list = this.memberDao.getMemberByEmail(email);
        System.out.println(list.toString());
        if (list.isEmpty()) {
            map.put("availablity", true);
        } else {
            map.put("availablity", false);
        }
        return map;
    }

}
