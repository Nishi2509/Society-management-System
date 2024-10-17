package com.society.services;

import com.society.models.FeedbackVo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface FeedbackService {

    void saveFeedback(HttpServletRequest request);

    List<FeedbackVo> getFeedbacksForCurrentUser();

    List<FeedbackVo> getFeedbacksForAdmin();
}
