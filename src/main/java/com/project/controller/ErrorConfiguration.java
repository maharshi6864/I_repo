package com.project.controller;

import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ErrorConfiguration implements ErrorController {

  @RequestMapping("/error")
  public ModelAndView handleError() {
    System.out.println("error detected");
    return new ModelAndView("404");
  }

  @Override
  public String getErrorPath() {
    // TODO Auto-generated method stub
    return null;
  }

}
