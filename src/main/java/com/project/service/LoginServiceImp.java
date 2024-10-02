package com.project.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.models.LoginVo;
import com.project.repository.LoginDAO;
import com.project.utils.BaseMethods;

@Service
public class LoginServiceImp implements LoginService {

	@Autowired
	private LoginDAO loginDAO;

	@Transactional
	public void insertLogin(LoginVo loginVO) {
		// TODO Auto-generated method stub
		loginDAO.insertLogin(loginVO);
	}

//	@Transactional
//	public LoginVo findById(int id) {
//		List<LoginVo> list = (List<LoginVo>) this.loginDAO.findById(id).get(0);
//		return list.get(0);
//	}

	


}
