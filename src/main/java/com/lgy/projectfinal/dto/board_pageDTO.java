package com.lgy.projectfinal.dto;

import lombok.Getter;

@Getter
public class board_pageDTO {
	
	private int startPage; //시작페이지 : 1, 11
	private int endPage; //끝페이지 : 10, 20
	private boolean prev, next;
	private int total;
	private board_Criteria cri; // 화면에 출력 갯수
	
	public board_pageDTO(int total, board_Criteria cri) {
		this.total = total;
		this.cri = cri;
		
		this.endPage = (int) Math.ceil(cri.getPageNum() / 10.0) * 10; 

		this.startPage = this.endPage - 9;

		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
	}
	
}
