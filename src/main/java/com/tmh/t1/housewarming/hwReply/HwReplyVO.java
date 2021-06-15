package com.tmh.t1.housewarming.hwReply;

import java.util.Date;

import lombok.Data;

@Data
public class HwReplyVO {

	private Long hwReplyNum;
	private Long hwNum;
	private String username;
	private String comment;
	private Long like;
	private Long warning;
	private Date regDate;
	private Long step;
	private Long depth;
	
}
