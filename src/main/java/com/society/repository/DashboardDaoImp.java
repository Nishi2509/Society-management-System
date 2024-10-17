package com.society.repository;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

@Repository
public class DashboardDaoImp implements DashboardDao {

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public List<Objects> paidOwnerList(String year, String month, int blockId) {

        List<Objects> list = new ArrayList<Objects>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createSQLQuery("SELECT " +
                    "  o.ownerName , o.houseNo " +
                    "FROM" +
                    "  maintenancepaidvo AS m " +
                    "  INNER JOIN ownervo AS o " +
                    "    ON m.ownerId = o.ownerId " +
                    "  INNER JOIN blockvo AS b " +
                    "    ON b.blockId = o.blockId " +
                    "WHERE m.month = '" + month + "' " +
                    "  AND m.year = '" + year + "' " +
                    "      AND b.blockId =" + blockId);
            list = (List<Objects>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public List<Objects> unpaidOwnerList(String year, String month, int blockId) {

        List<Objects> list = new ArrayList<Objects>();
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createSQLQuery("  SELECT \n" +
                    "    o.ownerName , o.houseNo " +
                    "  FROM " +
                    "    ownervo AS o " +
                    "    INNER JOIN blockvo AS b " +
                    "      ON b.blockId = o.blockId " +
                    "  WHERE b.blockId = '" + blockId + "' " +
                    "    AND o.ownerId NOT IN " +
                    "    (SELECT " +
                    "      m.ownerId " +
                    "    FROM " +
                    "      maintenancepaidvo AS m " +
                    "      INNER JOIN ownervo AS o " +
                    "        ON m.ownerId = o.ownerId " +
                    "      INNER JOIN blockvo AS b " +
                    "        ON b.blockId = o.blockId " +
                    "    WHERE m.month = '" + month + "' " +
                    "      AND m.year = '" + year + "' " +
                    "      AND b.blockId =" + blockId + ")");
            list = (List<Objects>) query.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
