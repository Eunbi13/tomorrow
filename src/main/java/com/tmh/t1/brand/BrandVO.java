package com.tmh.t1.brand;

import java.util.List;

import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class BrandVO {
	private Long brandNum;
	private String userName;
	@NotEmpty
	private String companyName;
	@NotEmpty
	private String registrationNum;
	private String companyHomepage;
	@NotEmpty
	private String managerName;
	@NotEmpty
	private String managerPhone;
	@NotEmpty
	private String managerEmail;
	@NotEmpty
	private String brandName;
	@NotEmpty
	private String brandIntro;
	private String referenceFile;
	private String oriFile;//DB에는 안담고 오리지널 이름 표기용으로 사용 
	private boolean accept;//false여야 함
	
	//category 가져와야함 brand_category를 거쳐서 쿼리문 짜기 
	//임시 파일 이 파일 지울때 config도 수정해야함 
	private List<CategoryVO> categories;
}
