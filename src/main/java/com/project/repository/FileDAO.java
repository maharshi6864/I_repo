package com.project.repository;

import java.util.List;

import com.project.models.FileVo;

public interface FileDAO {
  List<FileVo> getFileObjectsForCurrentUser(int userId, int folderId);

  List<FileVo> getFileObjectsInitially(int userId);
}
