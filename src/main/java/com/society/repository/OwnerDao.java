package com.society.repository;

import java.security.acl.Owner;
import java.util.List;

import com.society.models.OwnerVo;

public interface OwnerDao {

    void insertOwner(OwnerVo ownerVo);

    List<OwnerVo> findOwner(int blockId, int floorNo);

    public List<OwnerVo> findOwneById(int ownerId);

    List<OwnerVo> searchByUsername(String username);

    List<OwnerVo> getAllOwners();

    List<OwnerVo> getAllOwnersByBlockId(int blockId);

}
