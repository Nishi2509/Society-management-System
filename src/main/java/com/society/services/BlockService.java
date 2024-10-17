package com.society.services;

import com.society.models.BlockVo;

import java.util.ArrayList;
import java.util.List;

public interface BlockService {

    void insertBlock(BlockVo blockVo);

    List<BlockVo> searchBlock();

    void deleteBlock(int id);

    BlockVo findById(int id);

    ArrayList<ArrayList<String>> getAvailableParkingSpaces(int blockId,List<String> allocatedParkingSpaces);



}
