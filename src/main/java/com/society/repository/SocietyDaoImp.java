package com.society.repository;

import com.society.models.SocietyVo;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class SocietyDaoImp implements SocietyDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void insertSociety(SocietyVo societyVo) {
        try {
            Session session = sessionFactory.getCurrentSession();
            session.saveOrUpdate(societyVo);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<SocietyVo> search() {
        List<SocietyVo> list = new ArrayList<SocietyVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from SocietyVo");
            list = (List<SocietyVo>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
