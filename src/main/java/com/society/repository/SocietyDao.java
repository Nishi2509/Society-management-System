package com.society.repository;

import com.society.models.SocietyVo;

import java.util.List;

public interface SocietyDao {

    void insertSociety(SocietyVo societyVo);

    List<SocietyVo> search();
}
