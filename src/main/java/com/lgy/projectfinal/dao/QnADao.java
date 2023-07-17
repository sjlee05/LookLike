package com.lgy.projectfinal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.projectfinal.dto.QnADto;
import com.lgy.projectfinal.dto.board_Criteria;

public interface QnADao {
	public ArrayList<QnADto> qna_list();
	public ArrayList<QnADto> qna_listWithPaging(board_Criteria cri);
	public void qna_write(HashMap<String, String> param);
	public QnADto qna_contentView(HashMap<String, String> param);
	public void qna_modify(HashMap<String, String> param);
	public void qna_delete(HashMap<String, String> param);
	public int qna_getTotalCount(board_Criteria cri);
	public void qna_upHit(HashMap<String, String> param);
	public String qna_getImagePath(HashMap<String, String> param);
	public void qna_deleteFile(HashMap<String, String> param);
	public void qna_updateStep(HashMap<String, String> param);
//	답글
	public void qna_reply(HashMap<String, String> param);
}
