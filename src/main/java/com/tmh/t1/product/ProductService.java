package com.tmh.t1.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.tmh.t1.brand.BrandVO;
import com.tmh.t1.category.CategoryVO;
import com.tmh.t1.option.OptionsMapper;
import com.tmh.t1.option.OptionsVO;
import com.tmh.t1.util.FileManager;

@Service
public class ProductService {
	
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private OptionsMapper optionsMapper;
	@Autowired
	private FileManager fileManager;
	@Value("${productInsert.filePath}")
	private String filePath;
	
	
	//get insert //대분류 카테고리 카테고리 mapper에서 가져오기 
	public List<CategoryVO> getBigCategory(Authentication auth) throws Exception{
		String username=auth.getName();
		return productMapper.getBigCategory(username);
	}
	
	//post insert
	@Transactional(rollbackFor = Exception.class)
	public Long setProduct(Authentication auth, ProductVO productVO,OptionsVO optionsVO , MultipartFile [] files, MultipartFile rep)throws Exception{
		ProductImagesVO imagesVO = new ProductImagesVO();
		
		
		//brandNum 넣기 
		productVO.setBrandNum(productMapper.getBrandNum(auth.getName()));
		
		//대표 이미지
		String fileName = fileManager.save(rep, filePath);
		productVO.setProductPic(fileName);
		//저장
		Long result = productMapper.setProduct(productVO);
		if(result<1) {
			throw new Exception();
		}
		//상품 이미지
		imagesVO.setProductNum(productVO.getProductNum());
		for(MultipartFile f: files) {
			if(f.getSize()>0) {
				fileName =fileManager.save(f, filePath);
				imagesVO.setFileName(fileName);
				result = productMapper.setImages(imagesVO);
			}
		}
		
		//옵션 저장
		optionsMapper.setOption(optionsVO);
		Long optionNum =optionsVO.getOptionNum();
		
		optionsVO.setRef(optionNum);
		optionsVO.setStep(0L);
		optionsMapper.updateOption(optionsVO);
		
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("productNum", productVO.getProductNum());
		map.put("optionNum", optionNum);
		result = productMapper.setProduct_Options(map);
		
		//	List<Long> optionNums = //optionNum을 배열로 받아둬야 함 product_options때문에 
		if(result<1) {
			throw new Exception();
		}
		
		return result;
	}
	
	
	//list
	public List<ProductVO> getProductList(ProductVO productVO)throws Exception{
		return productMapper.getProductList(productVO);
	}
	
	public List<BrandVO> getBrandList(ProductVO productVO)throws Exception{
		return productMapper.getBrandList(productVO);
	}
	
	public List<OptionsVO> getOptionsList(ProductVO productVO)throws Exception{
		return productMapper.getOptionsList(productVO);
	}
	
	//select
	public ProductVO getSelect(ProductVO productVO)throws Exception{
		return productMapper.getSelect(productVO);
	}

}
