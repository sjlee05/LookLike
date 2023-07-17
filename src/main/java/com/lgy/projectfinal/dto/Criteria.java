package com.lgy.projectfinal.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Criteria {
	private int pageNum;//페이지 번호
	private int amount;//페이지당 글 갯수
	private String keyword; // 페이지 검색 키워드
	
	public Criteria() {
//		초기페이지는 1이고, 10개씩 출력
		this(1, 10);//1~10
//		2:11~, 3:21~, 4:31~
//		this(5, 10);//41~50
	}
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}











