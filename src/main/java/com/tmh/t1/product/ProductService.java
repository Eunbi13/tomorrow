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
	
	//eb_productUpdate 
	public Long setUpdateProduct(ProductVO productVO,String categoryID, OptionsVO optionsVO, MultipartFile [] files, MultipartFile rep)throws Exception{
		Long result = productMapper.setUpdateProduct(productVO);
		
		
		
		return result;
	}
	
	//eb_productUpdate 수정하기 위한 상품과 관련된 정보 불러오기
	public Map<String, Object> getProductInfo(ProductVO productVO)throws Exception{
		Long productNum = productVO.getProductNum();
		//product 정보 productImages(추가 이미지) 포함
		productVO = productMapper.getProdInfo(productVO);
		//product_category 정보
		CategoryVO categoryVO=categoryMapper.getProdCategory(productNum);
		//상품이 속한 카테고리(대분류>중분류>소분류)
		String categoryNM = categoryMapper.getCategoryNM(categoryVO);
		//product_options 정보
		List<OptionsVO> options = optionsMapper.getProdOptions(productNum);
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productVO", productVO);
		map.put("categoryVO", categoryVO);
		map.put("categoryNM", categoryNM);
		map.put("options", options);
		return map;
	}
	
	//eb_productList category클릭하면 해당상품뜨는 메서드
		public List<ProductVO> getProdFromCat(Map<String, String> map)throws Exception{
			return productMapper.getProdFromCat(map);
		}
		
	//eb_ ProductInsert brand가 가입시 선택한 대분류만 조회
	public List<CategoryVO> getCategoryOne(Authentication auth) throws Exception{
		String username=auth.getName();
		Map<String, String> map = new HashMap<String, String>();
		map.put("username", username);
		return categoryMapper.getCategoryOne(map);
	}
	//eb_BrandHome 브랜드홈에서 카테고리이름 클릭시 해당 상품조회
	public List<CategoryVO> getNextCategory(int categoryID)throws Exception{
		CategoryVO categoryVO = new CategoryVO();
		categoryVO.setCategoryID(categoryID);
		return categoryMapper.getNextCategory(categoryVO);
	}
	
	
	//eb_ProductInsert
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
		//if(optionVO!=null) {
		String [] k= optionsVO.getOptionKinds().split(",");
		String [] n = optionsVO.getOptionName().split(",");
		String [] p = optionsVO.getOptionPrice().split(",");
		String [] s = optionsVO.getStep().split(",");
		System.out.println("hi266666");
		//product_options 테이블에 optionNum넣기 위해 리스트 생성
		List<Long> optionNums = new ArrayList<Long>();
		
		for(int i =0; i<k.length; i++) {
			optionsVO = new OptionsVO();
			optionsVO.setOptionKinds(k[i]);
			optionsVO.setOptionName(n[i]);
			optionsVO.setOptionPrice(p[i]);
			optionsVO.setStep(s[i]);
			System.out.println("--"+i);
			optionsMapper.setOption(optionsVO);
			System.out.println("==");
			Long optionsNum=optionsVO.getOptionNum();
			System.out.println(optionsNum);
			//options테이블에 ref 업데이트
			optionsMapper.updateOption(optionsVO);
			
			//생성된 optionsNum 리스트에 추가
			optionNums.add(optionsNum);
		}
		System.out.println("hi2222");
		System.out.println("hi:"+productVO.getProductNum());
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
