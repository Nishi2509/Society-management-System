package com.society.services;

import com.society.models.NotificationVo;
import com.society.models.OwnerVo;
import com.society.models.VehicleVo;
import com.society.repository.VehicleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class VehicleServiceImp implements VehicleService {

    @Autowired
    private VehicleDao vehicleDao;

    @Autowired
    private OwnerService ownerService;

    @Autowired
    private NotificationService notificationService;

    @Override
    public void updateVehicle(HttpServletRequest request, MultipartFile vehicleImageFile) {
        System.out.println("Updating");
        VehicleVo vehicleVo = this.getVehicleById(Integer.parseInt(request.getParameter("vehicleId")));
        vehicleVo.setId(Integer.parseInt(request.getParameter("vehicleId")));
        vehicleVo.setVehicleType(request.getParameter("vehicleType"));
        vehicleVo.setVehicleNumberPlate(request.getParameter("vehicleNumberPlate"));
        vehicleVo.setVehicleRCNumber(request.getParameter("vehicleRcNumber"));
        vehicleVo.setOwnerVo(this.ownerService.getCurrentOwner());
        String fileName = vehicleImageFile.getOriginalFilename();
        if (!fileName.equals("")) {
            try {
                //Deleting Old File
                VehicleVo oldVehicleObj = this.getVehicleById(vehicleVo.getId());
                String filePath = request.getSession().getServletContext().getRealPath("/") + "//documents//vehicleImageFile//" + oldVehicleObj.getVehicleImageFileName();
                File file = new File(filePath);
                file.delete();
            } catch (Exception e) {
                System.out.println("Was Unable to delete file");
            }
            try {
                //Saving new File
                String filePath = request.getSession().getServletContext().getRealPath("/") + "//documents//vehicleImageFile//";
                vehicleVo.setVehicleImageFileName(fileName);
                try {
                    byte barr[] = vehicleImageFile.getBytes();
                    BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(filePath + fileName));
                    bufferedOutputStream.write(barr);
                    bufferedOutputStream.flush();
                    bufferedOutputStream.close();

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } catch (Exception e) {
                System.out.println("Vehicle File was not changed !!!!!!!!!!!!!!!!!!!!");
            }
        }
        this.vehicleDao.saveVehicle(vehicleVo);
    }

    @Override
    public List<VehicleVo> getVehicleByOwnerId(int ownerId) {
        List<VehicleVo> list = this.vehicleDao.getCurrentUserVehicle(ownerId);
        return list;
    }

    @Override
    public List<VehicleVo> getAllVehicles() {
        return this.vehicleDao.getAllVehicles();
    }

    @Override
    public void allocateParking(ArrayList<VehicleVo> listOfVehicle) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        LocalDateTime now = LocalDateTime.now();
        for (int i = 0; i < listOfVehicle.size(); i++) {
            VehicleVo vehicleVo = this.getVehicleById(listOfVehicle.get(i).getId());
            NotificationVo notificationVo = new NotificationVo();
            if (vehicleVo.getAllocatedParkingSpace().equals("Parking Not Alloted")) {
               if (!vehicleVo.getAllocatedParkingSpace().equals(listOfVehicle.get(i).getAllocatedParkingSpace()))
               {
                   notificationVo.setSubject("Parking Slot Alloted");
                   notificationVo.setDescription("Parking Space " + listOfVehicle.get(i).getAllocatedParkingSpace() + " has been allocated for vehicle " + vehicleVo.getVehicleNumberPlate() + ".");
                   notificationVo.setOwnerVo(vehicleVo.getOwnerVo());
                   notificationVo.setDataAndTime(dtf.format(now));
                   this.notificationService.insertNotification(notificationVo);
               }
            } else {
                if (!vehicleVo.getAllocatedParkingSpace().equals(listOfVehicle.get(i).getAllocatedParkingSpace())) {
                    if (listOfVehicle.get(i).getAllocatedParkingSpace().equals("Parking Not Alloted"))
                    {
                        notificationVo.setSubject("Parking Deallocated");
                        notificationVo.setDescription("Parking Space for vehicle " + vehicleVo.getVehicleNumberPlate() + " has been dealocated.");
                        notificationVo.setOwnerVo(vehicleVo.getOwnerVo());
                        notificationVo.setDataAndTime(dtf.format(now));
                        this.notificationService.insertNotification(notificationVo);
                    }
                    else{
                        notificationVo.setSubject("Allocated Parking Change");
                        notificationVo.setDescription("Parking Space for vehicle " + vehicleVo.getVehicleNumberPlate() + " has been changed from " + vehicleVo.getAllocatedParkingSpace() + " to " + listOfVehicle.get(i).getAllocatedParkingSpace());
                        notificationVo.setOwnerVo(vehicleVo.getOwnerVo());
                        notificationVo.setDataAndTime(dtf.format(now));
                        this.notificationService.insertNotification(notificationVo);
                    }
                }
            }
            vehicleVo.setAllocatedParkingSpace(listOfVehicle.get(i).getAllocatedParkingSpace());


            this.vehicleDao.saveVehicle(vehicleVo);

        }
    }


    @Override
    public void saveVehicle(HttpServletRequest request, MultipartFile vehicleImageFile) {

        VehicleVo vehicleVo = new VehicleVo();

        vehicleVo.setVehicleType(request.getParameter("vehicleType"));
        vehicleVo.setVehicleNumberPlate(request.getParameter("vehicleNumberPlate"));
        vehicleVo.setVehicleRCNumber(request.getParameter("vehicleRcNumber"));
        vehicleVo.setOwnerVo(this.ownerService.getCurrentOwner());
        vehicleVo.setAllocatedParkingSpace("Parking Not Alloted");


        if (vehicleVo.getId() == 0) {
            //Saving File there is new object
            String fileName = vehicleImageFile.getOriginalFilename();
            String filePath = request.getSession().getServletContext().getRealPath("/") + "//documents//vehicleImageFile//";
            try {
                byte barr[] = vehicleImageFile.getBytes();
                BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(filePath + fileName));
                bufferedOutputStream.write(barr);
                bufferedOutputStream.flush();
                bufferedOutputStream.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
            vehicleVo.setVehicleImageFileName(fileName);
        } else {


        }

        this.vehicleDao.saveVehicle(vehicleVo);
    }

    @Override
    public List<VehicleVo> getCurrentUserVehicle() {
        OwnerVo ownerVo = this.ownerService.getCurrentOwner();
        List<VehicleVo> list = this.vehicleDao.getCurrentUserVehicle(ownerVo.getId());
        return list;
    }

    @Override
    public VehicleVo getVehicleById(int id) {
        List<VehicleVo> list = this.vehicleDao.getVehicleById(id);
        return list.get(0);
    }

    @Override
    public void deleteVehicle(int id) {
        VehicleVo vehicleVo = this.getVehicleById(id);
        this.vehicleDao.deleteVehicle(vehicleVo);
    }


}
