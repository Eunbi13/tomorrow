package com.tmh.t1.brand;

import java.util.List;

import javax.validation.constraints.NotEmpty;

import org.springframework.lang.Nullable;

import com.tmh.t1.category.CategoryVO;

import lombok.Data;

@Data
public class BrandVO {
	
	


	private Long brandNum;
	private String username;
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
	@Nullable
	private String referenceFile;
	private boolean accept;

	private String [] categories;
	
	public boolean isAccept() {
		this.accept=false;
		return this.accept;
	}
	

	private String orderNum;
	
	
	private Long status;
	private Long before;
	
}
