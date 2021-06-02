package com.tmh.t1.housewarming;

import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class HousewarmingVO {

	private Long hwNum;
	private String username;
	private String space;
	private int spaceSize;
	private String work;
	private String field;
	private String familyType;
	private String area;
	private String style;
	private String period;
	private int budget;
	private String totalTone;
	private String wallColor;
	private String bottomColor;
	private String detail;
	private String link;
	private String copyright;
	private Long coverImg;
	private String title;
	private String contents;
	private Long hit;
	
	private HwFileVO hwfile;
}
