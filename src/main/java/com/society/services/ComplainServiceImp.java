package com.society.services;

import com.society.models.ComplainVo;
import com.society.repository.ComplainDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class ComplainServiceImp implements ComplainService {

    @Autowired
    private ComplainDao complainDao;

    @Autowired
    private OwnerService ownerService;

    @Override
    public void saveComplain(HttpServletRequest request, MultipartFile complainAttachments) {
        ComplainVo complainVo = new ComplainVo();
        String fileName = complainAttachments.getOriginalFilename();
        String filePath = request.getSession().getServletContext().getRealPath("/") + "//documents//complainAttachments//";
        try {
            byte barr[] = complainAttachments.getBytes();
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(filePath + fileName));
            bufferedOutputStream.write(barr);
            bufferedOutputStream.flush();
            bufferedOutputStream.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        complainVo.setComplainAttachments(fileName);
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDateTime now = LocalDateTime.now();
        complainVo.setSubject(request.getParameter("complainSubject"));
        complainVo.setDescription(request.getParameter("complainDescription"));
        System.out.println(this.ownerService.getCurrentOwner());
        complainVo.setOwnerVo(this.ownerService.getCurrentOwner());
        complainVo.setComplainDateAndTime(dtf.format(now));
        complainVo.setStatus(true);
        complainVo.setComplainStatus("pending");
        this.complainDao.saveComplain(complainVo);
    }

    @Override
    public List<ComplainVo> searchComplain(int ownerId) {
        return this.complainDao.searchComplains(ownerId);
    }

    @Override
    public List<ComplainVo> searchAllComplains() {
        return this.complainDao.searchAllComplains();
    }

    @Override
    public ComplainVo getComplain(int id) {
        List<ComplainVo> list = this.complainDao.getComplain(id);
        return list.get(0);
    }

    @Override
    public void saveReply(int id, String reply) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDateTime now = LocalDateTime.now();
        ComplainVo complainVo = getComplain(id);
        complainVo.setReply(reply);
        complainVo.setReplyDateAndTime(dtf.format(now));
        complainVo.setComplainStatus("fullfill");
        this.complainDao.saveComplain(complainVo);
    }

    @Override
    public void deleteComplain(int id) {
        ComplainVo complainVo = getComplain(id);
        complainVo.setStatus(false);
        this.complainDao.saveComplain(complainVo);
    }

    @Override
    public int getUnreadComplain() {
        int unreadComplainCount = 0;
        ArrayList<ComplainVo> complainList = (ArrayList<ComplainVo>) this.complainDao.searchAllComplains();
        for (int i = 0; i < complainList.size(); i++) {
            if (complainList.get(i).getComplainStatus().equals("pending")) {
                unreadComplainCount++;
            }
        }
        return unreadComplainCount;
    }


}
