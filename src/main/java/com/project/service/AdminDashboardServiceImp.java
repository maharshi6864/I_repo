package com.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.models.LoginVo;
import com.project.models.UserVo;
import com.project.repository.LoginDAO;
import com.project.repository.UserDAO;

@Service
@Transactional
public class AdminDashboardServiceImp implements AdminDashboardService {

	@Autowired
	private StorageService storageService;

	@Autowired
	private UserDAO userDAO;

	@SuppressWarnings("null")
	@Override
	public Map<String,Object> getAdminDasboardDetails() {
		Map<String,Object> mapG=new HashMap<>();
		List<UserVo> userVos = this.userDAO.getAllUsers();
		List<Map<String, String>> ls= new ArrayList<>();
		double totalUsage=0.0;
		int totalUser=0;
		for (UserVo userVo : userVos) {
			Map<String, String> map = new HashMap<>();
			map.put("username", userVo.getLoginVo().getUsername());
			//Usage is in GB 
			double usage=(double)this.storageService.getFolderSize(userVo.getLoginVo().getUsername()) / (1024.0 * 1024.0 * 1024.0);
			totalUsage+=usage;
			totalUser++;
			map.put("usage", String.format("%f", usage));
			ls.add(map);
		}
		mapG.put("userUsage", ls);
		mapG.put("totalUser", totalUser);
		mapG.put("totalUsage", totalUsage);
		return mapG;
	}

}
