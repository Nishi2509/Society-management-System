package com.society.services;

import com.society.models.CircularVo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface CircularService {

    void saveCircular(CircularVo circularVo, MultipartFile circularAttachments, HttpServletRequest request);

    List<CircularVo> viewCircularsAdmin();

    void deleteCircular(int id);

    CircularVo getCircularById(int id);

    List<CircularVo> viewCircularsUser();

}
