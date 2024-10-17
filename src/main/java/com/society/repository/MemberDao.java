package com.society.repository;

import com.society.models.MemberVo;

import java.util.ArrayList;
import java.util.List;

public interface MemberDao {

    void insertMember(MemberVo memberVo);

    List<MemberVo> findMembersByLoginId(int loginId);

    void deleteMember(int id);

    List<MemberVo> findMemberById(int id);

    ArrayList<MemberVo> getAllMembers();

    ArrayList<MemberVo> getMemberByOwnerId(int ownerId);

    List<MemberVo> getMemberByEmail(String email);
}
