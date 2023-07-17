package com.lgy.projectfinal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.projectfinal.dto.CategoryDto;
import com.lgy.projectfinal.dto.Criteria;
import com.lgy.projectfinal.dto.QnADto;
import com.lgy.projectfinal.dto.board_Criteria;
import com.lgy.projectfinal.dto.prodDto;

public interface prodDao {
//	write : 상품 등록을 위한 메소드
	public void prod_write(HashMap<String, String> param);
//	list : 관리자가 보는 상품 목록(썸네일 + 페이징 + 검색기능 구현)
	public ArrayList<prodDto> prod_list(Criteria cri);
//	member_list : 회원이 보는 상품 목록(썸네일 + 페이징 + 검색기능 구현)
	public ArrayList<prodDto> prod_member_list(Criteria cri);
//	contentView : 관리자가 보는 상세페이지(수정 + 삭제 기능 구현)
	public prodDto prod_contentView(HashMap<String, String>param);
//	member_contentview : 회원이 보는 상세 페이지 (수량 추가)
	public prodDto prod_member_contentview(HashMap<String, String>param);
//	prod_search : 관리자에서 검색 기능 구현하는 메소드
	public ArrayList<prodDto> prod_search(String keyword);
//	prod_member_search : 회원에서 검색 기능 구현하는 메소드
	public ArrayList<prodDto> prod_member_search(String keyword);
//	modify : 수정기능 구현 메소드
	public void prod_modify(HashMap<String, String>param);
//	delete : 삭제기능 구현 메소드
	public void prod_delete(HashMap<String, String>param);
//	deleteFile : 상품삭제시 업로드 된 이미지 파일 경로 찾아서 이미지+썸네일 삭제 메소드
	public void prod_deleteFile(HashMap<String, String>param);

//	getTotalCount : 고객이 보는 상품목록 전체 페이징 처리
	public int prod_getTotalCount();
//	prod_getTotalCount_top : 상의 상품목록 페이징처리
	public int prod_getTotalCount_top();
	
//	prod_member_TopList : 고객이보는 메인페이지 메소드
	public ArrayList<prodDto> prod_member_TopList(Criteria cri);
    public ArrayList<CategoryDto> prod_categoryList();
    public ArrayList<prodDto> prod_categorySearch(int cat_key);
    public ArrayList<prodDto> prod_categoryTotalSearch(int cat_key);
    
	public ArrayList<QnADto> qna_listWithPaging(board_Criteria cri);
	public int qna_getTotalCount(board_Criteria cri);
	public ArrayList<prodDto> prod_main_list(); 
}
