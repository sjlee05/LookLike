package com.lgy.projectfinal.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.projectfinal.dao.NoticeDao;
import com.lgy.projectfinal.dto.NoticeDto;
import com.lgy.projectfinal.dto.board_Criteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private SqlSession sqlsession;	
	
	

	@Override
	public ArrayList<NoticeDto> notice_list() {
		log.info("@# NoticeServiceImpl.list() start");

		NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
		ArrayList<NoticeDto> list = dao.notice_list();
		System.out.println("List:::"+list);

		log.info("@# NoticeServiceImpl.list() end");
		return list;
	}

	@Override
	public ArrayList<NoticeDto> notice_list(board_Criteria cri) {
		
		NoticeDao dao = sqlsession.getMapper(NoticeDao.class);

		System.out.println("List:::");
		return 	dao.notice_listWithPaging(cri);
	}

	@Override
	public void notice_write(HashMap<String, String> param) {
		log.info("@# NoticeServiceImpl.write() start");
		
		NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
		dao.notice_write(param);
		
		log.info("@# NoticeServiceImpl.write() end");
		
	}

	@Override
	public NoticeDto notice_contentView(HashMap<String, String> param) {
	    log.info("@# NoticeServiceImpl.contentView() start");

	    notice_upHit(param);
	    NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
	    NoticeDto dto = dao.notice_contentView(param);

	    log.info("@# NoticeServiceImpl.contentView() end");
	    return dto;
	}
	

	@Override
	public NoticeDto notice_modifytView(HashMap<String, String> param) {		
	    log.info("@# NoticeServiceImpl.modifytView() start");
	    
	    NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
	    NoticeDto dto = dao.notice_contentView(param);

	    log.info("@# NoticeServiceImpl.modifytView() end");
	    return dto;
	}

	@Override
	public void notice_modify(HashMap<String, String> param) {
		log.info("@# NoticeServiceImpl.modify() start");
		
		NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
		dao.notice_modify(param);
		
		log.info("@# NoticeServiceImpl.modify() end");
	}

	@Override
	public void notice_delete(HashMap<String, String> param) {
		log.info("@# NoticeServiceImpl.delete() start");
		
		NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
		dao.notice_delete(param);
		
		log.info("@# NoticeServiceImpl.delete() end");
	}
	
	@Override
	public int notice_getTotalCount(board_Criteria cri) {
		
		NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
		
		return dao.notice_getTotalCount(cri);
	}
	
	@Override
	public void notice_upHit(HashMap<String, String> param) {
		log.info("@# NoticeServiceImpl.upHit() start");
		
		NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
		dao.notice_upHit(param);
		
		log.info("@# NoticeServiceImpl.upHit() end");
	}

	@Override
	public void notice_deleteFile(HashMap<String, String> param) {
		log.info("@# NoticeServiceImpl.DeleteFile() start");
		
		NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
		dao.notice_deleteFile(param);
		
		log.info("@# NoticeServiceImpl.DeleteFile() end");
	}
	
	
}