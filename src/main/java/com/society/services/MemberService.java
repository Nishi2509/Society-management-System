package com.society.services;

import com.society.models.MemberVo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MemberService {

    void addMembers(int ownerId, String[] memberName, String[] memberEmail, String[] memberPhoneNo,
            List<MultipartFile> memberFile, HttpServletRequest request);

    List<MemberVo> findMembers(int loginId);

    MemberVo findMemberById(int id);

    ArrayList<MemberVo> findMemberByOwnerId(int ownerId);

    void deleteMember(int id);

    List<MemberVo> searchMembers();

    void updateMember(HttpServletRequest request, MultipartFile memberFile);

    List<MemberVo> getAllMembers();

    List<String> getAllMembersMails();

    Map checkForMemberDuplicateMail(String email);
}
