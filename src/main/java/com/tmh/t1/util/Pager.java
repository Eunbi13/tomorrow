package com.tmh.t1.util;

public class Pager {
	
	private Long curPage;
	private Long perPage;
	
	private Long startRow;
	
	//page
	private Long startNum;
	private Long lastNum;
	
	private boolean pre;
	private boolean next;

	public void makeNum(Long totalCount) {
		int perBlock=5;
		//1. totalCount
		
		//2. totalCount를 이용해서 totalPage수 구하기
		Long totalPage = totalCount/this.getPerPage();
		if(totalCount%this.getPerPage() != 0) {
			totalPage++;
		}
		//3. totalPage를 이용해서 totalBlock 수 구하기
		Long totalBlock = totalPage / perBlock;
		if(totalPage%perBlock !=0) {
			totalBlock++;
		}
		
		//4. curPage를 이용해서 curBlock 구하기
		Long curBlock = this.getCurPage() / perBlock;
		if(this.curPage%perBlock !=0) {
			curBlock++;
		}
		
		//5. curBlock를 이용해서 startNum, lastNum 구하기
		this.startNum=(curBlock-1)*perBlock+1;
		this.lastNum=curBlock*perBlock;

		//6. curBlock이 마지막(totalBlock)
		this.pre=true;
		this.next=true;
		if(curBlock==totalBlock) {
			lastNum = totalPage;
			this.next=false;
		}
		
		if(curBlock==1) {
			this.pre=false;
		}
		
	}
	
	public void makeRow() {
		// curPage 	 	startRow
		// 1			0
		// 2			10
		// 3			20
		this.startRow = (this.getCurPage()-1)*this.getPerPage(); 
	}

	public Long getCurPage() {
		if(this.curPage == null || this.curPage==0) {
			this.curPage=1L;
		}
		return curPage;
	}

	public void setCurPage(Long curPage) {
		if(curPage == null || curPage==0) {
			this.curPage=1L;
		}else {
			this.curPage = curPage;
		}
	}

	public Long getPerPage() {
		if(this.perPage == null || this.perPage==0) {
			this.perPage=10L;
		}
		return perPage;
	}

	public void setPerPage(Long perPage) {
		if(perPage==null || perPage==0) {
			this.perPage=10L;
		}else {
			this.perPage = perPage;
		}
	}

	public Long getStartRow() {
		return startRow;
	}

	public void setStartRow(Long startRow) {
		this.startRow = startRow;
	}

	public Long getStartNum() {
		return startNum;
	}

	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}

	public Long getLastNum() {
		return lastNum;
	}

	public void setLastNum(Long lastNum) {
		this.lastNum = lastNum;
	}

	public boolean isPre() {
		return pre;
	}

	public void setPre(boolean pre) {
		this.pre = pre;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

}
