package com.society.repository;

import com.society.models.MaintenanceChargesVo;

import java.util.List;

public interface MaintenanceChargesDao {

    void saveMaintenanceCharges(MaintenanceChargesVo    maintenanceChargesVo);

    List<MaintenanceChargesVo> getMaintenenaceDetailsForMonth(int maintenanceId);


}
