package com.society.repository;

import com.society.models.ComplainVo;

import java.util.List;

public interface ComplainDao {

    void saveComplain(ComplainVo complainVo);

    List<ComplainVo> searchComplains(int ownerId);

    List<ComplainVo> searchAllComplains();

    List<ComplainVo> getComplain(int id);
}
