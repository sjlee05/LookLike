package com.lgy.projectfinal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.projectfinal.dto.Criteria;
import com.lgy.projectfinal.dto.admindto;
import com.lgy.projectfinal.dto.custdto;

public interface admindao {
	public ArrayList<custdto> admin_list(Criteria cri);
	public ArrayList<admindto> admin_managerlistWithPaging();
	public admindto admin_loginYn(String ad_id);
	public void admin_registerOk(HashMap<String, String> param); //관리자(직원 등록)
	public admindto admin_contentView(HashMap<String, String> param); //목록 조회
	public ArrayList<custdto> admin_search(String keyword); //검색조회
	public ArrayList<admindto> admin_searchmanager(String keyword); //검색조회
	public void admin_modify(HashMap<String, String> param);	//수정
	public void admin_delete(HashMap<String, String> param);	//삭제
	public int admin_getTotalCount();
	public Integer  admin_getAdAuthByAdId(String ad_id);
}
