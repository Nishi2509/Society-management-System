package com.society.controller;

import com.society.models.BlockVo;
import com.society.models.VehicleVo;
import com.society.services.BlockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RestController
public class BlocksController {

    @Autowired
    BlockService blockService;

    @GetMapping(value = "admin/blocks")
    public ModelAndView manageBlocks() {
        List<BlockVo> list = this.blockService.searchBlock();
        return new ModelAndView("admin/manageBlocks", "blockVo", new BlockVo()).addObject("list", list);
    }

    @PostMapping(value = "admin/blocks")
    public ModelAndView insertBlocks(@ModelAttribute BlockVo blockVo) {
        this.blockService.insertBlock(blockVo);
        return new ModelAndView("redirect:/admin/blocks");
    }

    @GetMapping(value = "admin/deleteBlocks/{id}")
    public ModelAndView deleteBlocks(@PathVariable("id") int id) {
        this.blockService.deleteBlock(id);
        return new ModelAndView("redirect:/admin/blocks");
    }

    @GetMapping(value = "admin/getBlockDetails/{id}")
    public BlockVo getBlockDetails(@PathVariable("id") int id) {
        System.out.println("hittt");
        return this.blockService.findById(id);
    }

    @PostMapping(value = "admin/getParkingSpaces/{blockId}")
    public ArrayList<ArrayList<String>> getParkingSpaces(@PathVariable("blockId") int blockId, @RequestBody List<String> allotedSpaces) {
        return this.blockService.getAvailableParkingSpaces(blockId,allotedSpaces);
    }


}
