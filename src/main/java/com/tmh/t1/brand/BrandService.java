package com.tmh.t1.brand;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.web.multipart.MultipartFile;

import com.tmh.t1.category.CategoryMapper;
import com.tmh.t1.category.CategoryVO;
import com.tmh.t1.product.ProductMapper;
import com.tmh.t1.product.ProductVO;
import com.tmh.t1.util.FileManager;

@Service
public class BrandService {
	
	@Autowired
	private BrandMapper brandMapper;
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private FileManager fileManager;
	@Value("${brandInsert.filePath}")
	private String filePath;
	
	//eb_brandHome brand정보 불러오기
	public BrandVO getBrandInfo(BrandVO brandVO) throws Exception{
		return brandMapper.getBrandInfo(brandVO);
	}
	//eb_brandHome brand product리스트 불러오기
	public List<ProductVO> getBrandHomeList(BrandVO brandVO)throws Exception{
		return productMapper.getBrandHomeList(brandVO.getBrandNum());
	}
	//eb_brandHome brand category대분류 불러오기
	public List<CategoryVO> getBrandCategory(BrandVO brandVO)throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		map.put("brandNum", brandVO.getBrandNum()+"");
		return categoryMapper.getCategoryOne(map);
	}

	
	
	
	
	
	//eb_brandInsert 판매자번후 중복 에러
	public boolean brandError(Errors errors, BrandVO brandVO)throws Exception{
		boolean check = errors.hasErrors();
		
		if(brandMapper.getRegistrationNum(brandVO)>0) {
			errors.rejectValue("registrationNum", "brandVO.registrationNum.has");
			check = true;
		}
		
		
		return check;
	}
	
	//eb_brandInsert 대분류 카테고리 카테고리 mapper에서 가져오기 
	public List<CategoryVO> getBigCategory() throws Exception{
		return categoryMapper.getBigCategory();
	}
	
	//eb_brandInsert
	public Long signBrand(BrandVO brandVO, Authentication auth, MultipartFile files) throws Exception{
		brandVO.setUsername(auth.getName());
		
		//brandVO에 첨부파일 넣기
		if(files.getSize()>0) {
			String fileName=fileManager.save(files, filePath);
			brandVO.setReferenceFile(fileName);
		}
		
		//brandInsert
		Long result = brandMapper.signBrand(brandVO);
		
		//신청할때 선택한 대분류 카테고리 brand_cateogy테이블에 삽입 
		for(String c : brandVO.getCategories()) {
			Map<String , String> map = new HashMap<String, String>();
			map.put("categoryID", c);
			map.put("brandNum", brandVO.getBrandNum()+"");
			result =brandMapper.setBrand_Category(map);
		}
		
		return result;
	}
}
