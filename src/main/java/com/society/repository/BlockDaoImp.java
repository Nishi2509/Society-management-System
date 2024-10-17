package com.society.repository;

import com.society.models.BlockVo;
import com.society.models.SocietyVo;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class BlockDaoImp implements BlockDao {

    @Autowired
    SessionFactory sessionFactory;
    @Override
    public void insertBlock(BlockVo blockVo) {
        try {
            Session session = sessionFactory.getCurrentSession();
            session.saveOrUpdate(blockVo);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public List<BlockVo> searchBlock() {
        List<BlockVo> list = new ArrayList<BlockVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from BlockVo where status=true");
            list = (List<BlockVo>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public List<BlockVo> findById(int id) {
        List<BlockVo> list = new ArrayList<BlockVo>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from BlockVo where id="+id);
            list = (List<BlockVo>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
