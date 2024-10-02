package com.project.service;

import java.util.List;

import com.project.models.UserVo;

public interface UserService {
	
	UserVo getCurrentUser(String username);
	
	List<UserVo> getAllUsers();
	
	void setSizeAllocated(int userId,String size);
	
	UserVo getUserById(int id);

}
