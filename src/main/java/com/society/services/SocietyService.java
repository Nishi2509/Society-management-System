package com.society.services;

import com.society.controller.SocietyController;
import com.society.models.SocietyVo;

import java.util.List;

public interface SocietyService {

    void insertSociety(SocietyVo societyVo);

    SocietyVo search();
}
