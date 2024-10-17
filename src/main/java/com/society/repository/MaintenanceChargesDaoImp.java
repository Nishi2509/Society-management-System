package com.society.repository;

import com.society.models.ComplainVo;
import com.society.models.MaintenanceChargesVo;
import com.society.models.MaintenanceVo;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class MaintenanceChargesDaoImp implements MaintenanceChargesDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void saveMaintenanceCharges(MaintenanceChargesVo maintenanceChargesVo) {
        try {
            Session session = this.sessionFactory.getCurrentSession();
            session.saveOrUpdate(maintenanceChargesVo);
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<MaintenanceChargesVo> getMaintenenaceDetailsForMonth(int maintenanceId) {
        List<MaintenanceChargesVo> list = new ArrayList<MaintenanceChargesVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from MaintenanceChargesVo where maintenanceId=" + maintenanceId);
            list = (List<MaintenanceChargesVo>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }


}
