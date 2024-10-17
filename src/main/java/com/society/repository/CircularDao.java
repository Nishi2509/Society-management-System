package com.society.repository;

import com.society.models.CircularVo;

import java.util.List;

public interface CircularDao {

    void saveCircular(CircularVo circularVo);

    List<CircularVo> getAllCirculars();

    void deleteCircular(CircularVo circularVo);

    List<CircularVo> getCircularById(int id);
}
