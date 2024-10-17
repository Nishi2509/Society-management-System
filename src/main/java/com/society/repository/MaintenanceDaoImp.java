package com.society.repository;

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
public class MaintenanceDaoImp implements MaintenanceDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void saveMaintenance(MaintenanceVo maintenanceChargesVo) {
        try {
            Session session = this.sessionFactory.getCurrentSession();
            session.saveOrUpdate(maintenanceChargesVo);
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<MaintenanceVo> getMaintenanceDetails(String year, String houseType) {
        List<MaintenanceVo> list = new ArrayList<MaintenanceVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from MaintenanceVo where year='" + year + "' and houseType ='" + houseType + "'");
            list = (List<MaintenanceVo>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public MaintenanceVo getMaintenanceById(int maintenanceId) {
        List<MaintenanceVo> list = new ArrayList<MaintenanceVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from MaintenanceVo where maintenanceId=" + maintenanceId);
            list = (List<MaintenanceVo>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list.get(0);
    }

    @Override
    public MaintenanceVo getCurrentMonthMaintenance(String month, String year, int houseType) {
        List<MaintenanceVo> list = new ArrayList<MaintenanceVo>();
        MaintenanceVo maintenanceVo = null;
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from MaintenanceVo where month='" + month + "' and year='" + year + "' and houseType=" + houseType);
            list = (List<MaintenanceVo>) query.list();
            maintenanceVo = list.get(0);
        } catch (Exception e) {
            System.out.println(e);
        }
        return maintenanceVo;
    }

    @Override
    public List<MaintenanceVo> getMaintenanceDetailsOfHouseTypeDeclared(String year, String month) {
        List<MaintenanceVo> list = new ArrayList<MaintenanceVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from MaintenanceVo where year='" + year + "' and month ='" + month + "'");
            list = (List<MaintenanceVo>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
