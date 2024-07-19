package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@GetMapping("admin/projectGrid")
	public ModelAndView adminProjectGrid() {
		return new ModelAndView("admin/projectgrid");
	}

	@GetMapping("user/projectGrid")
	public ModelAndView userProjectGrid() {
		return new ModelAndView("user/projectgrid");
	}

	@GetMapping("user/fileManager")
	public ModelAndView userFileManager() {
		return new ModelAndView("user/filemanager");
	}

	@GetMapping("admin/fileManager")
	public ModelAndView adminFileManager() {
		return new ModelAndView("admin/filemanager");
	}

}
