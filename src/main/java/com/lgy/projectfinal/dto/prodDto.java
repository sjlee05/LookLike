package com.lgy.projectfinal.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class prodDto {
	private int prod_key; // 상품고유번호
	private int cat_key; // 카테고리고유번호
	private String prod_name; // 상품 이름
	private String prod_img; // 이미지
	private String prod_imgPath; // 이미지 경로
	private String prod_thumbnail; // 썸네일
	private String prod_thumbnailPath; // 썸네일 경로
	private String prod_content; // 상품설명
	private int prod_price; // 상품가격
	private Timestamp prod_rdate; //날짜
	private int prod_cnt; // 재고
	private String prod_size; // 사이즈
	private int quantity; // 수량(회원상세페이지에서 구매할때 필요)
	private int prod_rating; // 평점
	
}
