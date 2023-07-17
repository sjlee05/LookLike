package com.lgy.projectfinal.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.projectfinal.dao.custDao;
import com.lgy.projectfinal.dto.CartJoinProduct;
import com.lgy.projectfinal.dto.QnaJoinProduct;
import com.lgy.projectfinal.dto.WishJoinProduct;
import com.lgy.projectfinal.dto.custdto;
import com.lgy.projectfinal.dto.myPageCountDto;
import com.lgy.projectfinal.dto.totalOrderDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CustServiceImpl implements CustService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public custdto  cust_idFind(HashMap<String, String> param) {
		
	    custDao dao = sqlSession.getMapper(custDao.class);
	    custdto dto = dao.cust_idFind(param);
	    return dto != null ? dto : new custdto(); // null 대신 빈 custdto 객체를 반환하도록 수정
	}

	
	public custdto cust_loginYn(String cust_id) {
		custDao dao = sqlSession.getMapper(custDao.class);
		
		return dao.cust_loginYn(cust_id);
	}

	
	public void cust_write(HashMap<String, String> param) {
		custDao dao = sqlSession.getMapper(custDao.class);
		
		dao.cust_write(param);
	}

	
	public custdto cust_idCheck(String cust_id) {
		custDao dao = sqlSession.getMapper(custDao.class);
		
		return dao.cust_idCheck(cust_id);
	}
	
	public void cust_addCart(HashMap<String, String> param){		
		custDao dao = sqlSession.getMapper(custDao.class);
		
		dao.cust_addCart(param);
	}
	
	
	public ArrayList<CartJoinProduct> cust_cartList(int cust_key) {
		log.info("@# BServiceImpl.cartList() start");
		
		custDao dao = sqlSession.getMapper(custDao.class);
		ArrayList<CartJoinProduct> cartList = dao.cust_cartList(cust_key);
		
		log.info("@# BServiceImpl.cartList() end");
		
		return cartList;
	}
	
	public void cust_cartDelete(int cust_key, int prod_key) {
		log.info("@# cartDelete , cust/prod_key : "+cust_key+", "+prod_key);
		
		custDao dao = sqlSession.getMapper(custDao.class);
		dao.cust_cartDelete(cust_key, prod_key);
	}
	
	public void cust_addWish(HashMap<String, String> param){
		
		custDao dao = sqlSession.getMapper(custDao.class);
		dao.cust_addWish(param);
	}
	
	public ArrayList<WishJoinProduct> cust_wishList(int cust_key) {
		log.info("@# BServiceImpl.wishList() start");
		
		custDao dao = sqlSession.getMapper(custDao.class);
		ArrayList<WishJoinProduct> wishList = dao.cust_wishList(cust_key);
		
		log.info("@# BServiceImpl.wishList() end");
		
		return wishList;
	}
	
	public void cust_wishDelete(@Param("cust_key") int cust_key, @Param("prod_key") int prod_key) {
		log.info("@# wishDelete , cust/prod_key : "+cust_key+prod_key);
		
		custDao dao = sqlSession.getMapper(custDao.class);
		dao.cust_wishDelete(cust_key, prod_key);
	}

	
	public custdto cust_userImport(String cust_id) {
		log.info("@# CustService - userImport");
		
		custDao dao = sqlSession.getMapper(custDao.class);
		custdto dto = dao.cust_userImport(cust_id);
		
		return dto;
	}
	
	public ArrayList<QnaJoinProduct> cust_qnaList(String cust_id) {
		log.info("@# BServiceImpl.boardList() start");
		
		custDao dao = sqlSession.getMapper(custDao.class);
		ArrayList<QnaJoinProduct> boardList = dao.cust_qnaList(cust_id);
		
		log.info("@# BServiceImpl.boardList() end");
		
		return boardList;
	}
	
	public void cust_totalOrder(HashMap<String, String> param) {
		log.info("@# totalOrder");
		
		custDao dao = sqlSession.getMapper(custDao.class);
		dao.cust_totalOrder(param);
		
	}

	
	public ArrayList<totalOrderDto> cust_orderView(String cust_id) {
		log.info("@# orderView");
		
		custDao dao = sqlSession.getMapper(custDao.class);
		ArrayList<totalOrderDto> orderView = dao.cust_orderView(cust_id);
		
		return orderView;
	}

	@Override
	public void cust_naverReg(HashMap<String, String> param) {
		String cust_name = param.get("cust_name");
		String cust_email = param.get("cust_email");
		log.info("@# Service - cust_name : "+cust_name); 
		log.info("@# Service - cust_email : "+cust_email); 
		custDao dao = sqlSession.getMapper(custDao.class);
		dao.cust_naverReg(param);
		
		log.info("@# Service - end"); 
	}
	@Override
	public custdto cust_emailCheck(String cust_email) {
		custDao dao = sqlSession.getMapper(custDao.class);
		return dao.cust_emailCheck(cust_email);
	}
	@Override
	public void cust_payCancelStatus(String merchant){
		custDao dao = sqlSession.getMapper(custDao.class);
		dao.cust_payCancelStatus(merchant);
	}
	@Override
	public void cust_payCancelSuccess(String merchant){
		custDao dao = sqlSession.getMapper(custDao.class);
		dao.cust_payCancelSuccess(merchant);
	}
	@Override
	public void cust_phoneUpdate(String cust_phone, String cust_key) {
		custDao dao = sqlSession.getMapper(custDao.class);
		dao.cust_phoneUpdate(cust_phone, cust_key);
	}
	@Override
	public void cust_addrUpdate(String cust_addr, String cust_key) {
		custDao dao = sqlSession.getMapper(custDao.class);
		dao.cust_addrUpdate(cust_addr, cust_key);
	}

	@Override
	public void cust_countdown(int ord_count, String prod_name) {
		custDao dao = sqlSession.getMapper(custDao.class);
		dao.cust_countdown(ord_count, prod_name);
	}
	@Override
	public void cust_countBack(String ord_merchant) {
		custDao dao = sqlSession.getMapper(custDao.class);
		dao.cust_countBack(ord_merchant);
	}
	@Override
	public String cust_pwdCheck(String cust_email) {
		custDao dao = sqlSession.getMapper(custDao.class);
		String pwd = dao.cust_pwdCheck(cust_email);
		return pwd;
	}

	@Override
	public void cust_kakaoReg(HashMap<String, String> param) {
		String cust_name = param.get("cust_name");
		String cust_email = param.get("cust_email");
		log.info("@# Service - cust_name : "+cust_name); 
		log.info("@# Service - cust_email : "+cust_email); 
		custDao dao = sqlSession.getMapper(custDao.class);
		dao.cust_kakaoReg(param);
		log.info("@# Service - end");
		
	}
	@Override
	public String cust_pwFind(@Param("cust_id") String cust_id, @Param("cust_email") String cust_email) {
		custDao dao = sqlSession.getMapper(custDao.class);
		return dao.cust_pwFind(cust_id, cust_email);
	}
	@Override
	public void changePassword(@Param("cust_pwd") String cust_pwd, @Param("cust_email") String cust_email) {
		custDao dao = sqlSession.getMapper(custDao.class);
		dao.changePassword(cust_pwd, cust_email);
	}
	@Override
	public void cust_userDelete(String cust_id) {
		custDao dao = sqlSession.getMapper(custDao.class);
		dao.cust_userDelete(cust_id);
	}
	@Override
	public void cust_userUpdate(HashMap<String, String> param) {
		custDao dao = sqlSession.getMapper(custDao.class);
		dao.cust_userUpdate(param);
	}
	@Override
	public void cust_delivery(String merchant) {
		custDao dao = sqlSession.getMapper(custDao.class);
		dao.cust_delivery(merchant);
	}

	@Override
	public void cust_deliverycheck(String merchant) {
		custDao dao = sqlSession.getMapper(custDao.class);
		dao.cust_deliverycheck(merchant);
	}
	@Override
	public ArrayList<myPageCountDto> cust_myPageCount(String cust_id){
		custDao dao = sqlSession.getMapper(custDao.class);
		return dao.cust_myPageCount(cust_id);
	}
	@Override
	public void cust_cartCountUpdate(@Param("cart_count") String cart_count, @Param("prod_key") String prod_key) {
		custDao dao = sqlSession.getMapper(custDao.class);
		dao.cust_cartCountUpdate(cart_count, prod_key);
	}
	@Override
	public ArrayList<totalOrderDto> cust_orderContent(String ord_merchant){
		custDao dao = sqlSession.getMapper(custDao.class);
		return dao.cust_orderContent(ord_merchant);
	}
}






