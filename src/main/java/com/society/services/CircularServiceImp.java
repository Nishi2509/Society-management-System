package com.society.services;

import com.society.models.CircularVo;
import com.society.repository.CircularDao;
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
public class CircularServiceImp implements CircularService {


    @Autowired
    private CircularDao circularDao;

    @Autowired
    private NotificationService notificationService;

    @Override
    public void saveCircular(CircularVo circularVo, MultipartFile circularAttachment, HttpServletRequest request) {
        System.out.println(request.getParameter("notifyUser") + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        if (circularVo.getId() == 0) {
            String fileName = circularAttachment.getOriginalFilename();
            String filePath = request.getSession().getServletContext().getRealPath("/") + "//documents//circularAttachments//";
            try {
                byte barr[] = circularAttachment.getBytes();
                BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(filePath + fileName));
                bufferedOutputStream.write(barr);
                bufferedOutputStream.flush();
                bufferedOutputStream.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
            circularVo.setCircularAttactments(fileName);
            if (request.getParameter("notifyUser")!=null) {
                if (checkValidity(circularVo.getCircularFromDate(), circularVo.getCircularFromTo())) {
                    this.notificationService.notifyEveryOwner("New Circular", "A New Circular has been uploaded by admin on subject " + circularVo.getCategory() + " .");
                }
            }
        } else {
            if (request.getParameter("notifyUser")!=null) {
                if (checkValidity(circularVo.getCircularFromDate(), circularVo.getCircularFromTo())) {
                    this.notificationService.notifyEveryOwner("Circular Edited", "A Circular regarding " + circularVo.getCategory() + " has been edited by admin.");
                }
            }
            String fileName = circularAttachment.getOriginalFilename();
            if (!fileName.equals("")) {
                try {
                    //Deleting Old File
                    CircularVo oldCircularVo = this.getCircularById(circularVo.getId());
                    String filePath = request.getSession().getServletContext().getRealPath("/") + "//documents//circularAttachments//" + oldCircularVo.getCircularAttactments();
                    File file = new File(filePath);
                    file.delete();
                } catch (Exception e) {
                    System.out.println("Was Unable to delete file");
                }
                try {
//               Saving new File
                    String filePath = request.getSession().getServletContext().getRealPath("/") + "//documents//circularAttachments//";
                    circularVo.setCircularAttactments(fileName);
                    try {
                        byte barr[] = circularAttachment.getBytes();
                        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(filePath + fileName));
                        bufferedOutputStream.write(barr);
                        bufferedOutputStream.flush();
                        bufferedOutputStream.close();

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } catch (Exception e) {
                    System.out.println("Circular File was not changed !!!!!!!!!!!!!!!!!!!!");
                }
            }
        }

        this.circularDao.saveCircular(circularVo);
    }

    @Override
    public List<CircularVo> viewCircularsAdmin() {

        return this.circularDao.getAllCirculars();
    }

    @Override
    public List<CircularVo> viewCircularsUser() {
        List<CircularVo> validCirculars = new ArrayList<CircularVo>();
        List<CircularVo> list = this.circularDao.getAllCirculars();
        for (int i = 0; i < list.size(); i++) {
            if (checkValidity(list.get(i).getCircularFromDate(), list.get(i).getCircularFromTo())) {
                validCirculars.add(list.get(i));
            }
        }


        return validCirculars;
    }

    @Override
    public void deleteCircular(int id) {
        CircularVo circularVo = new CircularVo();
        circularVo.setId(id);
        this.circularDao.deleteCircular(circularVo);
    }

    @Override
    public CircularVo getCircularById(int id) {
        List<CircularVo> list = this.circularDao.getCircularById(id);
        return list.get(0);
    }

    public static boolean checkValidity(String fromDate, String toDate) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");
        LocalDateTime now = LocalDateTime.now();
        String[] fromDateString = fromDate.split("-", 4);
        String[] toDateString = toDate.split("-", 4);
        int fromDateInt = Integer.parseInt(String.join("", fromDateString));
        int toDateInt = Integer.parseInt(String.join("", toDateString));
        int currentDateInt = Integer.parseInt(dtf.format(now));
        if (currentDateInt >= fromDateInt && currentDateInt <= toDateInt) {
            return true;
        } else {
            return false;
        }
    }
}
