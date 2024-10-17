package com.society.services;

import com.society.models.MaintenancePaidVo;

import java.util.List;

public interface MaintenancePaidService {

    void maintenancePaid(int ownerId, String year, String month);

    List<MaintenancePaidVo> getMaintenancePaidDetailsForOwner(int ownerId, String year);

    void maintenanceUnpaid(int ownerId, String year,String month);

    MaintenancePaidVo getMaintenancePaidDetailsForOwner(int ownerId, String year,String month);
}
