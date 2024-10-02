package com.project.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ListObjectsV2Request;
import com.amazonaws.services.s3.model.ListObjectsV2Result;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import com.amazonaws.util.IOUtils;

@Service
public class StorageService {

	@Value("${s3.bucket.name}")
	private String bucketName;

	@Autowired
	private AmazonS3 s3Client;

	public Map<String, String> uploadFile(MultipartFile file,String keyPath) {
		Map<String, String> map = new HashMap<>();
		try {
			ObjectMetadata metadata = new ObjectMetadata();
			metadata.setContentLength(file.getSize());
			metadata.setContentType(file.getContentType());
			String fileName = keyPath;
			s3Client.putObject(bucketName, fileName, file.getInputStream(), metadata);
			map.put("fileName", fileName);
			return map;
		} catch (Exception e) {
			map.put("fileName", "Unable to upload file");
			return map;
		}
	}

	public byte[] downloadFile(String fileName) {
		S3Object s3Object = s3Client.getObject(bucketName, fileName);
		S3ObjectInputStream inputStream = s3Object.getObjectContent();
		try {
			byte[] content = IOUtils.toByteArray(inputStream);
			return content;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String deleteFile(String fileName) {
		s3Client.deleteObject(bucketName, fileName);
		return fileName + " removed ...";
	}

	public long getObjectSize(String key) {
		try {
			ObjectMetadata metadata = s3Client.getObjectMetadata(bucketName, key);
			return  metadata.getContentLength();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public long getFolderSize(String key) {
		 ListObjectsV2Request request = new ListObjectsV2Request()
	                .withBucketName(bucketName)
	                .withPrefix(key);

	        ListObjectsV2Result result;
	        long totalSize = 0;

	        do {
	            result = s3Client.listObjectsV2(request);
	            // Use streams to sum up the size of all objects
	            totalSize += result.getObjectSummaries()
	                               .stream()
	                               .collect(Collectors.summingLong(S3ObjectSummary::getSize));
	            
	            request.setContinuationToken(result.getNextContinuationToken());
	        } while (result.isTruncated());


	        return totalSize;
	}

	public static String convertBytes(long bytes) {
		if (bytes < 1024) {
			return bytes + " B";
		} else if (bytes < 1024 * 1024) {
			double kb = bytes / 1024.0;
			return String.format("%.2f KB", kb);
		} else if (bytes < 1024 * 1024 * 1024) {
			double mb = bytes / (1024.0 * 1024.0);
			return String.format("%.2f MB", mb);
		} else {
			double gb = bytes / (1024.0 * 1024.0 * 1024.0);
			return String.format("%.2f GB", gb);
		}
	}
}
