package com.society.services;

import com.society.models.SocietyVo;
import com.society.repository.SocietyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SocietyServiceImp implements SocietyService {

	@Autowired
	private SocietyDao societyDao;

	@Override
	public void insertSociety(SocietyVo societyVo) {
		this.societyDao.insertSociety(societyVo);
	}

	@Override
	public SocietyVo search() {
		List<SocietyVo> list = (List<SocietyVo>) this.societyDao.search();
		SocietyVo societyVo = new SocietyVo();
		try {
			societyVo = list.get(0);
		} catch (Exception e) {
			societyVo = null;
		}
		return societyVo;
	}
}
