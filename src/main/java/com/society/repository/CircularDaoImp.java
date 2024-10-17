package com.society.repository;

import com.society.models.BlockVo;
import com.society.models.CircularVo;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class CircularDaoImp implements CircularDao {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public void saveCircular(CircularVo circularVo) {

        try {
            Session session = sessionFactory.getCurrentSession();
            session.saveOrUpdate(circularVo);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public List<CircularVo> getAllCirculars() {
        List<CircularVo> list = new ArrayList<CircularVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from CircularVo");
            list = (List<CircularVo>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public void deleteCircular(CircularVo circularVo) {
        try {
            Session session = sessionFactory.getCurrentSession();
            session.delete(circularVo);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public List<CircularVo> getCircularById(int id) {
        List<CircularVo> list = new ArrayList<CircularVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from CircularVo where id =" + id);
            list = (List<CircularVo>) query.list();
            session.clear();
            session.flush();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
