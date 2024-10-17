package com.society.services;

import com.society.models.BlockVo;
import com.society.models.VehicleVo;
import com.society.repository.BlockDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class BlockServiceImp implements BlockService {

    @Autowired
    BlockDao blockDao;

    @Autowired
    VehicleService vehicleService;

    @Override
    public void insertBlock(BlockVo blockVo) {
        this.blockDao.insertBlock(blockVo);
    }

    @Override
    public List<BlockVo> searchBlock() {
        return this.blockDao.searchBlock();
    }

    @Override
    public void deleteBlock(int id) {
        List<BlockVo> list = this.blockDao.findById(id);
        BlockVo blockVo = list.get(0);
        blockVo.setStatus(false);
        this.insertBlock(blockVo);
    }

    @Override
    public BlockVo findById(int id) {
        List<BlockVo> list = this.blockDao.findById(id);
        System.out.println("Getting Block Details");
        return list.get(0);
    }

    @Override
    public ArrayList<ArrayList<String>> getAvailableParkingSpaces(int blockId, List<String> allocatedParkingSpaces) {

        boolean addFlag = false;
        BlockVo blockVo = this.findById(blockId);

        ArrayList<ArrayList<String>> availableParkingSpace = new ArrayList<ArrayList<String>>();

        ArrayList<String> twoWheelerParkingSpace = new ArrayList<String>();
        ArrayList<String> fourWheelerParkingSpace = new ArrayList<String>();

        ArrayList<VehicleVo> vehicleList = (ArrayList<VehicleVo>) this.vehicleService.getAllVehicles();


        for (int i = 0; i < Integer.parseInt(blockVo.getTwoWheelerParkingSpace()); i++) {
            String parkingName = blockVo.getBlockName() + 2 + "-" + (i + 1);
            for (int j = 0; j < vehicleList.size(); j++) {
                if (vehicleList.get(j).getVehicleType().equals("Two Wheeler")) {
                    if (vehicleList.get(j).getAllocatedParkingSpace().equals(parkingName)) {
                        addFlag = true;
                    }
                }
            }
            for (int j = 0; j < allocatedParkingSpaces.size(); j++) {
                if (allocatedParkingSpaces.get(j).equals(parkingName)) {
                    addFlag = false;
                }
            }
            if (!addFlag) {
                addFlag = false;
                twoWheelerParkingSpace.add(parkingName);
            } else {
                addFlag = false;
            }
        }

        addFlag = false;
        for (int i = 0; i < Integer.parseInt(blockVo.getFourWheelerParkingSpace()); i++) {
            String parkingName = blockVo.getBlockName() + 4 + "-" + (i + 1);
            for (int j = 0; j < vehicleList.size(); j++) {
                if (vehicleList.get(j).getVehicleType().equals("Four Wheeler")) {
                    if (vehicleList.get(j).getAllocatedParkingSpace().equals(parkingName)) {
                        addFlag = true;
                    }
                }
            }
            for (int j = 0; j < allocatedParkingSpaces.size(); j++) {
                if (allocatedParkingSpaces.get(j).equals(parkingName)) {
                    addFlag = false;
                }
            }
            if (!addFlag) {
                addFlag = false;
                fourWheelerParkingSpace.add(parkingName);
            } else {
                addFlag = false;
            }
        }

        availableParkingSpace.add(twoWheelerParkingSpace);
        availableParkingSpace.add(fourWheelerParkingSpace);


        return availableParkingSpace;
    }
}
