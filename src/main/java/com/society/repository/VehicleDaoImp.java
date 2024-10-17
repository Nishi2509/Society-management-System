package com.society.repository;

import com.society.models.SocietyVo;
import com.society.models.VehicleVo;
import com.society.services.VehicleService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class VehicleDaoImp implements VehicleDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void saveVehicle(VehicleVo vehicleVo) {
        try {
            Session session = sessionFactory.getCurrentSession();
            session.saveOrUpdate(vehicleVo);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public List<VehicleVo> getCurrentUserVehicle(int id) {
        List<VehicleVo> list = new ArrayList<VehicleVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from VehicleVo where ownerId=" + id);
            list = (List<VehicleVo>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public List<VehicleVo> getVehicleById(int id) {
        List<VehicleVo> list = new ArrayList<VehicleVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from VehicleVo where id=" + id);
            list = (List<VehicleVo>) query.list();
            session.clear();
            session.flush();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public void deleteVehicle(VehicleVo vehicleVo) {
        try {
            Session session = sessionFactory.getCurrentSession();
            session.delete(vehicleVo);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public List<VehicleVo> getAllVehicles() {
        List<VehicleVo> list = new ArrayList<VehicleVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from VehicleVo");
            list = (List<VehicleVo>) query.list();

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
