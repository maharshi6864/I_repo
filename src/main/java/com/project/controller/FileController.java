package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.models.FileVo;
import com.project.service.FileService;

@RestController
public class FileController {

  @Autowired
  private FileService fileService;

  @GetMapping("user/getUserDocs")
  public List<FileVo> getMethodName(@RequestParam String folderName) {
    return this.fileService.getFileObjects(folderName);
  }

}
