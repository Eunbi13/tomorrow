package com.tmh.t1.brand;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tmh.t1.category.CategoryVO;
import com.tmh.t1.util.FileManager;

@Service
public class BrandService {
	
	@Autowired
	private BrandMapper brandMapper;
	@Autowired
	private FileManager fileManager;

	//get signBrand
	public List<CategoryVO> getCategory() throws Exception{
		return brandMapper.getCategory();
	}
	
	//post signBrand
	public Long signBrand(BrandVO brandVO,Authentication auth, MultipartFile files) throws Exception{
		brandVO.setUsername(auth.getName());
		
		Long result = brandMapper.signBrand(brandVO);
		
		for(String c : brandVO.getCategories()) {
			Map<String , String> map = new HashMap<String, String>();
			
			map.put("categoryID", c);
			map.put("brandNum", brandVO.getBrandNum()+"");
			result =brandMapper.setBrand_Category(map);
		}
		
		if(files.getSize()>0) {
			String filePath="signBrand/";
			String fileName=fileManager.save(files, filePath);
			System.out.println(files.getOriginalFilename());
			System.out.println(fileName);
			brandVO.setReferenceFile(fileName);
		}
		
		return result;
	}
}
