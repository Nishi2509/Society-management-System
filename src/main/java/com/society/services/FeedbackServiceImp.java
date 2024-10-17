package com.society.services;

import com.society.models.FeedbackVo;
import com.society.models.OwnerVo;
import com.society.repository.FeedbackDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.List;

@Service
@Transactional
public class FeedbackServiceImp implements FeedbackService{

    @Autowired
    private FeedbackDao feedbackDao;

    @Autowired
    private OwnerService ownerService;


    @Override
    public void saveFeedback(HttpServletRequest request) {
        String rating=request.getParameter("rating");
        String description=request.getParameter("description");
        OwnerVo ownerVo=this.ownerService.getCurrentOwner();
        FeedbackVo feedbackVo=new FeedbackVo();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDateTime now = LocalDateTime.now();
        feedbackVo.setRating(rating);
        feedbackVo.setDescription(description);
        feedbackVo.setOwnerVo(ownerVo);
        feedbackVo.setDate(dtf.format(now));
        this.feedbackDao.saveFeedback(feedbackVo);
    }

    @Override
    public List<FeedbackVo> getFeedbacksForCurrentUser() {
        return this.feedbackDao.getCurrentUserFeedBacks(ownerService.getCurrentOwner().getId());
    }

    @Override
    public List<FeedbackVo> getFeedbacksForAdmin() {
        return this.feedbackDao.getFeedbacksForAdmin();
    }
}
