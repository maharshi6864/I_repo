package com.project.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.models.LoginVo;
import com.project.models.UserVo;
import com.project.repository.LoginDAO;
import com.project.repository.UserDAO;
import com.project.utils.BaseMethods;

@Service
@Transactional
public class UserServiceImp implements UserService{
	
	@Autowired
	private LoginDAO loginDAO;
	
	@Autowired
	private BaseMethods baseMethods;
	
	@Autowired
	private UserDAO userDAO;

	@Override
	public UserVo getCurrentUser(String username) {
		String userName =baseMethods.getUser();
		LoginVo loginVo = loginDAO.getCurrentUserByUserName(userName);
		UserVo userVo=null;
		try{
			userVo=userDAO.getUserByLoginId(loginVo.getId()).get(0);
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return userVo;
	}

	@Override
	public List<UserVo> getAllUsers() {
		return this.userDAO.getAllUsers();
	}

	@Override
	public void setSizeAllocated(int id,String size) {
		UserVo userVo=this.userDAO.getUserById(id).get(0);
		System.out.println(userVo.getName());
		userVo.setSizeAllocated(size);
		this.userDAO.saveUser(userVo);
	}

	@Override
	public UserVo getUserById(int id) {
		return this.userDAO.getUserById(id).get(0);
	}
	


}
