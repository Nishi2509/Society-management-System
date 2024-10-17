package com.society.repository;

import com.society.models.MaintenancePaidVo;
import com.society.models.MaintenanceVo;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Repository
public class MaintenancePaidDaoImp implements MaintenancePaidDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void saveMaintenancePaid(MaintenancePaidVo maintenancePaidVo) {
        try {
            Session session = this.sessionFactory.getCurrentSession();
            session.saveOrUpdate(maintenancePaidVo);
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<MaintenancePaidVo> getMaintenancePaidDetailsForOwner(int ownerId, String year) {
        List<MaintenancePaidVo> list = new ArrayList<MaintenancePaidVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from MaintenancePaidVo where year='" + year + "' and ownerId =" + ownerId);
            list = (List<MaintenancePaidVo>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public List<MaintenancePaidVo> getMaintenancePaidDetailsForOwner(int ownerId, String year, String month) {
        List<MaintenancePaidVo> list = new ArrayList<MaintenancePaidVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from MaintenancePaidVo where year='" + year + "' and ownerId =" + ownerId + " and month='" + month + "'");
            list = (List<MaintenancePaidVo>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public void maintenanceUnpaid(MaintenancePaidVo maintenancePaidVo) {
        try {
            Session session = this.sessionFactory.getCurrentSession();
            session.delete(maintenancePaidVo);
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }
}
