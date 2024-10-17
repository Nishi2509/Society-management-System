package com.society.services;

import com.society.models.MaintenanceVo;
import com.society.models.OwnerVo;
import com.society.repository.MaintenanceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Service
@Transactional
public class MaintenanceServiceImp implements MaintenanceService {

    @Autowired
    private MaintenanceChargesService maintenanceChargesService;

    @Autowired
    private MaintenanceDao maintenanceDao;

    @Autowired
    private OwnerService ownerService;


    @Override
    public void saveMaintenance(HttpServletRequest request) {

        String[] maintenanceTypes = request.getParameterValues("maintenanceType");
        String[] maintenanceAmount = request.getParameterValues("maintenanceAmount");
        System.out.println(request.getParameter("maintenanceYear")+"???>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        List<String> months = Arrays.asList("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
        months.forEach(month -> {
            MaintenanceVo maintenanceVo = new MaintenanceVo();
            maintenanceVo.setYear(request.getParameter("maintenanceYear"));
            maintenanceVo.setHouseType(request.getParameter("maintenanceHouseType"));
            maintenanceVo.setMonth(month);
            this.maintenanceDao.saveMaintenance(maintenanceVo);
            this.maintenanceChargesService.saveMaintenanceCharges(maintenanceTypes, maintenanceAmount, maintenanceVo);
        });
    }

    @Override
    public List<MaintenanceVo> getMaintenenaceDetails(String year, String houseType) {
        return this.maintenanceDao.getMaintenanceDetails(year, houseType);
    }

    @Override
    public MaintenanceVo getMaintenanceById(int maintenanceId) {
        return this.maintenanceDao.getMaintenanceById(maintenanceId);
    }

    @Override
    public MaintenanceVo getMaintenanceOfYearAndMonth(String month) {
        OwnerVo ownerVo = this.ownerService.getCurrentOwner();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy");
        LocalDateTime now = LocalDateTime.now();
        String year = dtf.format(now);
        return this.maintenanceDao.getCurrentMonthMaintenance(month, year, Integer.parseInt(ownerVo.getBlockVo().getTypeOfHouse()));
    }

    @Override
    public List<String> getAvailableHouseTypeForYear(String modelYearSelect) {
        List<MaintenanceVo> maintenanceVoList = this.maintenanceDao.getMaintenanceDetailsOfHouseTypeDeclared(modelYearSelect, "January");
        List<String> avilableHouseType = new ArrayList<>();
        avilableHouseType.add("2");
        avilableHouseType.add("3");
        avilableHouseType.add("4");
        for (MaintenanceVo maintenanceVo : maintenanceVoList) {
            avilableHouseType.remove(maintenanceVo.getHouseType());
        }
        return avilableHouseType;
    }
}
