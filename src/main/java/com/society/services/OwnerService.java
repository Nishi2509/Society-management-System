package com.society.services;

import java.util.ArrayList;
import java.util.List;

import com.society.models.OwnerVo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

public interface OwnerService {

    void insertOwners(String[] houseNumbers, String[] ownerName, String[] ownerId, String[] ownerEmail, int blockId, int floorNumber);

    List<OwnerVo> findOwner(int blockId, int floorNo);

    OwnerVo findOwneById(int ownerId);

    void insertOwner(OwnerVo ownerVo);

    OwnerVo getCurrentOwner();

    List<OwnerVo> getAllOwners();

    List<String> getOwnerEmailList(List<String> emailList);

    void editOwnerProfile(HttpServletRequest request, MultipartFile ownerImage);

    List<OwnerVo> getAllOwnersOfBlock(int blockId);
}
