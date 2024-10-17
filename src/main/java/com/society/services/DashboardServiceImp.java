package com.society.services;

import com.society.controller.FeedbackController;
import com.society.models.*;
import com.society.repository.DashboardDao;
import com.society.repository.FeedbackDaoImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

@Service
@Transactional
public class DashboardServiceImp implements DashboardService {

    @Autowired
    private DashboardDao dashboardDao;

    @Autowired
    private BlockService blockService;

    @Autowired
    private OwnerService ownerService;

    @Autowired
    private VehicleService vehicleService;

    @Autowired
    private ComplainService complainService;

    @Autowired
    private FeedbackService feedbackService;

    @Autowired
    private CircularService circularService ;

    @Autowired
    private SocietyService societyService;

    @Override
    public HashMap getPaidAndUnpaidOwners(String year, String month, int blockId) {
        List<Objects> paidOwner = this.dashboardDao.paidOwnerList(year, month, blockId);
        List<Objects> unpaidOwner = this.dashboardDao.unpaidOwnerList(year, month, blockId);
        HashMap map = new HashMap();
        map.put("paidOwner", paidOwner);
        map.put("unpaidOwner", unpaidOwner);
        return map;
    }

    @Override
    public HashMap getDasBlockDetails(int blockId) {
        HashMap map = new HashMap();
        BlockVo blockVo = this.blockService.findById(blockId);
        List<OwnerVo> owners = this.ownerService.getAllOwnersOfBlock(blockId);
        int twoWheelers = 0;
        int fourWheelers = 0;

        for (OwnerVo owner : owners) {
            List<VehicleVo> vehiclesOfOwner = this.vehicleService.getVehicleByOwnerId(owner.getId());
            for (VehicleVo vehicleVo : vehiclesOfOwner) {
                if (vehicleVo.getVehicleType().equals("Two Wheeler")) {
                    twoWheelers++;
                } else {
                    fourWheelers++;
                }
            }

        }
        map.put("owners", owners.size());
        map.put("houses", Integer.parseInt(blockVo.getHouseOnEachFloor()) * Integer.parseInt(blockVo.getNoOfFloors()));
        map.put("unsoldHouses", (Integer.parseInt(blockVo.getHouseOnEachFloor()) * Integer.parseInt(blockVo.getNoOfFloors())) - owners.size());
        map.put("twoWheelers", twoWheelers);
        map.put("fourWheelers", fourWheelers);

        return map;
    }

    @Override
    public HashMap getDasDetails() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy");
        LocalDateTime now = LocalDateTime.now();
        HashMap map = new HashMap();
        int totalFourWheelers = 0;
        int totalTwoWheelers = 0;
        int totalvehicles = 0;
        int totalFeedbacks = 0;
        int totalComplains = 0;
        int totalCirculars = 0;
        List<VehicleVo> totalVehicles = this.vehicleService.getAllVehicles();
        for (VehicleVo vehicleVo : totalVehicles) {
            if (vehicleVo.getVehicleType().equals("Two Wheeler")) {
                totalTwoWheelers++;
            } else {
                totalFourWheelers++;
            }
            totalvehicles++;
        }
        List<ComplainVo> complainVoList = this.complainService.searchAllComplains();
        for (ComplainVo complainVo : complainVoList) {
            if (complainVo.getComplainDateAndTime().split("/")[2].equals(dtf.format(now))) {
                totalComplains++;
            }
        }
        List<FeedbackVo> feedbackVoList =this.feedbackService.getFeedbacksForAdmin();
        for (FeedbackVo feedbackVo : feedbackVoList) {
            if (feedbackVo.getDate().split("/")[2].equals(dtf.format(now))) {
                totalFeedbacks++;
            }
        }
        List<CircularVo> circularVoList =this.circularService.viewCircularsAdmin();
        for (CircularVo circularVo: circularVoList) {
            if (circularVo.getCircularFromDate().split("-")[0].equals(dtf.format(now))) {
                totalCirculars++;
            }
        }
        map.put("totalFourWheelers", totalFourWheelers);
        map.put("totalTwoWheelers", totalTwoWheelers);
        map.put("totalVehicles", totalvehicles);
        map.put("totalComplains", totalComplains);
        map.put("totalFeedbacks", totalFeedbacks);
        map.put("totalCirculars", totalCirculars);
        return map;
    }

    @Override
    public HashMap getUserDasDetails() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy");
        LocalDateTime now = LocalDateTime.now();
        HashMap map = new HashMap();
        int totalFeedbacks = 0;
        int totalComplains = 0;
        int totalFourWheelers = 0;
        int totalTwoWheelers = 0;
        List<VehicleVo> totalVehicles = this.vehicleService.getVehicleByOwnerId(this.ownerService.getCurrentOwner().getId());
        for (VehicleVo vehicleVo : totalVehicles) {
            if (vehicleVo.getVehicleType().equals("Two Wheeler")) {
                totalTwoWheelers++;
            } else {
                totalFourWheelers++;
            }
        }
        List<FeedbackVo> feedbackVoList =this.feedbackService.getFeedbacksForCurrentUser();
        for (FeedbackVo feedbackVo : feedbackVoList) {
            if (feedbackVo.getDate().split("/")[2].equals(dtf.format(now))) {
                totalFeedbacks++;
            }
        }
        List<ComplainVo> complainVoList = this.complainService.searchComplain(this.ownerService.getCurrentOwner().getId());
        for (ComplainVo complainVo : complainVoList) {
            if (complainVo.getComplainDateAndTime().split("/")[2].equals(dtf.format(now))) {
                totalComplains++;
            }
        }
        SocietyVo societyVo=this.societyService.search();
        map.put("societyDetails", societyVo);
        map.put("totalFourWheelers", totalFourWheelers);
        map.put("totalTwoWheelers", totalTwoWheelers);
        map.put("totalComplains", totalComplains);
        map.put("totalFeedbacks", totalFeedbacks);
        return map;
    }

}
