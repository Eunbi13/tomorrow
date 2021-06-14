package com.tmh.t1.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.tmh.t1.brand.BrandVO;
import com.tmh.t1.category.CategoryMapper;
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
	private CategoryMapper categoryMapper;
	@Autowired
	private FileManager fileManager;
	@Value("${productInsert.filePath}")
	private String filePath;
	
	
	//get insert //대분류 카테고리 카테고리 mapper에서 가져오기 
	public List<CategoryVO> getCategoryOne(Authentication auth) throws Exception{
		String username=auth.getName();
		Map<String, String> map = new HashMap<String, String>();
		map.put("username", username);
		return categoryMapper.getCategoryOne(map);
	}

	public List<CategoryVO> getNextCategory(int categoryID)throws Exception{
		CategoryVO categoryVO = new CategoryVO();
		categoryVO.setCategoryID(categoryID);
		return categoryMapper.getNextCategory(categoryVO);
	};
	
	
	//post insert
	@Transactional(rollbackFor = Exception.class)
	public Long setProduct(Authentication auth, ProductVO productVO,String categoryID, OptionsVO optionsVO , MultipartFile [] files, MultipartFile rep)throws Exception{
		ProductImagesVO imagesVO = new ProductImagesVO();
		//1. username에 저장된 brandNum 넣기 
		productVO.setBrandNum(productMapper.getBrandNum(auth.getName()));
		
		//2. 대표이미지 컴퓨터에 저장
		String fileName="";
		if(rep.getSize()>0) {
			fileName = fileManager.save(rep, filePath);
			productVO.setProductPic(fileName);
		}
		//3. 데이터베이스에 인서트
		Long result = productMapper.setProduct(productVO);
		if(result<1) {
			throw new Exception();
		}
		//4. 추가 이미지 저장
		imagesVO.setProductNum(productVO.getProductNum());
		for(MultipartFile f: files) {
			if(f.getSize()>0) {
				fileName =fileManager.save(f, filePath);
				imagesVO.setFileName(fileName);
				result = productMapper.setImages(imagesVO);
			}
		}
		
		//옵션 저장
		String [] k= optionsVO.getOptionKinds().split(",");
		String [] n = optionsVO.getOptionName().split(",");
		String [] p = optionsVO.getOptionPrice().split(",");
		String [] s = optionsVO.getStep().split(",");
		List<Long> optionNums = new ArrayList<Long>();

		for(int i =0; i<k.length; i++) {
			optionsVO = new OptionsVO();
			optionsVO.setOptionKinds(k[i]);
			optionsVO.setOptionName(n[i]);
			optionsVO.setOptionPrice(p[i]);
			optionsVO.setStep(s[i]);
			
			optionsMapper.setOption(optionsVO);
			Long optionsNum=optionsVO.getOptionNum();
			System.out.println(optionsNum);
			optionsMapper.updateOption(optionsVO);
			optionNums.add(optionsNum);
		}

		Map<String, Long> map = new HashMap<String, Long>();
		map.put("productNum", productVO.getProductNum());
		map.put("categoryID", Long.parseLong(categoryID));
		productMapper.setProduct_category(map);
		for(Long e : optionNums) {
			System.out.println(e);
			map.put("optionNum", e);
			result = productMapper.setProduct_Options(map);
			System.out.println("프로덕트_옵션 성공");
			if(result==0) {
				System.out.println("result가 0이다 ");
				break;
			}
		}

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
