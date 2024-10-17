package com.society.services;

import com.society.models.MaintenanceChargesVo;
import com.society.models.MaintenanceVo;

import java.util.List;

public interface MaintenanceChargesService {
    void saveMaintenanceCharges(String[] charges, String[] amount, MaintenanceVo maintenanceVo);
    List<MaintenanceChargesVo> getMaintenenaceDetailsForMonth(int maintenanceId);

    void addMaintenanceCharges(int id,String type,String amount);
}
