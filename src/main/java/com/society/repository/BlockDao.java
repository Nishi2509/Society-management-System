package com.society.repository;


import com.society.models.BlockVo;

import java.util.List;

public interface BlockDao {

    void insertBlock(BlockVo blockVo);

    List<BlockVo> searchBlock();

    List<BlockVo> findById(int id);

}
