package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.project.dto.Response;
import com.project.models.UserVo;
import com.project.service.AdminDashboardService;
import com.project.service.UserService;

@RestController
public class AdminUserController {

  @Autowired
  private AdminDashboardService adminDashboardService;
  
  @Autowired
  private UserService userService;

  @GetMapping("admin/userDetails")
  public ModelAndView getUserDetails() {
    List<UserVo> userVos=this.userService.getAllUsers();
    return new ModelAndView("admin/userDetails","userList",userVos);
  }
  
  @GetMapping("admin/setSize")
  public ResponseEntity<Response> setSize(@RequestParam("userId") String userId,
                        @RequestParam("size") String size) {
      this.userService.setSizeAllocated(Integer.parseInt(userId),size);
      return new ResponseEntity<Response>(new Response("successs",null, true),HttpStatus.OK);
  }

}
