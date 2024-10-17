package com.society.repository;

import com.society.models.ComplainVo;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class ComplainDaoImp implements ComplainDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void saveComplain(ComplainVo complainVo) {
        try {
            Session session = this.sessionFactory.getCurrentSession();
            session.saveOrUpdate(complainVo);
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<ComplainVo> searchComplains(int ownerId) {
        List<ComplainVo> list = new ArrayList<ComplainVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from ComplainVo where ownerId=" + ownerId+"and status = true");
            list = (List<ComplainVo>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public List<ComplainVo> searchAllComplains() {
        List<ComplainVo> list = new ArrayList<ComplainVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from ComplainVo where status= true");
            list = (List<ComplainVo>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public List<ComplainVo> getComplain(int id) {
        List<ComplainVo> list = new ArrayList<ComplainVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from ComplainVo where id=" + id );
            list = (List<ComplainVo>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }


}
