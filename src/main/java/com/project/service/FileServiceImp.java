package com.project.service;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.dto.Response;
import com.project.models.FileVo;
import com.project.repository.FileDAO;
import com.project.utils.BaseMethods;

@Service
@Transactional
public class FileServiceImp implements FileService {

	@Autowired
	private FileDAO fileDAO;

	@Autowired
	private UserService userService;

	@Autowired
	private BaseMethods baseMethods;

	@Autowired
	private StorageService storageService;

	@Override
	public Response getFileObjects(String folderId) {
		String username = this.baseMethods.getUser();
		if (folderId.equals("null")) {
			List<FileVo> currentFolderList = null;
			try {
				FileVo firstFolder = this.fileDAO.getFileObjectsInitially(username).get(0);
				currentFolderList = this.fileDAO.getFileObjectsForCurrentUser(firstFolder.getName(),
						firstFolder.getId());
				for (FileVo fileVo1 : currentFolderList) {
					if (fileVo1.getDocType().equals("FOLDER")) {
						List<FileVo> insideFileList = this.fileDAO.getFileObjectsForCurrentUser(username,
								fileVo1.getId());
						String fileSize = insideFileList.size() + " Files";
						fileVo1.setDocSize(fileSize);
					} else {
						String fileSize = this.storageService
								.convertBytes(this.storageService.getObjectSize(fileVo1.getDocPath()));
						fileVo1.setDocSize(fileSize);
					}
				}
			} catch (Exception e) {
				System.out.println("Parent Folder not found creating folder for new user");
				FileVo fileVo = new FileVo();
				fileVo.setDocSize(null);
				fileVo.setDocSize(null);
				fileVo.setDocType("FOLDER");
				fileVo.setName(username);
				fileVo.setUsername(username);
				fileVo.setDocId(null);
				this.fileDAO.saveFolder(fileVo);
				FileVo firstFolder = this.fileDAO.getFileObjectsInitially(username).get(0);
				currentFolderList = this.fileDAO.getFileObjectsForCurrentUser(firstFolder.getName(),
						firstFolder.getId());

			}
			return new Response("Got all the files for the current folder.", currentFolderList, true);
		} else {
			List<FileVo> currentFolderList = this.fileDAO.getFileObjectsForCurrentUser(username,
					Integer.parseInt(folderId));
			for (FileVo fileVo1 : currentFolderList) {
				if (fileVo1.getDocType().equals("FOLDER")) {
					List<FileVo> insideFileList = this.fileDAO.getFileObjectsForCurrentUser(username, fileVo1.getId());
					String fileSize = insideFileList.size() + " Files";
					fileVo1.setDocSize(fileSize);
				} else {
					String fileSize = this.storageService
							.convertBytes(this.storageService.getObjectSize(fileVo1.getDocPath()));
					fileVo1.setDocSize(fileSize);
				}
			}
			return new Response("Got all the files for the current folder.", currentFolderList, true);
		}

	}

	@Override
	public Response createFolder(Map<Object, Object> createFolderDetails) {
		String username = this.baseMethods.getUser();
		String newFolderName = (String) createFolderDetails.get("newFolderName");
		int parentFolderId = (int) createFolderDetails.get("currentFolderId");

		if (newFolderName.equals("")) {
			return new Response("invalid", null, false);
		}

		FileVo fileVo = new FileVo();

		FileVo parentVo = new FileVo();

		if (parentFolderId != 0) {
			parentVo.setId(parentFolderId);
			fileVo.setDocId(parentVo);
		} else {
			parentVo = this.fileDAO.getHomeFolderOfUser(username).get(0);
			fileVo.setDocId(parentVo);
		}

		List<FileVo> fileVos = this.fileDAO.checkForDuplicateFolder(username, newFolderName, parentVo.getId());

		if (fileVos.size() == 0) {
			fileVo.setName(newFolderName);
			fileVo.setUsername(username);
			fileVo.setDocType("FOLDER");
			String folderPath = this.getFullPathToCreateFolder(parentVo.getId()) + newFolderName;
			fileVo.setDocPath(folderPath);
			this.fileDAO.saveFolder(fileVo);
			return new Response("valid", null, true);
		}
		return new Response("invalid", null, false);
	}

	private String getFullPathToCreateFolder(int parentFolderId) {
		String path = "";
		while (true) {
			FileVo fileVo = this.fileDAO.getParentFolder(parentFolderId).get(0);
			path = fileVo.getName() + "/" + path;
			if (fileVo.getDocId() == null) {
				break;
			}
			parentFolderId = fileVo.getDocId().getId();
		}
		return path;
	}

	@Override
	public Response uploadFile(Map<?, ?> fileUploadDetails) {
		MultipartFile file = (MultipartFile) fileUploadDetails.get("file");

		if (file.isEmpty()) {
			return new Response("File is empty", null, false);
		}

		String fileName = (String) fileUploadDetails.get("fileName");
		String username = this.baseMethods.getUser();
		int parentFolderId = (int) fileUploadDetails.get("folderId");

		FileVo fileVo = new FileVo();
		FileVo parentVo = new FileVo();

		String filePath = new String();

		if (parentFolderId != 0) {
			filePath = getFullPathToCreateFolder(parentFolderId) + fileName;
			parentVo.setId(parentFolderId);
			fileVo.setDocId(parentVo);
		} else {
			filePath = username + "/" + fileName;
			parentVo = this.fileDAO.getHomeFolderOfUser(username).get(0);
			fileVo.setDocId(parentVo);
		}

		List<FileVo> fileVoList = this.fileDAO.checkForDuplicateFolder(username, fileName, parentVo.getId());

		if (fileVoList.isEmpty()) {
			try {

				this.storageService.uploadFile(file, filePath);

				fileVo.setDocPath(filePath);
				fileVo.setUsername(username);
				fileVo.setName(fileName);
				fileVo.setDocType("FILE");
				this.fileDAO.saveFolder(fileVo);

				return new Response("File uploaded successfully", null, true);
			} catch (Exception e) {

				return new Response("Error uploading file: " + e.getMessage(), null, false);
			}
		}

		// Return failure response if file is empty
		return new Response("File is empty", null, false);
	}

	@Override
	public Resource downloadFile(Map<Object, Object> fileUploadDetails) {
	    try {
	        String filePath = (String) fileUploadDetails.get("filePath");

	        // Call the existing method in StorageService to get the file's byte content
	        byte[] fileContent = this.storageService.downloadFile(filePath);

	        // Create a Resource from the byte array
	        ByteArrayResource resource = new ByteArrayResource(fileContent);

	        // Return the resource
	        return resource;
	    } catch (Exception e) {
	        throw new RuntimeException("Failed to download the file", e);
	    }
	}



}
