package com.lgy.projectfinal.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class board_Criteria {
	private int pageNum; //페이지 번호
	private int amount; // 페이지당 글 갯수
	private String keyword; // 페이지 검색 키워드
	private String type; // 페이지 검색 타입
	private String dateCond; // 페이지 검색 타입
	private  String[] typeArr; // 페이지 검색 타입 배열
 	
	private String startDt;
    
	//검색 종료 날짜
	private String endDt;
	
	public board_Criteria() {
		this(1, 10);
	}


	public board_Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split("");
	}
	public void DateCond(String dateCond) {
		this.dateCond = dateCond;
	}

	public board_Criteria(String startDt, String endDt) {
		this.startDt = startDt;
		this.endDt = endDt;
	}

}
