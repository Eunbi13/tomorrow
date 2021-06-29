package com.tmh.t1.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tmh.t1.brand.BrandVO;
import com.tmh.t1.option.OptionsVO;

@Mapper
public interface ProductMapper {
	
	//eb_productUpdate
	public Long setUpdateProduct(ProductVO productVO)throws Exception;
	//eb_productUpdate 대표이미지 업데이트
	public Long setUpdateProductPic(ProductVO productVO)throws Exception;
	//eb_productUpdate 추가이미지 지우기
	public Long deleteProdImg(ProductVO productVO)throws Exception;
	
	//eb_productUpdate 상품의 카테고리 중간 테이블(product_category)에 업데이트
	public Long setUpdateProduct_category(Map<String, Long> map)throws Exception;
	
	//eb_productUpdate 상품정보 불러오기
	public ProductVO getProdInfo(ProductVO productVO)throws Exception;
	
	//eb_productInsert 브랜드넘찾기
	public Long getBrandNum(String username)throws Exception;
	//eb_productInsert
	public Long setProduct(ProductVO productVO)throws Exception;
	//eb_productInsert,productUpdate 테이블productImages에 추가이미지 넣기
	public Long setImages(ProductImagesVO imagesVO)throws Exception;
	//eb_ProductInsert 상품의 카테고리 중간 테이블(product_category)에 삽입
	public Long setProduct_category(Map<String, Long> map)throws Exception;
	
	//eb_brandHome 브랜드상품리스트 시간순으로 출력
	public List<ProductVO> getProductList(ProductVO productVO)throws Exception;

	//eb category클릭하면 해당상품뜨는 메서드
	public List<ProductVO> getProdFromCat(Map<String, String> map)throws Exception;
	
	public List<BrandVO> getBrandList(ProductVO productVO)throws Exception;
	public List<OptionsVO> getOptionsList(ProductVO productVO)throws Exception;
	public List<ProductImagesVO> getImageList(ProductImagesVO imagesVO)throws Exception;
	
	public List<ProductVO> getBrandHomeList(Long brandNum)throws Exception;
	public List<ProductVO> getPList(BrandVO brandVO)throws Exception;
	 
	
	
	//select
	public ProductVO getSelect(ProductVO productVO)throws Exception;
}
