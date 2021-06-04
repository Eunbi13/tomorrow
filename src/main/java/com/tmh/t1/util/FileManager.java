package com.tmh.t1.util;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	public String save(MultipartFile multipartFile, String filePath) throws Exception {
		//filePath : /resources/static/ 제외한 하위경로
		
		// 1. 경로 설정	
		String path="static";
		ClassPathResource classPathResource = new ClassPathResource(path);
		File file = new File(classPathResource.getFile(), filePath);
		
		System.out.println("File Path : "+file.getAbsolutePath());
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		// 2. 저장할 파일명을 생성
		String fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
		
		file = new File(file, fileName);
		
		// transfer
		multipartFile.transferTo(file);
		
		return fileName;
	}

}