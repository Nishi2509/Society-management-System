package com.society.controller;

import com.society.models.BlockVo;
import com.society.models.FeedbackVo;
import com.society.services.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class FeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    @GetMapping(value = "/user/feedback")
    public ModelAndView feedBack() {
        List<FeedbackVo> feedbackVoList = this.feedbackService.getFeedbacksForCurrentUser();
        return new ModelAndView("user/feedbacks", "feedbackVoList", feedbackVoList);
    }

    @GetMapping(value = "/admin/feedback")
    public ModelAndView feedBackForAdmin() {
        List<FeedbackVo> feedbackVoList = this.feedbackService.getFeedbacksForAdmin();
        return new ModelAndView("admin/manageFeedbacks", "feedbackVoList", feedbackVoList);
    }

    @PostMapping(value = "/user/saveFeedback")
    public ModelAndView saveFeedback(HttpServletRequest request) {
        this.feedbackService.saveFeedback(request);
        return new ModelAndView("redirect:feedback");
    }


}
