package com.lgy.projectfinal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.projectfinal.dto.ReviewDto;
import com.lgy.projectfinal.dto.board_Criteria;

public interface ReviewDao {
	public ArrayList<ReviewDto> review_list();
	public ArrayList<ReviewDto> review_listWithPaging(board_Criteria cri);
	public void review_write(HashMap<String, String> param);
	public ReviewDto review_contentView(HashMap<String, String> param);
	public void review_modify(HashMap<String, String> param);
	public void review_delete(HashMap<String, String> param);
	public int review_getTotalCount(board_Criteria cri);
	public void review_upHit(HashMap<String, String> param);
	public String review_getImagePath(HashMap<String, String> param);
	public void review_deleteFile(HashMap<String, String> param);
	public void review_updateStep(HashMap<String, String> param);
//	답글
	public void review_reply(HashMap<String, String> param);
	public void review_rating(HashMap<String, String>param);
}
