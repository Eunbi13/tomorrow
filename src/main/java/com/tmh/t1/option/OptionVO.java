package com.tmh.t1.option;

import lombok.Data;

@Data
public class OptionVO {
	private Long productNum;
	private Long optionNum;
	private String optionKinds;
	private String optionName;
	private Long optionPrice;
}