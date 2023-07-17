package com.lgy.projectfinal.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.projectfinal.dao.admindao;
import com.lgy.projectfinal.dto.Criteria;
import com.lgy.projectfinal.dto.admindto;
import com.lgy.projectfinal.dto.custdto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class admindaoImpl implements adminService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<custdto> admin_list(Criteria cri) {
		
		admindao dao = sqlSession.getMapper(admindao.class);

		return dao.admin_list(cri);
	}

	@Override
	public int admin_getTotalCount() {

		admindao dao = sqlSession.getMapper(admindao.class);
		
		return dao.admin_getTotalCount();
	}

	@Override
	public ArrayList<admindto> admin_managerlist() {
		
		admindao dao = sqlSession.getMapper(admindao.class);
		ArrayList<admindto> list = dao.admin_managerlistWithPaging();
		
		
		return list;
	}

	@Override
	public void admin_registerOk(HashMap<String, String> param) {
		
		admindao dao = sqlSession.getMapper(admindao.class);
		dao.admin_registerOk(param);
		
	}

	@Override
	public admindto admin_contentView(HashMap<String, String> param) {
		admindao dao = sqlSession.getMapper(admindao.class);
		admindto ldto = dao.admin_contentView(param);
		return ldto;
	}

	@Override
	public void admin_modify(HashMap<String, String> param) {
		
		admindao dao = sqlSession.getMapper(admindao.class);
		dao.admin_modify(param);
	}

	@Override
	public void admin_delete(HashMap<String, String> param) {
		
		admindao dao = sqlSession.getMapper(admindao.class);
		dao.admin_delete(param);
		
	}

	@Override
	public admindto admin_loginYn(String ad_id) {

		admindao dao = sqlSession.getMapper(admindao.class);
		
		return dao.admin_loginYn(ad_id);
	}

	@Override
	public Integer  admin_getAdAuthByAdId(String ad_id) {
		
		admindao dao = sqlSession.getMapper(admindao.class);

		return dao.admin_getAdAuthByAdId(ad_id);
	}

}
