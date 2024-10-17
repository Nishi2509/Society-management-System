package com.society.repository;

import com.society.models.ComplainVo;
import com.society.models.FeedbackVo;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Repository
public class FeedbackDaoImp implements FeedbackDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void saveFeedback(FeedbackVo feedbackVo) {
        try {
            Session session = sessionFactory.getCurrentSession();
            session.saveOrUpdate(feedbackVo);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public List<FeedbackVo> getCurrentUserFeedBacks(int ownerId) {
        List<FeedbackVo> list = new ArrayList<FeedbackVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from FeedbackVo where ownerId=" + ownerId);
            list = (List<FeedbackVo>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public List<FeedbackVo> getFeedbacksForAdmin() {
        List<FeedbackVo> list = new ArrayList<FeedbackVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from FeedbackVo ");
            list = (List<FeedbackVo>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
