package com.project.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.models.FileVo;
import com.project.repository.FileDAO;

@Service
@Transactional
public class FileServiceImp implements FileService {

  @Autowired
  private FileDAO fileDAO;

  @Autowired
  private LoginService loginService;

  @Override
  public List<FileVo> getFileObjects(String folderId) {
    int userId = this.loginService.getCurrentUser().getId();
    System.out.println(folderId);

    if (folderId.equals("null")) {
      return this.fileDAO.getFileObjectsInitially(userId);
    } else {
      return this.fileDAO.getFileObjectsForCurrentUser(userId,
          Integer.parseInt(folderId));
    }

  }
}
