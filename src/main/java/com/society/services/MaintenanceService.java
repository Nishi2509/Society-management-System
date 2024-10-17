package com.society.services;

import com.society.models.MaintenanceVo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface MaintenanceService {

    void saveMaintenance(HttpServletRequest request);

    List<MaintenanceVo> getMaintenenaceDetails(String year,String houseType);

    MaintenanceVo getMaintenanceById(int maintenanceId);

    MaintenanceVo getMaintenanceOfYearAndMonth(String month);

    List<String> getAvailableHouseTypeForYear(String modelYearSelect);
}
