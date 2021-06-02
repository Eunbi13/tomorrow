package com.tmh.t1.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tmh.t1.category.CategoryMapper;
import com.tmh.t1.category.CategoryVO;
import com.tmh.t1.option.OptionsMapper;
import com.tmh.t1.util.FileManager;

@Service
public class ProductService {
	
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private OptionsMapper optionMapper;
	@Autowired
	private FileManager fileManager;
	
	//get insert //대분류 카테고리 카테고리 mapper에서 가져오기 
	public List<CategoryVO> getBigCategory(Authentication auth) throws Exception{
		String username=auth.getName();
		return productMapper.getBigCategory(username);
	}
	
	//post insert
	public Long setProduct(Authentication auth, ProductVO productVO, MultipartFile [] files, MultipartFile rep)throws Exception{
		ProductImagesVO imagesVO = new ProductImagesVO();
		
		String path="product/images";
		
		//대표 이미지
		String fileName = fileManager.save(rep, path);
		productVO.setProductPic(fileName);
		Long result = productMapper.setProduct(productVO);
		
		//상품 이미지
		imagesVO.setProductNum(productVO.getProductNum());
		for(MultipartFile f: files) {
			fileName =fileManager.save(f, path);
			imagesVO.setFileName(fileName);
			result = productMapper.setImages(imagesVO);
		}
		
		//옵션
		
		
		return result;
	}
	
	
	//list
	public List<ProductVO> getList(ProductVO productVO)throws Exception{
		return productMapper.getList(productVO);
	}
	
	//select
	public ProductVO getSelect(ProductVO productVO)throws Exception{
		return productMapper.getSelect(productVO);
	}

}
