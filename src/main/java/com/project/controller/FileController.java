package com.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.project.dto.Response;
import com.project.models.FileVo;
import com.project.service.FileService;

@RestController
public class FileController {

	@Autowired
	private FileService fileService;

	@GetMapping("user/getUserDocs")
	public ResponseEntity<Response> getMethodName(@RequestParam String folderId) {
		Response response = this.fileService.getFileObjects(folderId);
		return new ResponseEntity<Response>(response, HttpStatus.OK);
	}

	@PostMapping("user/createFolder")
	public ResponseEntity<Response> createFolderForUser(@RequestBody Map<Object, Object> createFolderDetails) {
		Response response = this.fileService.createFolder(createFolderDetails);
		return new ResponseEntity<Response>(response, HttpStatus.OK);
	}

	@PostMapping("user/uploadFile")
	public ResponseEntity<Response> uploadFile(@RequestParam("file") MultipartFile file,
			@RequestParam("fileName") String fileName, @RequestParam("folderId") int folderId) {
		// You can create a map or a DTO to handle multiple request parameters
		Map<String, Object> fileUploadDetails = new HashMap<>();
		fileUploadDetails.put("file", file);
		fileUploadDetails.put("fileName", fileName);
		fileUploadDetails.put("folderId", folderId);

		Response response = this.fileService.uploadFile(fileUploadDetails);
		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@PostMapping("user/downloadFile")
	public ResponseEntity<Resource> downloadFile(@RequestBody Map<Object, Object> fileDownloadDetails) {
		Resource fileResource = this.fileService.downloadFile(fileDownloadDetails);

		String contentType = "application/octet-stream"; // Adjust if you know
															// the file type
		String fileName = (String) fileDownloadDetails.get("filePath");
		
		
		if (fileName == null || fileName.isEmpty()) {
			fileName = "dowbnload"; // Return empty string for null or empty
									// input
		}
		int lastSlashIndex = fileName.lastIndexOf("/");

		fileName = fileName.substring(lastSlashIndex + 1);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.parseMediaType(contentType));
		headers.set(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"");

		return new ResponseEntity<>(fileResource, headers, HttpStatus.OK);
	}

}
