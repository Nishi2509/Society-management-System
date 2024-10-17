package com.society.repository;

import com.society.models.MaintenancePaidVo;

import java.util.List;

public interface MaintenancePaidDao {

    void saveMaintenancePaid(MaintenancePaidVo maintenancePaidVo);

    List<MaintenancePaidVo> getMaintenancePaidDetailsForOwner(int ownerId,String year);

    List<MaintenancePaidVo> getMaintenancePaidDetailsForOwner(int ownerId,String year,String month);

    void maintenanceUnpaid(MaintenancePaidVo maintenancePaidVo);
}
