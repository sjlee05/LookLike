package com.lgy.projectfinal.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.projectfinal.dao.ReviewDao;
import com.lgy.projectfinal.dto.Criteria;
import com.lgy.projectfinal.dto.ReviewDto;
import com.lgy.projectfinal.dto.board_Criteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private SqlSession sqlsession;	

	@Override
	public void review_updateStep(HashMap<String, String> param) {
		
		ReviewDao dao = sqlsession.getMapper(ReviewDao.class);
		dao.review_updateStep(param);
	}

	@Override
	public void review_reply(HashMap<String, String> param) {
		
		ReviewDao dao = sqlsession.getMapper(ReviewDao.class);

		System.out.println("@# 서비스단 param.get(\"qna_ref\")"+param.get("qna_ref"));
		dao.review_updateStep(param);
		dao.review_reply(param);
	}

	@Override
	public ArrayList<ReviewDto> review_list() {
		log.info("@# NoticeServiceImpl.list() start");

		ReviewDao dao = sqlsession.getMapper(ReviewDao.class);
		ArrayList<ReviewDto> list = dao.review_list();
		System.out.println("List:::"+list);

		log.info("@# NoticeServiceImpl.list() end");
		return list;
	}

	@Override
	public ArrayList<ReviewDto> review_list(board_Criteria cri) {
		
		ReviewDao dao = sqlsession.getMapper(ReviewDao.class);
		System.out.println("List:::");
		return 	dao.review_listWithPaging(cri);
	}

	@Override
	public void review_write(HashMap<String, String> param) {
		log.info("@# NoticeServiceImpl.write() start");
		
		ReviewDao dao = sqlsession.getMapper(ReviewDao.class);
		dao.review_write(param);
		
		log.info("@# NoticeServiceImpl.write() end");
	}
	
	@Override
	public ReviewDto review_contentView(HashMap<String, String> param) {
	    log.info("@# NoticeServiceImpl.contentView() start");

	    ReviewDao dao = sqlsession.getMapper(ReviewDao.class);
	    ReviewDto dto = dao.review_contentView(param);

	    log.info("@# NoticeServiceImpl.contentView() end");
	    return dto;
	}
	

	@Override
	public ReviewDto review_modifytView(HashMap<String, String> param) {
	    log.info("@# NoticeServiceImpl.modifytView() start");
	    
	    ReviewDao dao = sqlsession.getMapper(ReviewDao.class);
	    ReviewDto dto = dao.review_contentView(param);

	    log.info("@# NoticeServiceImpl.modifytView() end");
	    return dto;
	}

	@Override
	public void review_modify(HashMap<String, String> param) {
		log.info("@# NoticeServiceImpl.modify() start");
		
		ReviewDao dao = sqlsession.getMapper(ReviewDao.class);
		dao.review_modify(param);
		
		log.info("@# NoticeServiceImpl.modify() end");
	}

	@Override
	public void review_delete(HashMap<String, String> param) {
		log.info("@# NoticeServiceImpl.delete() start");
		
		ReviewDao dao = sqlsession.getMapper(ReviewDao.class);
		dao.review_delete(param);
		
		log.info("@# NoticeServiceImpl.delete() end");
	}
	
	@Override
	public int review_getTotalCount(board_Criteria cri) {
		
		ReviewDao dao = sqlsession.getMapper(ReviewDao.class);
		
		return dao.review_getTotalCount(cri);
	}
	
	@Override
	public void review_upHit(HashMap<String, String> param) {
		log.info("@# NoticeServiceImpl.upHit() start");
		
		ReviewDao dao = sqlsession.getMapper(ReviewDao.class);
		dao.review_upHit(param);
		
		log.info("@# NoticeServiceImpl.upHit() end");
	}

	@Override
	public void review_deleteFile(HashMap<String, String> param) {
		log.info("@# NoticeServiceImpl.DeleteFile() start");
		
		ReviewDao dao = sqlsession.getMapper(ReviewDao.class);
		dao.review_deleteFile(param);
		
		log.info("@# NoticeServiceImpl.DeleteFile() end");
	}
	
	@Override
	public void review_rating(HashMap<String, String> param) {
		ReviewDao dao = sqlsession.getMapper(ReviewDao.class);
		dao.review_rating(param);
	}
}