package com.society.repository;

import com.society.models.MaintenanceVo;

import java.util.ArrayList;
import java.util.List;

public interface MaintenanceDao {

    void saveMaintenance(MaintenanceVo maintenanceChargesVo);

    List<MaintenanceVo> getMaintenanceDetails(String year,String houseType);

    MaintenanceVo getMaintenanceById(int maintenanceId);

    MaintenanceVo getCurrentMonthMaintenance(String month, String year,int houseType);

    List<MaintenanceVo> getMaintenanceDetailsOfHouseTypeDeclared(String year,String month);
}
