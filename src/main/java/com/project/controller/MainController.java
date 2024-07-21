package com.project.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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

	// @RequestMapping("/error")
	// public ModelAndView handleError(HttpServletRequest request) {
	// Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

	// if (status != null) {
	// Integer statusCode = Integer.valueOf(status.toString());

	// if (statusCode == HttpStatus.NOT_FOUND.value()) {
	// return new ModelAndView("404");
	// } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
	// return new ModelAndView("500");
	// }
	// }
	// return new ModelAndView("404");
	// }

}
