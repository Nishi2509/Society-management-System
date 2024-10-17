package com.society.services;

import com.society.models.MaintenanceChargesVo;
import com.society.models.MaintenanceVo;
import com.society.repository.MaintenanceChargesDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MaintenanceChargesServiceImp implements MaintenanceChargesService {

    @Autowired
    private MaintenanceChargesDao maintenanceChargesDao;

    @Autowired
    private MaintenanceService maintenanceService;

    @Override
    public void saveMaintenanceCharges(String[] type, String[] amount, MaintenanceVo maintenanceVo) {
        for (int i = 0; i < type.length; i++) {
            MaintenanceChargesVo maintenanceChargesVo = new MaintenanceChargesVo();
            maintenanceChargesVo.setMaintenanceType(type[i]);
            maintenanceChargesVo.setAmount(amount[i]);
            maintenanceChargesVo.setMaintenanceVo(maintenanceVo);
            this.maintenanceChargesDao.saveMaintenanceCharges(maintenanceChargesVo);
        }
    }

    @Override
    public List<MaintenanceChargesVo> getMaintenenaceDetailsForMonth(int maintenanceId) {
        return this.maintenanceChargesDao.getMaintenenaceDetailsForMonth(maintenanceId);
    }

    @Override
    public void addMaintenanceCharges(int id, String type, String amount) {
        MaintenanceVo maintenanceVo = this.maintenanceService.getMaintenanceById(id);
        MaintenanceChargesVo maintenanceChargesVo = new MaintenanceChargesVo();
        maintenanceChargesVo.setMaintenanceType(type);
        maintenanceChargesVo.setAmount(amount);
        maintenanceChargesVo.setMaintenanceVo(maintenanceVo);
        this.maintenanceChargesDao.saveMaintenanceCharges(maintenanceChargesVo);
    }
}
