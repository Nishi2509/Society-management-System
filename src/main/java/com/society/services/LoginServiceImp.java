package com.society.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.society.models.LoginVo;
import com.society.repository.LoginDAO;
import com.society.utils.BaseMethods;

@Service
public class LoginServiceImp implements LoginService {

	@Autowired
	private LoginDAO loginDAO;

	@Autowired
	private BaseMethods baseMethods;

	@Transactional
	public void insertLogin(LoginVo loginVO) {
		// TODO Auto-generated method stub
		loginDAO.insertLogin(loginVO);
	}

	@Transactional
	public LoginVo findById(int id) {
		List<LoginVo> list = (List<LoginVo>) this.loginDAO.findById(id).get(0);
		return list.get(0);
	}

	@Transactional
	public LoginVo getCurrentUser() {
		String userName = baseMethods.getUser();
		LoginVo loginVo = loginDAO.getCurrentUserByUserName(userName);
		return loginVo;
	}

}
