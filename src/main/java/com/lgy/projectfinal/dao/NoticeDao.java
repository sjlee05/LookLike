package com.lgy.projectfinal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.projectfinal.dto.NoticeDto;
import com.lgy.projectfinal.dto.board_Criteria;

public interface NoticeDao {
	public ArrayList<NoticeDto> notice_list();
	public ArrayList<NoticeDto> notice_listWithPaging(board_Criteria cri);
	public void notice_write(HashMap<String, String> param);
	public NoticeDto notice_contentView(HashMap<String, String> param);
	public void notice_modify(HashMap<String, String> param);
	public void notice_delete(HashMap<String, String> param);
	public int notice_getTotalCount(board_Criteria cri);
	public void notice_upHit(HashMap<String, String> param);
	public String notice_getImagePath(HashMap<String, String> param);
	public void notice_deleteFile(HashMap<String, String> param);
}
