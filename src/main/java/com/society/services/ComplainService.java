package com.society.services;

import com.society.models.ComplainVo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface ComplainService {

    void saveComplain(HttpServletRequest request, MultipartFile complainAttachments);

    List<ComplainVo> searchComplain(int ownerId);

    List<ComplainVo> searchAllComplains();

    ComplainVo getComplain(int id);

    void saveReply(int id,String reply);

    void  deleteComplain(int id);

    int getUnreadComplain();
}
