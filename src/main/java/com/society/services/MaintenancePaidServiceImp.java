package com.society.services;

import com.society.models.MaintenancePaidVo;
import com.society.models.OwnerVo;
import com.society.repository.MaintenancePaidDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;

@Service
@Transactional
public class MaintenancePaidServiceImp implements MaintenancePaidService {

    @Autowired
    private OwnerService ownerService;

    @Autowired
    private MaintenancePaidDao maintenancePaidDao;


    @Override
    public void maintenancePaid(int ownerId, String year, String month) {
        OwnerVo ownerVo = this.ownerService.findOwneById(ownerId);
        MaintenancePaidVo maintenancePaidVo = new MaintenancePaidVo();
        maintenancePaidVo.setYear(year);
        maintenancePaidVo.setMonth(month);
        maintenancePaidVo.setOwnerVo(ownerVo);
        maintenancePaidVo.setMaintenanceStatus(true);
        this.maintenancePaidDao.saveMaintenancePaid(maintenancePaidVo);
    }

    @Override
    public List<MaintenancePaidVo> getMaintenancePaidDetailsForOwner(int ownerId, String year) {
        return this.maintenancePaidDao.getMaintenancePaidDetailsForOwner(ownerId, year);
    }

    @Override
    public void maintenanceUnpaid(int ownerId, String year, String month) {
        MaintenancePaidVo maintenancePaidVo = this.getMaintenancePaidDetailsForOwner(ownerId, year, month);
        this.maintenancePaidDao.maintenanceUnpaid(maintenancePaidVo);
    }

    @Override
    public MaintenancePaidVo getMaintenancePaidDetailsForOwner(int ownerId, String year, String month) {
        List<MaintenancePaidVo> list = this.maintenancePaidDao.getMaintenancePaidDetailsForOwner(ownerId, year, month);
        try {
            return list.get(0);
        } catch (Exception e) {
            return new MaintenancePaidVo();
        }
    }
}
