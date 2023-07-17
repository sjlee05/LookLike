package com.lgy.projectfinal.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.projectfinal.dao.QnADao;
import com.lgy.projectfinal.dao.prodDao;
import com.lgy.projectfinal.dto.CategoryDto;
import com.lgy.projectfinal.dto.Criteria;
import com.lgy.projectfinal.dto.QnADto;
import com.lgy.projectfinal.dto.board_Criteria;
import com.lgy.projectfinal.dto.prodDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("prodservice")
public class prodserviceImpl implements prodservice{
	
	@Autowired
	private SqlSession sqlSession;

	
	@Override
//	관리자가 보는 상품목록
	public ArrayList<prodDto> prod_list(Criteria cri) {
		log.info("@# prodserviceImpl.prod_list(Criteria cri) start");
		
		prodDao dao = sqlSession.getMapper(prodDao.class);

		log.info("@# prodserviceImpl.prod_list(Criteria cri) end");
		
		return dao.prod_list(cri);
	}
	
	@Override
//	회원이 보는 상품목록
	public ArrayList<prodDto> prod_member_list(Criteria cri) {
		log.info("@@## prodserviceImpl.prod_member_list(Criteria cri) start");
		
		prodDao dao = sqlSession.getMapper(prodDao.class);
		
		log.info("@@## prodserviceImpl.prod_member_list(Criteria cri) end");
		
		return dao.prod_member_list(cri);
	}
	
	@Override
//	관리자가 보는 검색기능
	public ArrayList<prodDto> prod_search(String keyword) {
		log.info("@@## prodserviceImpl.prod_search(String keyword) start");
		
		prodDao dao = sqlSession.getMapper(prodDao.class);
		
		log.info("@@## prodserviceImpl.prod_search(String keyword) end");
		
		return dao.prod_search(keyword);
	}
	
//	회원이 보는 전체상품목록 검색 기능
	@Override
	public ArrayList<prodDto> prod_member_search(String keyword) {
		log.info("@@## prodserviceImpl.prod_member_search(String keyword) start");
		
		prodDao dao = sqlSession.getMapper(prodDao.class);
		
		log.info("@@## prodserviceImpl.prod_member_search(String keyword) end");
		
		return dao.prod_member_search(keyword);
	}
	
	
	@Override
//	업로드한 값을 저장하는 메소드
	public void prod_write(HashMap<String, String> param) {
		log.info("@# prodserviceImpl.prod_write() start");
		prodDao dao = sqlSession.getMapper(prodDao.class);
		dao.prod_write(param);
		log.info("@# prodserviceImpl.prod_write() end");

	}
	
	@Override
//	관리자가 보는 상세페이지 뷰 메소드
	public prodDto prod_contentView(HashMap<String, String> param) {
		log.info("@# prodserviceImpl.prod_contentView() start");
		
		prodDao dao = sqlSession.getMapper(prodDao.class);
		prodDto dto = dao.prod_contentView(param);
		
		log.info("@# prodserviceImpl.prod_contentView() end");
		
		return dto;
	}
	
	@Override
//	회원이 보는 상세페이지 
	public prodDto prod_member_contentview(HashMap<String, String> param) {
		log.info("@# prodserviceImpl.prod_member_contentview() start");
		
		prodDao dao = sqlSession.getMapper(prodDao.class);
		prodDto dto = dao.prod_member_contentview(param);
		
		log.info("@# prodserviceImpl.prod_member_contentview() end");
		
		return dto;
	}
	
	@Override
//	관리자 업로드 값 수정 메소드
	public void prod_modify(HashMap<String, String> param) {
		log.info("@# prodserviceImpl.prod_modify() start");
		
		prodDao dao = sqlSession.getMapper(prodDao.class);
		dao.prod_modify(param);
		
		log.info("@# prodserviceImpl.prod_modify() end");
	}

	
	@Override
//	관리자 업로드 된 값 삭제 메소드
	public void prod_delete(HashMap<String, String> param) {
		log.info("@# prodserviceImpl.prod_delete() start");
		
		prodDao dao = sqlSession.getMapper(prodDao.class);
		dao.prod_delete(param);
		
		log.info("@# prodserviceImpl.prod_delete() end");
	}
	
	@Override
//	관리자 업로드 된 파일 삭제 메소드
	public void prod_deleteFile(HashMap<String, String> param) {
		log.info("prodserviceImpl.prod_deleteFile() start");
		
		prodDao dao = sqlSession.getMapper(prodDao.class);
		dao.prod_deleteFile(param);
		
		log.info("prodserviceImpl.prod_deleteFile() end");
	}
	
	@Override
//	회원이 보는 상의 상품목록 
	public ArrayList<prodDto> prod_member_TopList(Criteria cri) {
		log.info("@@## prodserviceImpl.prod_member_TopList(Criteria cri) start");
		
		prodDao dao = sqlSession.getMapper(prodDao.class);
		
		log.info("@@## prodserviceImpl.prod_member_TopList(Criteria cri) end");
		
		return dao.prod_member_TopList(cri);
	}
	
	@Override
//	회원이 보는 상품목록 페이징
	public int prod_getTotalCount(Criteria cri) {
		log.info("prodserviceImpl.getTotalCount() start");
		
		prodDao dao = sqlSession.getMapper(prodDao.class);
		
		log.info("prodserviceImpl.getTotalCount() end");
		return dao.prod_getTotalCount();
	}
	
	@Override
//	회원이 보는 상의 상품목록 페이징
	public int prod_getTotalCount_top(Criteria cri) {
		log.info("@@## prodserviceImpl.prod_getTotalCount_top(Criteria cri) start");
		prodDao dao = sqlSession.getMapper(prodDao.class);
		
		log.info("@@## prodserviceImpl.prod_getTotalCount_top(Criteria cri) end");
		return dao.prod_getTotalCount_top();
	}
	
	@Override
    public ArrayList<CategoryDto> prod_categoryList(){
        prodDao dao = sqlSession.getMapper(prodDao.class);
        ArrayList<CategoryDto> map = dao.prod_categoryList();
        return map;
    }
	@Override
    public ArrayList<prodDto> prod_categorySearch(int cat_key){
    	prodDao dao = sqlSession.getMapper(prodDao.class);
    	return dao.prod_categorySearch(cat_key);
    }
    @Override
    public ArrayList<prodDto> prod_categoryTotalSearch(int cat_key){
    	prodDao dao = sqlSession.getMapper(prodDao.class);
    	return dao.prod_categoryTotalSearch(cat_key);
    }
	@Override
	public ArrayList<QnADto> qna_list(board_Criteria cri) {
		
		QnADao dao = sqlSession.getMapper(QnADao.class);

		System.out.println("List:::");
		return 	dao.qna_listWithPaging(cri);
	}
	@Override
	public int qna_getTotalCount(board_Criteria cri) {
		
		QnADao dao = sqlSession.getMapper(QnADao.class);
		
		return dao.qna_getTotalCount(cri);
	}
	@Override
	public ArrayList<prodDto> prod_main_list() {

		prodDao dao = sqlSession.getMapper(prodDao.class);
		         
		return dao.prod_main_list();
	   } 
}
