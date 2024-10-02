package com.project.repository;

import java.util.List;

import com.project.models.LoginVo;
import com.project.models.UserVo;

public interface UserDAO {
	
	List<UserVo> getUserByLoginId(int loginId);
	
	List<UserVo> getAllUsers();
	
	List<UserVo> getUserById(int id);
	
	void saveUser(UserVo uservo);
	
}
