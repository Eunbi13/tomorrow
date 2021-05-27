package com.tmh.t1.brand;

import lombok.Data;

@Data
public class BrandVO {
	private Long brandNum;
	private String userName;
	private String companyName;
	private String registrationNum;
	private String companyHomepage;
	private String managerName;
	private String managerPhone;
	private String managerEmail;
	private String brandName;
	private String brandIntro;
	private String referenceFile;
	private String oriFile;//DB에는 안담고 오리지널 이름 표기용으로 사용 
	private boolean accept;
	
	//category 가져와야함 brand_category를 거쳐서 쿼리문 짜기 
}
