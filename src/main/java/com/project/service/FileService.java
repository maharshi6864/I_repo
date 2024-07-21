package com.project.service;

import java.util.List;

import com.project.models.FileVo;

public interface FileService {
  List<FileVo> getFileObjects(String folderId);
}
