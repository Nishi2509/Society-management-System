package com.society.services;

import com.society.models.VehicleVo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

public interface VehicleService {

    void saveVehicle(HttpServletRequest request, MultipartFile vehicleImageFile);

    List<VehicleVo> getCurrentUserVehicle();

    void deleteVehicle(int id);

    VehicleVo getVehicleById(int id);

    void updateVehicle(HttpServletRequest request, MultipartFile vehicleImageFile);

    List<VehicleVo> getVehicleByOwnerId(int ownerId);

    List<VehicleVo> getAllVehicles();

    void allocateParking(ArrayList<VehicleVo> listOfVehicle);
}
