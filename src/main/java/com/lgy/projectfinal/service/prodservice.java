package com.lgy.projectfinal.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.projectfinal.dto.CategoryDto;
import com.lgy.projectfinal.dto.Criteria;
import com.lgy.projectfinal.dto.QnADto;
import com.lgy.projectfinal.dto.board_Criteria;
import com.lgy.projectfinal.dto.prodDto;


public interface prodservice {
//	prod_write : 상품 등록을 위한 메소드
	public void prod_write(HashMap<String, String> param);
//	prod_list : 관리자가 보는 상품 목록(썸네일 + 페이징 + 검색기능 구현)
	public ArrayList<prodDto> prod_list(Criteria cri);
//	prod_member_list : 회원이 보는 상품 목록(썸네일 + 페이징 + 검색기능 구현)
	public ArrayList<prodDto> prod_member_list(Criteria cri);
//	prod_contentView : 관리자가 보는 상세페이지(수정 + 삭제 기능 구현)
	public prodDto prod_contentView(HashMap<String, String>param);
//	prod_member_contentview : 회원이 보는 상세 페이지 (수량 추가)
	public prodDto prod_member_contentview(HashMap<String, String>param);
//	prod_modify : 수정기능 구현 메소드
	public void prod_modify(HashMap<String, String>param);
//	prod_delete : 삭제기능 구현 메소드
	public void prod_delete(HashMap<String, String>param);
//	deleteFile : 상품삭제시 업로드 된 이미지 파일 경로 찾아서 이미지+썸네일 삭제 메소드
	public void prod_deleteFile(HashMap<String, String>param);
//	prod_search : 관리자가 보는 검색기능
	public ArrayList<prodDto> prod_search(String keyword);
//	prod_search : 회원이 보는 검색기능
	public ArrayList<prodDto> prod_member_search(String keyword);
	
//	prod_member_TopList : 고객이 보는 상의 상품 목록
	public ArrayList<prodDto> prod_member_TopList(Criteria cri);

//	prod_getTotalCount : 회원이 보는 상세 페이지
	public int prod_getTotalCount(Criteria cri);
//	prod_getTotalCount_top : 상의 상품목록 페이징처리
	public int prod_getTotalCount_top(Criteria cri);
//	prod_getTotalCount_bottom : 하의 상품목록 페이징처리
    public ArrayList<CategoryDto> prod_categoryList();
    public ArrayList<prodDto> prod_categorySearch(int cat_key);
    public ArrayList<prodDto> prod_categoryTotalSearch(int cat_key);
    public ArrayList<QnADto> qna_list(board_Criteria cri);
	public int qna_getTotalCount(board_Criteria cri);
	public ArrayList<prodDto> prod_main_list();
}
