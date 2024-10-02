package com.project.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.project.dto.Response;
import com.project.service.AdminDashboardService;

@RestController
public class AdminDashboard {
	
	@Autowired
	private AdminDashboardService adminDashboardService;
	
	@GetMapping("admin/getAdminDashboardDetails")
	  public ResponseEntity<Response> getAdminDashboardDetails() {
		Response response=new Response("Success", this.adminDashboardService.getAdminDasboardDetails(), true);
	    return new ResponseEntity<>(response,HttpStatus.OK);
	  }

}
