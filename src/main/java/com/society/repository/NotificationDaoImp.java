package com.society.repository;

import com.society.models.MemberVo;
import com.society.models.NotificationVo;
import com.society.models.OwnerVo;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class NotificationDaoImp implements NotificationDao {

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public void insertNotification(NotificationVo notificationVo) {
        try {
            Session session = sessionFactory.getCurrentSession();
            session.saveOrUpdate(notificationVo);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public ArrayList<NotificationVo> getCurrentUserNotifications(int ownerId) {
        List<NotificationVo> list = new ArrayList<NotificationVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from NotificationVo where ownerId=" + ownerId + "and status =true");
            list = (List<NotificationVo>) query.list();
            session.clear();
            session.flush();
        } catch (Exception e) {
            System.out.println(e);
        }
        return (ArrayList<NotificationVo>) list;
    }

    @Override
    public ArrayList<NotificationVo> getNotificationById(int notificationId) {
        List<NotificationVo> list = new ArrayList<NotificationVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from NotificationVo where id=" + notificationId + "and status =true");
            list = (List<NotificationVo>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return (ArrayList<NotificationVo>) list;
    }
}

