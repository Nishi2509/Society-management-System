package com.society.repository;

import com.society.models.MaintenancePaidVo;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Objects;

public interface DashboardDao {

    List<Objects> paidOwnerList(String year,String month,int blockId);

    List<Objects> unpaidOwnerList(String year, String month, int blockId);
}
