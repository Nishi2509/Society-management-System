package com.society.repository;

import com.society.models.VehicleVo;
import com.society.services.VehicleService;

import java.util.List;

public interface VehicleDao {

    void saveVehicle(VehicleVo vehicleVo);

    List<VehicleVo> getCurrentUserVehicle(int id);

    List<VehicleVo> getVehicleById(int id);
    void deleteVehicle(VehicleVo vehicleVo);

    List<VehicleVo> getAllVehicles();
}
