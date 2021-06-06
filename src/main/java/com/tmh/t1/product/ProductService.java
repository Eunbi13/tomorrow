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
	public List<CategoryVO> getBigCategory(Authentication auth) throws Exception{
		String username=auth.getName();
		return productMapper.getBigCategory(username);
	}
	
	//post insert
	@Transactional(rollbackFor = Exception.class)
	public Long setProduct(Authentication auth, ProductVO productVO, OptionsVO optionsVO , MultipartFile [] files, MultipartFile rep)throws Exception{
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
		String [] k= optionsVO.getOptionKinds().split(",");
		String [] n = optionsVO.getOptionName().split(",");
		String [] p = optionsVO.getOptionPrice().split(",");
				
		List<Long> optionNums = new ArrayList<Long>();
		List<String> kindsList = new ArrayList<String>();
		List<String> namesList = new ArrayList<String>();
		List<String> pricesList = new ArrayList<String>();
		for(int i =0; i<k.length; i++) {
			System.out.println(k[i]);
			System.out.println(n[i]);
			System.out.println(p[i]);
			kindsList.add(k[i]);
			namesList.add(n[i]);
			pricesList.add(p[i]);
			System.out.println(i);
		}
/**
		
		StringTokenizer kinds = new StringTokenizer(optionsVO.getOptionKinds(), ",");
		StringTokenizer names = new StringTokenizer(optionsVO.getOptionName(), ",");
		StringTokenizer prices = new StringTokenizer(optionsVO.getOptionPrice(), ",");
 
		int c=0;
		while (kinds.hasMoreElements()) {
			System.out.println("남은개수: "+kinds.countTokens());
			System.out.println("kinds: "+kinds.nextToken());
			System.out.println("names: "+names.nextToken());
			System.out.println("prices: "+prices.nextToken());
			//여기까진만 쓰면 되는데 add를 쓰면 조건식이 false가 되는듯 근데 왜?
			kindsList.add(kinds.nextToken());
			namesList.add(names.nextToken());
			pricesList.add(prices.nextToken());
			System.out.println(c);
			c++;
//			
//			optionsVO = new OptionsVO();
//			optionsVO.setOptionKinds(kinds.nextToken());
//			optionsVO.setOptionName(names.nextToken());
//			optionsVO.setOptionPrice(prices.nextToken());
//			result=optionsMapper.setOption(optionsVO);
//			System.out.println("result"+result);
//			System.out.println(optionsVO.toString());
//			Long optionNum =optionsVO.getOptionNum();
//			optionNums.add(optionNum);
		}
*/

		
		
//		Map<String, Long> map = new HashMap<String, Long>();
//		map.put("productNum", productVO.getProductNum());
//		for(Long e : optionNums) {
//			System.out.println(e);
//			map.put("optionNum", e);
//			result = productMapper.setProduct_Options(map);
//			System.out.println("프로덕트_옵션 성공");
//			if(result==0) {
//				break;
//			}
//		}
		//optionsMapper.setOption(optionsVO);
		
		
//		Long optionNum =optionsVO.getOptionNum();
//		
//		optionsVO.setRef(optionNum);
//		optionsVO.setStep(0L);
//		optionsMapper.updateOption(optionsVO);
//		
//		Map<String, Long> map = new HashMap<String, Long>();
//		map.put("productNum", productVO.getProductNum());
//		map.put("optionNum", optionNum);
//		result = productMapper.setProduct_Options(map);
//		
		
//		if(result<1) {
//			throw new Exception();
//		}
//		
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
