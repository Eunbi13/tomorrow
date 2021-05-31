package com.tmh.t1.category;

import lombok.Data;

@Data
public class CategoryVO {
	private int categoryID;
	private String groupID;
	private int category_LEV;
	private String category_NM;
	private int category_detail;
	private String category_detail_NM;
	private int category_parent;
	private int category_detail_parent;

}
