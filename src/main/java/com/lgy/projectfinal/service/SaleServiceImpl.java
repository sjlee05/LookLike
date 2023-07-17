package com.lgy.projectfinal.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.projectfinal.dao.SaleDao;
import com.lgy.projectfinal.dto.SaleDto;
import com.lgy.projectfinal.dto.board_Criteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("SaleService")
public class SaleServiceImpl implements SaleService {

	@Autowired
	private SqlSession sqlsession;	
	
	

	@Override
	public ArrayList<SaleDto> sale_list() {
		log.info("@# SaleServiceImpl.list() start");

		SaleDao dao = sqlsession.getMapper(SaleDao.class);
		ArrayList<SaleDto> list = dao.sale_list();
		System.out.println("List:::"+list);

		log.info("@# SaleServiceImpl.list() end");
		return list;
	}

	@Override
	public ArrayList<SaleDto> sale_list(board_Criteria cri) {
		
		SaleDao dao = sqlsession.getMapper(SaleDao.class);

		System.out.println("List:::");
		System.out.println("@## getstartdate  ====>"+cri.getStartDt());
		System.out.println("@## getenddate  ====>"+cri.getEndDt());
		return 	dao.sale_listWithPaging(cri);
	}

	

	@Override
	public ArrayList<SaleDto> sale_contentView(HashMap<String, String> param) {
	    log.info("@# SaleServiceImpl.contentView() start");
	    SaleDao dao = sqlsession.getMapper(SaleDao.class);

	    ArrayList<SaleDto> dto = dao.sale_contentView(param);

	    log.info("@# SaleServiceImpl.contentView() end");
	    return dto;
	}
	
	
	@Override
	public void sale_modify(HashMap<String, String> param) {
		log.info("@# SaleServiceImpl.modify() param : "+param);
		SaleDao dao = sqlsession.getMapper(SaleDao.class);

		dao.sale_modify(param);
		log.info("@# SaleServiceImpl.modify() end");
		
	}

	@Override
	public void sale_modifySales(HashMap<String, String> param) {
		log.info("@# SaleServiceImpl.modifySales() start");
		SaleDao dao = sqlsession.getMapper(SaleDao.class);

		dao.sale_modifySales(param);
		log.info("@# SaleServiceImpl.modifySales() end");
		
		
	}
	
	@Override
	public void sale_delete(HashMap<String, String> param) {
		log.info("@# SaleServiceImpl.delete() start");
		SaleDao dao = sqlsession.getMapper(SaleDao.class);
		
		dao.sale_delete(param);
		
		log.info("@# SaleServiceImpl.delete() end");
		
	}
	
	@Override
	public int sale_getTotalCount(board_Criteria cri) {
		
		SaleDao dao = sqlsession.getMapper(SaleDao.class);
		
		return dao.sale_getTotalCount(cri);
	}

	@Override
	public ArrayList<SaleDto> sale_getSales(HashMap<String, String> param) {
		SaleDao dao = sqlsession.getMapper(SaleDao.class);
		return dao.sale_getSales(param);
	}

}