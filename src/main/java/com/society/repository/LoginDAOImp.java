package com.society.repository;

import java.util.ArrayList;
import java.util.List;

import com.society.models.OwnerVo;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.society.models.LoginVo;


@Repository
public class LoginDAOImp implements LoginDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void insertLogin(LoginVo loginVO) {
        try {
            Session session = this.sessionFactory.getCurrentSession();
            session.saveOrUpdate(loginVO);
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<LoginVo> findById(int id) {
        List<LoginVo> list = new ArrayList<LoginVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from OwnerVo where id=" + id);
            list = (List<LoginVo>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

	@Override
	public LoginVo getCurrentUserByUserName(String userName) {
		Session session = this.sessionFactory.getCurrentSession();
        Query q = session.createQuery("from LoginVo where username = '" + userName + "' ");
        List<LoginVo> ls = q.list();
        return ls.size() > 0 ? ls.get(0) : null;
      }


}