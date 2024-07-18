package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	
	@GetMapping("admin/projectGrid")
	public ModelAndView home() {
		return new ModelAndView("admin/projectgrid");
	}

}
