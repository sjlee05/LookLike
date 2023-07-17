package com.lgy.projectfinal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.lgy.projectfinal.dto.QnaJoinProduct;
import com.lgy.projectfinal.dto.CartJoinProduct;
import com.lgy.projectfinal.dto.CategoryDto;
import com.lgy.projectfinal.dto.WishJoinProduct;
import com.lgy.projectfinal.dto.custdto;
import com.lgy.projectfinal.dto.myPageCountDto;
import com.lgy.projectfinal.dto.totalOrderDto;

public interface custDao {
	
	public custdto cust_idFind(HashMap<String, String> param);
	public custdto cust_loginYn(String cust_id);
	public void cust_write(HashMap<String, String> param);
	public custdto cust_idCheck(String cust_id);
	public void cust_addCart(HashMap<String, String> param);
	public ArrayList<CartJoinProduct> cust_cartList(int cust_key);
	public void cust_cartDelete(@Param("cust_key") int cust_key, @Param("prod_key") int prod_key);
	public void cust_addWish(HashMap<String, String> param);
	public ArrayList<WishJoinProduct> cust_wishList(int cust_key);
	public void cust_wishDelete(@Param("cust_key") int cust_key, @Param("prod_key") int prod_key);
	public custdto cust_userImport(String cust_id);
	public ArrayList<QnaJoinProduct> cust_qnaList(String cust_id);
	public void cust_totalOrder(HashMap<String, String> param);
	public ArrayList<totalOrderDto> cust_orderView(String cust_id);
	public void cust_naverReg(HashMap<String, String> param);
	public custdto cust_emailCheck(String cust_email);
	public void cust_payCancelStatus(String merchant);
	public void cust_payCancelSuccess(String merchant);
	public void cust_phoneUpdate(@Param("cust_phone") String cust_phone, @Param("cust_key") String cust_key);
	public void cust_addrUpdate(@Param("cust_addr") String cust_addr, @Param("cust_key") String cust_key);
	public void cust_countdown(@Param("ord_count") int ord_count,@Param("prod_name") String prod_name);
	public void cust_countBack(String ord_merchant);
	public String cust_pwdCheck(String cust_email);
	public void cust_kakaoReg(HashMap<String, String> param);
	public String cust_pwFind(@Param("cust_id") String cust_id, @Param("cust_email") String cust_email);
	public void changePassword(@Param("cust_pwd") String cust_pwd, @Param("cust_email") String cust_email);
	public void cust_userDelete(String cust_id);
	public void cust_userUpdate(HashMap<String, String> param);
	public void cust_delivery(String merchant); //배송중 상태
	public void cust_deliverycheck(String merchant); //배송완료 상태 
	public ArrayList<myPageCountDto> cust_myPageCount(String cust_id);
	public void cust_cartCountUpdate(@Param("cart_count") String cart_count, @Param("prod_key") String prod_key);
	public ArrayList<totalOrderDto> cust_orderContent(String ord_merchant);
}
