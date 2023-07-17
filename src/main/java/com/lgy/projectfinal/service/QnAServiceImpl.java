package com.lgy.projectfinal.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.projectfinal.dao.QnADao;
import com.lgy.projectfinal.dto.QnADto;
import com.lgy.projectfinal.dto.board_Criteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("QnAService")
public class QnAServiceImpl implements QnAService {

	@Autowired
	private SqlSession sqlsession;	
	
	@Override
	public void qna_updateStep(HashMap<String, String> param) {
		QnADao dao = sqlsession.getMapper(QnADao.class);

		dao.qna_updateStep(param);
	}

	@Override
	public void qna_reply(HashMap<String, String> param) {
		QnADao dao = sqlsession.getMapper(QnADao.class);

		System.out.println("@# 서비스단 param.get(\"qna_ref\")"+param.get("qna_ref"));
		dao.qna_updateStep(param);
		dao.qna_reply(param);
	}

	@Override
	public ArrayList<QnADto> qna_list() {
		log.info("@# NoticeServiceImpl.list() start");

		QnADao dao = sqlsession.getMapper(QnADao.class);
		ArrayList<QnADto> list = dao.qna_list();
		System.out.println("List:::"+list);

		log.info("@# NoticeServiceImpl.list() end");
		return list;
	}

	@Override
	public ArrayList<QnADto> qna_list(board_Criteria cri) {
		QnADao dao = sqlsession.getMapper(QnADao.class);

		System.out.println("List:::");
		return 	dao.qna_listWithPaging(cri);
	}

	@Override
	public void qna_write(HashMap<String, String> param) {
		log.info("@# NoticeServiceImpl.write() start");
		
		QnADao dao = sqlsession.getMapper(QnADao.class);
		dao.qna_write(param);
		
		log.info("@# NoticeServiceImpl.write() end");
	}

	@Override
	public QnADto qna_contentView(HashMap<String, String> param) {
	    log.info("@# NoticeServiceImpl.contentView() start");

	    qna_upHit(param);
	    QnADao dao = sqlsession.getMapper(QnADao.class);
	    QnADto dto = dao.qna_contentView(param);

	    log.info("@# NoticeServiceImpl.contentView() end");
	    return dto;
	}
	

	@Override
	public QnADto qna_modifytView(HashMap<String, String> param) {
	    log.info("@# NoticeServiceImpl.modifytView() start");
	    
	    QnADao dao = sqlsession.getMapper(QnADao.class);
	    QnADto dto = dao.qna_contentView(param);

	    log.info("@# NoticeServiceImpl.modifytView() end");
	    return dto;
	}

	@Override
	public void qna_modify(HashMap<String, String> param) {
		log.info("@# NoticeServiceImpl.modify() start");
		
		QnADao dao = sqlsession.getMapper(QnADao.class);
		dao.qna_modify(param);
		
		log.info("@# NoticeServiceImpl.modify() end");
	}

	@Override
	public void qna_delete(HashMap<String, String> param) {
		log.info("@# NoticeServiceImpl.delete() start");
		
		QnADao dao = sqlsession.getMapper(QnADao.class);
		dao.qna_delete(param);
		
		log.info("@# NoticeServiceImpl.delete() end");
	}
	
	@Override
	public int qna_getTotalCount(board_Criteria cri) {
		
		QnADao dao = sqlsession.getMapper(QnADao.class);
		
		return dao.qna_getTotalCount(cri);
	}
	
	@Override
	public void qna_upHit(HashMap<String, String> param) {
		log.info("@# NoticeServiceImpl.upHit() start");
		
		QnADao dao = sqlsession.getMapper(QnADao.class);
		dao.qna_upHit(param);
		
		log.info("@# NoticeServiceImpl.upHit() end");
	}

	@Override
	public void qna_deleteFile(HashMap<String, String> param) {
		log.info("@# NoticeServiceImpl.DeleteFile() start");
		QnADao dao = sqlsession.getMapper(QnADao.class);
		dao.qna_deleteFile(param);
		log.info("@# NoticeServiceImpl.DeleteFile() end");
	}
}