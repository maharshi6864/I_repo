package com.project.service;

import com.project.models.LoginVo;


public interface LoginService {

	void insertLogin(LoginVo loginVO);

//	LoginVo findById(int id);
	
	LoginVo getCurrentUser();

}
