package com.lgy.projectfinal.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.projectfinal.dto.NoticeDto;
import com.lgy.projectfinal.dto.board_Criteria;

public interface NoticeService {
	public ArrayList<NoticeDto> notice_list();
	public ArrayList<NoticeDto> notice_list(board_Criteria cri);
	public void notice_write(HashMap<String, String> param);
	public NoticeDto notice_contentView(HashMap<String, String> param);
	public NoticeDto notice_modifytView(HashMap<String, String> param);
	public void notice_modify(HashMap<String, String> param);
	public void notice_delete(HashMap<String, String> param);
	public int notice_getTotalCount(board_Criteria cri);
	public void notice_upHit(HashMap<String, String> param);
	public void notice_deleteFile(HashMap<String, String> param);
}
