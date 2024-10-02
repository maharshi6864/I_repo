package com.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.core.io.Resource;

import com.project.dto.Response;
import com.project.models.FileVo;

public interface FileService {
  Response getFileObjects(String folderId);

  Response createFolder(Map<Object,Object> createFolderDetails);

  Response uploadFile(Map<?,?> fileUploadDetails);
  
  Resource downloadFile(Map<Object, Object>fileUploadDetails);
}
