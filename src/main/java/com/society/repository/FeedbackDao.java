package com.society.repository;

import com.society.models.FeedbackVo;

import java.util.List;

public interface FeedbackDao {

    void saveFeedback(FeedbackVo feedbackVo);

    List<FeedbackVo> getCurrentUserFeedBacks(int ownerId);

    List<FeedbackVo> getFeedbacksForAdmin();
}
