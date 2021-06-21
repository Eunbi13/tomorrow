package com.tmh.t1.product;



import java.util.List;

import com.tmh.t1.brand.BrandVO;
import com.tmh.t1.category.CategoryVO;
import com.tmh.t1.option.OptionsVO;

import lombok.Data;

@Data
public class ProductVO {
	private Long productNum;
	private Long brandNum;
	private String productName;
	private Long productPrice;
	private String productPic;
	private String contents;
	private Long discountPrice;
	private Long shippingFee;
	
	private ProductImagesVO productImagesVO;
	
//	private List<OptionsVO> optionsVOs;
//	private CategoryVO categoryVO;
	
	private BrandVO brandVO;
//	private OptionsVO optionsVO;
}
