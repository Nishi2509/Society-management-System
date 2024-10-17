package com.society.services;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.acl.Owner;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.society.models.BlockVo;
import com.society.models.LoginVo;
import com.society.repository.LoginDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.society.models.OwnerVo;
import com.society.repository.OwnerDao;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Service
@Transactional
public class OwnerServiceImp implements OwnerService {

    @Autowired
    private OwnerDao ownerDao;

    @Autowired
    private LoginService loginService;


    @Override
    public void insertOwners(String[] houseNumbers, String[] ownerName, String[] ownerId, String[] ownerEmail, int blockId, int floorNumber) {
        for (int index = 0; index < houseNumbers.length; index++) {

            OwnerVo ownerVo = new OwnerVo();
            BlockVo blockVo = new BlockVo();

            blockVo.setId(blockId);
            if (!ownerId[index].equals("0")) {
                ownerVo.setId(Integer.parseInt(ownerId[index]));
                LoginVo loginVo = this.findOwneById(ownerVo.getId()).getLoginVo();
                loginVo.setUsername(ownerEmail[index]);
                this.loginService.insertLogin(loginVo);
                ownerVo.setLoginVo(loginVo);
            } else {
                LoginVo loginVo = new LoginVo();
                loginVo.setEnabled("1");
                loginVo.setPassword("12345");
                loginVo.setUsername(ownerEmail[index]);
                loginVo.setRole("ROLE_USER");
                loginVo.setStatus(true);
                this.loginService.insertLogin(loginVo);
                ownerVo.setLoginVo(loginVo);
            }
            ownerVo.setBlockVo(blockVo);
            ownerVo.setFloorNo(floorNumber);
            ownerVo.setHouseNo(houseNumbers[index]);
            ownerVo.setOwnerName(ownerName[index]);
            ownerVo.setOwnerEmail(ownerEmail[index]);

            this.ownerDao.insertOwner(ownerVo);
        }
    }

    @Override
    public List<OwnerVo> findOwner(int blockId, int floorNo) {
        List<OwnerVo> list = new ArrayList<OwnerVo>();
        try {
            list = this.ownerDao.findOwner(blockId, floorNo);
        } catch (Exception e) {
            System.out.println("Owners Not found with Sepcific Block and Floor.");
        }
        return list;
    }

    @Override
    public OwnerVo findOwneById(int ownerId) {
        return this.ownerDao.findOwneById(ownerId).get(0);
    }

    @Override
    public void insertOwner(OwnerVo ownerVo) {
        this.ownerDao.insertOwner(ownerVo);
    }

    @Override
    public OwnerVo getCurrentOwner() {
        System.out.println(this.loginService.getCurrentUser().getUsername());
        List<OwnerVo> list = this.ownerDao.searchByUsername(this.loginService.getCurrentUser().getUsername());
        return list.get(0);
    }

    @Override
    public List<OwnerVo> getAllOwners() {
        return this.ownerDao.getAllOwners();
    }

    @Override
    public List<String> getOwnerEmailList(List<String> emailList) {
        List<String> ownerEmailList = new ArrayList<String>();
        List<OwnerVo> list = this.ownerDao.getAllOwners();
        boolean addInList = true;
        for (OwnerVo ownerVo : list) {
            for (String email : emailList) {
                if (ownerVo.getOwnerEmail().equals(email)) {
                    addInList = false;
                    break;
                }
            }
            if (addInList) {
                ownerEmailList.add(ownerVo.getOwnerEmail());
                addInList = true;
            }
        }
        return ownerEmailList;
    }

    @Override
    public void editOwnerProfile(HttpServletRequest request, MultipartFile ownerImage) {
        System.out.println("Updating");
        OwnerVo ownerVo = this.getCurrentOwner();
        ownerVo.setOwnerName(request.getParameter("ownerName"));
        ownerVo.setPhoneNo(request.getParameter("ownerPhone"));
        String fileName = ownerImage.getOriginalFilename();
        if (!fileName.equals("")) {
            try {
                //Deleting Old File
                String filePath = request.getSession().getServletContext().getRealPath("/") + "//documents//ownerImages//" + ownerVo.getFileName();
                File file = new File(filePath);
                file.delete();
            } catch (Exception e) {
                System.out.println("Was Unable to delete file");
            }
            try {
                //Saving new File
                String filePath = request.getSession().getServletContext().getRealPath("/") + "//documents//ownerImages//";
                ownerVo.setFileName(fileName);
                try {
                    byte barr[] = ownerImage.getBytes();
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
        this.ownerDao.insertOwner(ownerVo);
    }

    @Override
    public List<OwnerVo> getAllOwnersOfBlock(int blockId) {
        return this.ownerDao.getAllOwnersByBlockId(blockId);
    }


}
