package com.lgy.projectfinal.controller;

import java.io.UnsupportedEncodingException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lgy.projectfinal.dto.QnaJoinProduct;
import com.lgy.projectfinal.dto.SaleDto;
import com.lgy.projectfinal.dto.CartJoinProduct;
import com.lgy.projectfinal.dto.WishJoinProduct;
import com.lgy.projectfinal.dto.custdto;
import com.lgy.projectfinal.dto.myPageCountDto;
import com.lgy.projectfinal.dto.totalOrderDto;
import com.lgy.projectfinal.service.CustService;
import com.lgy.projectfinal.service.MailSendService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CustController {

	@Autowired
	private CustService service;

	@Autowired
	private MailSendService mailService;

	@RequestMapping(value = "/cust_login", produces = "application/json")
	public String cust_login(HttpSession session) {
		log.info("@# login");
		
		String cust_id = (String) session.getAttribute("cust_id");
		log.info("@# login - session : " + cust_id);
		
		if (cust_id == null) {
			return "cust_login";
		}
		return "cust_myPage";
	}

	@ResponseBody
	@RequestMapping(value = "/cust_login_yn", produces = "application/json")
//	public String login_yn(HttpServletRequest request, Model model) {
	public int cust_loginYn(HttpServletRequest request) {
		log.info("@# login_yn");

		String cust_id = request.getParameter("cust_id");
		String cust_pwd = request.getParameter("cust_pwd");
		custdto dtos = service.cust_loginYn(cust_id);
		
		int res = 0;
		if (dtos != null) {
			if (cust_pwd.equals(dtos.getCust_pwd())) {
				log.info("success");
				res = 1;
			} else {
				log.info("failed");
				res = 0;
			}
		} else {
			log.info("empty");
			res = 0;
		}
		return res;
	}

	@RequestMapping("/cust_loginOk")
	public String cust_login_ok(HttpServletRequest request) {
		log.info("@# login_ok");

		String cust_id = request.getParameter("cust_id");
		// 세션 있으면 반환, 없으면 생성
		HttpSession session = request.getSession(true);
		session.setAttribute("cust_id", cust_id);

		return "redirect:prod_member_list";
	}

	@RequestMapping("/cust_register")
	public String cust_register() {
		log.info("@# register");
		return "cust_register";
	}

	@ResponseBody
	@RequestMapping(value = "/cust_idCheck", produces = "application/json; charset=utf8")
	public int cust_idCheck(HttpServletRequest request) {
		log.info("@# idCheck");

		String cust_id = request.getParameter("cust_id");
		custdto idCheck = service.cust_idCheck(cust_id);
		int result = 0;

		if (idCheck != null) {
			result = 1;
		}

		return result;
	}

	@RequestMapping("/cust_idFind")
	public String cust_idFind(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# cust_idFind start()");

		log.info("@# param : " + param);
		
		String msg = "일치하는 정보가 없습니다.";
		if (param.isEmpty()) {
			model.addAttribute("msg", msg);
			return "find_id_form";
		} else {
			custdto dto = service.cust_idFind(param);

			log.info(dto.getCust_name());

			if (dto != null && dto.getCust_id() != null) {
				String custName = param.get("cust_name");
				String custId = dto.getCust_id();
				log.info("cust_id ===> " + custId);

				model.addAttribute("cust_name", custName);
				model.addAttribute("cust_id", custId);

				log.info("@# cust_idFind end()");

				return "findid";
			} else {
				log.info("일치하는 아이디 없음");
				return "redirect:/cust_idFind";
			}
		}
	}

	@RequestMapping("/findid")
	public String findid() {
		log.info("@# findid");
		return "cust_login";
	}

	@RequestMapping("/cust_registerOk")
	public String cust_registerOk(@RequestParam HashMap<String, String> param) {
		log.info("@# registerOk");
		service.cust_write(param);

		return "cust_login";
	}

	@RequestMapping("/cust_naverLogin.mb")
	public void cust_naverLogin() {
		StringBuffer url = new StringBuffer();
		url.append("https://nid.naver.com/oauth2.0/authorize");
		url.append("&client_id=c5n5rD0qzm2o5xTgfynx");
		url.append("&state=");
		url.append("&redirect_uri=http://localhost");
		log.info("@# naverLogin");
	}

	@RequestMapping("/cust_cart")
	public String cust_write(HttpSession session, Model model) {
		log.info("@# Cart");
		
		String cust_id = (String) session.getAttribute("cust_id");
		custdto dto = service.cust_userImport(cust_id);
		
		if (cust_id != null) {
			model.addAttribute("customer", dto);
		}
		int cust_key = dto.getCust_key();
		ArrayList<CartJoinProduct> cartList = service.cust_cartList(cust_key);
		model.addAttribute("cartList", cartList);

		return "cust_cart";
	}

	@RequestMapping("/cust_wish")
	public String cust_wish(HttpSession session, Model model) {
		log.info("@# Wish");

		String cust_id = (String) session.getAttribute("cust_id");
		model.addAttribute("cust_id", cust_id);

		custdto dto = service.cust_userImport(cust_id);
		int cust_key = dto.getCust_key();

		ArrayList<WishJoinProduct> wishList = service.cust_wishList(cust_key);
		model.addAttribute("wishList", wishList);

		return "cust_wish";
	}

	@RequestMapping("/cust_cartDelete")
	public String cust_cartDelete(@RequestParam("cust_key") int cust_key, @RequestParam("prod_key") int prod_key) {
		log.info("@# CartDelete");
		service.cust_cartDelete(cust_key, prod_key);

		return "redirect:/cust_cart";
	}

	@RequestMapping("/cust_wishDelete")
	public String cust_wishDelete(@RequestParam("cust_key") int cust_key, @RequestParam("prod_key") int prod_key) {
		log.info("@# wishDelete");
		service.cust_wishDelete(cust_key, prod_key);

		return "redirect:cust_wish";
	}

	@RequestMapping("/cust_carttest")
	public String cust_writet() {
		log.info("@# addCart");
		return "cust_cart_test";
	}

	@RequestMapping("/cust_list")
	public String cust_list(HttpSession session, Model model) {
		log.info("@# list");
		
		String cust_id = (String) session.getAttribute("cust_id"); // 세션 받아서 변수화
		model.addAttribute("cust_id", cust_id); // 세션 넘겨줌
		log.info("@# list - cust_id : " + cust_id);

		return "cust_list";
	}

	@RequestMapping("cust_sessionCheck")
	public String cust_sessionCheck(HttpSession session, Model model) {
		
		String session_id = (String) session.getAttribute("cust_id");
		model.addAttribute("cust_id", session_id); // 세션 넘겨줌
		log.info("cust_id : " + session_id);
		
		return "redirect:prod_member_list";
	}

	@RequestMapping("cust_logout")
	public String cust_logout(HttpSession session) {
		log.info("logged out");
		
		String cust_id = (String) session.getAttribute("cust_id");
		String ad_id = (String) session.getAttribute("ad_id");
		
		log.info("@# log out ,  cust_id : " + cust_id);
		log.info("@# log out ,  ad_id : " + ad_id);
		
		session.invalidate();
		
		return "redirect:prod_member_list";
	}

	@RequestMapping("/cust_prod")
	public String cust_prod(HttpSession session, Model model) {
		log.info("@# prod");
		
		String cust_id = (String) session.getAttribute("cust_id"); // 세션 받아서 변수화
		model.addAttribute("cust_id", cust_id); // 세션 넘겨줌

		return "cust_prod";
	}

	@RequestMapping("/cust_pay")
	public String cust_payTest() {
		log.info("@# payTest");
		return "cust_payTest";
	}

	// web.xml filter 3개 추가해줌
	@RequestMapping("/cust_pay_res")
	public String cust_payRes(HttpServletRequest request, Model model) {
		log.info("@# payRes");
		return "cust_pay_res";
	}

	@RequestMapping("/cust_myPage")
	public String cust_myPage(HttpSession session, Model model) {
		log.info("@# myPage");
//
		String cust_id = (String) session.getAttribute("cust_id"); // 세션 받아서 변수화
		model.addAttribute("cust_id", cust_id); // 세션 넘겨줌
		log.info("@# myPage - cust_id : " + cust_id);

		custdto dto = service.cust_userImport(cust_id);
		String cust_name = dto.getCust_name();
		model.addAttribute("cust_name", cust_name);

		ArrayList<myPageCountDto> myPageCount = service.cust_myPageCount(cust_id);
		log.info("@# myPageCount - myPageCount : " + myPageCount);
		int[] count = { myPageCount.get(0).getA(), myPageCount.get(0).getB(), myPageCount.get(0).getC(),
				myPageCount.get(0).getD() };
		model.addAttribute("count", count);

		return "cust_myPage";
	}

	@ResponseBody
	@RequestMapping(value = "/cust_totalPrice")
	public int cust_totalPrice(HttpServletRequest request) {
		log.info("@# login_yn");
		
		String prices = request.getParameter("total_price");
		int total_price = Integer.parseInt(prices);

		log.info("@# totalPrice : " + total_price);
		return total_price;
	}

	@RequestMapping("cust_csstest")
	public String cssTest() {
		return "cust_csstest";
	}

	@RequestMapping("/cust_qna")
	public String board(HttpSession session, Model model) {
		log.info("@# Qna");

		String cust_id = (String) session.getAttribute("cust_id");
		model.addAttribute("cust_id", cust_id);
		System.out.println(" qna cust_id ===>" + cust_id);

		ArrayList<QnaJoinProduct> qnaList = service.cust_qnaList(cust_id);
		model.addAttribute("qnaList", qnaList);

		for (int i = 0; i < qnaList.size(); i++) {
			System.out.println("문의 내역" + qnaList.get(i));
		}

		return "cust_qna";
	}

	@ResponseBody
	@RequestMapping(value = "/cust_totalOrder")
	public void cust_totalOrder(@RequestParam HashMap<String, String> param, HttpSession session, Model model) {
		log.info("@# totalOrder");
		log.info("@# totalOrder param : " + param);

		int ord_count = Integer.parseInt(param.get("ord_count"));
		String prod_name = param.get("prod_name");

		service.cust_countdown(ord_count, prod_name);
		service.cust_totalOrder(param);
	}

	@RequestMapping(value = "/cust_orderView")
	public String cust_orderView(HttpSession session, Model model) {
		log.info("@# orderView");

		String cust_id = (String) session.getAttribute("cust_id");
		model.addAttribute("cust_id", cust_id);
		
		ArrayList<totalOrderDto> dto = service.cust_orderView(cust_id);
		model.addAttribute("orderList", dto);
		log.info("@# orderView dto : "+dto);

		return "cust_orderView";
	}

	@RequestMapping("cust_naverlogin")
	public String cust_naverLogin2() {
		return "cust_naverlogin";
	}

	@RequestMapping("find_id_form")
	public String find_id_form() {
		log.info("@# find_id_form");
		return "find_id_form";
	}

	@RequestMapping("cust_naverReg")
	public String naverReg() {

		return "cust_naverReg";
	}

	@RequestMapping("cust_login_notnull")
	public String cust_login_notnull() {

		return "cust_login_notnull";
	}

	@RequestMapping("cust_naverReg1")
	public String naverReg(@RequestParam HashMap<String, String> param, HttpSession session) {
		String cust_name = param.get("cust_name");
		String cust_email = param.get("cust_email");
		
		log.info("@# cust_email : " + cust_email);
		log.info("@# cust_name : " + cust_name);
		
		custdto emailCheck = service.cust_emailCheck(cust_email);
		if (emailCheck != null) {
			log.info("@# naverReg - emailCheck : not null = " + emailCheck);
			String pwdCheck = service.cust_pwdCheck(cust_email);
			log.info("@# naverReg - pwdCheck : " + pwdCheck);
			if (pwdCheck.equals("kakao_pwd")) {
				return "cust_login_notnull";
			} else if (pwdCheck.equals("naver_pwd")) {
				session.setAttribute("cust_id", cust_email);
				return "redirect:prod_member_list";
			}
		}
		log.info("@# naverReg(param) run");
		service.cust_naverReg(param);

		return "redirect:prod_member_list";
	}

	@RequestMapping("/cust_kakaoReg")
	public String kakaoReg(@Param("email") String email, @Param("name") String name, Model model) {
		model.addAttribute("name", name);
		model.addAttribute("email", email);
		return "cust_kakaoReg";
	}

	@RequestMapping("cust_kakaoReg1")
	public String kakaoReg(@RequestParam HashMap<String, String> param, HttpSession session) {
		String cust_name = param.get("cust_name");
		String cust_email = param.get("cust_email");
		
		log.info("@# cust_email : " + cust_email);
		log.info("@# cust_name : " + cust_name);
		
		custdto emailCheck = service.cust_emailCheck(cust_email);
		if (emailCheck != null) {
			log.info("@# kakaoReg - emailCheck : not null = " + emailCheck);
			String pwdCheck = service.cust_pwdCheck(cust_email);
			log.info("@# kakaoReg - pwdCheck : " + pwdCheck);
			if (pwdCheck.equals("naver_pwd")) {
				return "cust_login_notnull";
			} else if (pwdCheck.equals("kakao_pwd")) {
				session.setAttribute("cust_id", cust_email);
				return "redirect:prod_member_list";
			}
		}
		log.info("@# naverReg(param) run");
		service.cust_kakaoReg(param);

		return "redirect:prod_member_list";
	}

	@ResponseBody
	@RequestMapping(value = "/emailCheck", produces = "application/json; charset=utf8")
	public int emailCheck(HttpServletRequest request) {
		log.info("@# emailCheck");

		String cust_email = request.getParameter("cust_email");
		custdto emailCheck = service.cust_emailCheck(cust_email);
		
		log.info("@# emailCheck - cust_email : " + cust_email);
		log.info("@# emailCheck - emailCheck : " + emailCheck);
		
		int result = 0;

		if (emailCheck != null) {
			result = 1;
		}
		log.info("@# emailCheck - res : " + result);
		return result;
	}

	@RequestMapping("cust_cartPay")
	public String cartPay(HttpSession session, Model model) {
		String cust_id = (String) session.getAttribute("cust_id");
		log.info("@# CartPay cust_id : " + cust_id);
		
		custdto dto = service.cust_userImport(cust_id);
		if (cust_id != null) {
			log.info("@# cartPay - dto : " + dto);
			model.addAttribute("customer", dto);
		}
		int cust_key = dto.getCust_key();
		ArrayList<CartJoinProduct> cartList = service.cust_cartList(cust_key);
		model.addAttribute("cartList", cartList);
		log.info("@# cartPay - cartList : " + cartList);

		return "cust_cartPay";
	}

	@RequestMapping("cust_payBack")
	public String payBack() {
		return "cust_payBack";
	}

	@RequestMapping("cust_payCancelStatus")
	public String payCancelStatus(HttpSession session, HttpServletRequest request, Model model) {
		String cust_id = (String) session.getAttribute("cust_id");
		model.addAttribute("cust_id", cust_id);

		String ord_merchant = request.getParameter("ord_merchant");
		service.cust_payCancelStatus(ord_merchant);

		return "redirect:/cust_orderView";
	}

	@RequestMapping("cust_payCancel")
	public String payCancel(@RequestParam("ord_merchant") String ordMerchant, HttpServletRequest request, Model model) {

		String token = getPaymentToken();
		String ord_merchant = ordMerchant;
		model.addAttribute("token", token);
		
		log.info("@# payCancel - token : " + token);
		log.info("@# payCancel - ord_merchant : " + ord_merchant);
		
		try {
			cancelPay(token, ord_merchant);
			service.cust_payCancelSuccess(ord_merchant);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/sale_list";
	}

	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	private static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	private static final String KEY = "3680213534225881";
	private static final String SECRET = "YGnl7UMeperMnNl5b8JdGvAF7xSkDl2CLRo9fO2s4o3smQoxtW6jbzmD5SnFtwof2dknqe4v3uLgqs7U";

	// 아임포트 인증(토큰)을 받아주는 함수
	public String getPaymentToken() {
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL);
		post.setHeader("Content-Type", "application/json");

		Map<String, String> requestData = new HashMap<String, String>();
		requestData.put("imp_key", KEY);
		requestData.put("imp_secret", SECRET);

		try {
			ObjectMapper mapper = new ObjectMapper();
			String requestBody = mapper.writeValueAsString(requestData);
			post.setEntity(new StringEntity(requestBody));

			HttpResponse response = client.execute(post);
			String responseBody = EntityUtils.toString(response.getEntity());

			JsonNode rootNode = mapper.readTree(responseBody);
			String token = rootNode.get("response").get("access_token").asText();

			return token;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int cancelPay(String token, String merchantUid) {
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_CANCEL_URL);
		post.setHeader("Content-Type", "application/json");
		post.setHeader("Authorization", token);

		Map<String, String> requestData = new HashMap<String, String>();
		requestData.put("merchant_uid", merchantUid);
		requestData.put("cancel_amount", "full"); // 전액 환불

		try {
			ObjectMapper mapper = new ObjectMapper();
			String requestBody = mapper.writeValueAsString(requestData);
			post.setEntity(new StringEntity(requestBody));

			HttpResponse response = client.execute(post);
			String responseBody = EntityUtils.toString(response.getEntity());

			JsonNode rootNode = mapper.readTree(responseBody);
			String status = rootNode.get("response").get("status").asText();

			if (status.equals("cancelled")) {
				System.err.println("환불 성공");
				return 1;
			} else {
				System.err.println("환불 실패");
				return -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@ResponseBody
	@RequestMapping("/phoneUpdate")
	public int telUpdate(HttpServletRequest request) {
		log.info("@# phoneUpdate");
		
		String cust_key = request.getParameter("cust_key");
		String cust_phone = request.getParameter("cust_phone");
		log.info("@# key, tel : " + cust_key + "," + cust_phone);
		service.cust_phoneUpdate(cust_phone, cust_key);
		
		return 0;
	}

	@ResponseBody
	@RequestMapping("/addrUpdate")
	public int addrUpdate(HttpServletRequest request) {
		log.info("@# addrUpdate");
		
		String cust_key = request.getParameter("cust_key");
		String cust_addr = request.getParameter("cust_addr");
		log.info("@# key, addr : " + cust_key + "," + cust_addr);
		service.cust_addrUpdate(cust_addr, cust_key);
		return 0;
	}

	@ResponseBody
	@RequestMapping("/countBack")
	public int countBack(HttpServletRequest request) {
		String ord_merchant = request.getParameter("ord_merchant");
		log.info("@# countBack - merchant : " + ord_merchant);

		service.cust_countBack(ord_merchant);
		log.info("@# countBack Success");

		return 0;
	}

	@RequestMapping("/cust_id_form")
	public String cust_id_form() {
		return "cust_id_form";
	}

	@RequestMapping("/cust_pw_form")
	public String cust_pw_form() {
		return "cust_pw_form";
	}

	@ResponseBody
	@RequestMapping(value = "/cust_pwFind", produces = "application/json; charset=utf8")
	public int cust_pwFind(@Param("cust_id") String cust_id, @Param("cust_email") String cust_email, Model model) {
		log.info("@# cust_pwFind ===> " + cust_id + "," + cust_email);
		String email = service.cust_pwFind(cust_id, cust_email);
		log.info("cust_email ===> " + email);
		if (email != null) {
			return 1;
		}
		log.info("@# pw_Find - email null");
		return 0;
	}

	@ResponseBody
	@PostMapping("/sendEmail")
	public String sendEmail(@RequestParam("email") String email)
			throws MessagingException, UnsupportedEncodingException {
		log.info("@# 이메일 인증 요청");
		log.info("@# 이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}

	@ResponseBody
	@PostMapping("/changePassword")
	public String changePassword(@RequestParam("email") String email) {
		String cust_pwd = getRandomPassword(10);
		log.info("@# 비밀번호 변경 - 임시 비밀번호 : " + cust_pwd);
		service.changePassword(cust_pwd, email);
		return cust_pwd;
	}

	public String getRandomPassword(int size) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
				'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&' };
		StringBuffer sb = new StringBuffer();
		SecureRandom sr = new SecureRandom();
		sr.setSeed(new Date().getTime());
		int idx = 0;
		int len = charSet.length;
		for (int i = 0; i < size; i++) {
			idx = sr.nextInt(len);
			sb.append(charSet[idx]);
		}
		return sb.toString();
	}

	@RequestMapping("/cust_myInfo")
	public String cust_myInfo(HttpSession session, Model model) {
		log.info("@# myInfo");

		String cust_id = (String) session.getAttribute("cust_id"); // 세션 받아서 변수화
		custdto dto = service.cust_userImport(cust_id);
		model.addAttribute("dto", dto);

		String cust_email = dto.getCust_email();
		String pwdCheck = service.cust_pwdCheck(cust_email);
		model.addAttribute("pwdCheck", pwdCheck);

		log.info("@# myInfo - dto : " + dto);
		log.info("@# myInfo - pwdCheck : " + pwdCheck);

		return "cust_myInfo";
	}

	@ResponseBody
	@RequestMapping("/cust_userUpdate")
	public void cust_userUpdate(@RequestParam HashMap<String, String> param) {
		log.info("@# cust_info param : " + param);
		service.cust_userUpdate(param);
	}

	@ResponseBody
	@RequestMapping("/cust_userDelete")
	public void cust_userDelete(String cust_id, HttpSession session) {
		service.cust_userDelete(cust_id);
		log.info("@# userDelete - cust_id : " + cust_id);
		session.invalidate();
		log.info("@# userDelete - session invalidate");
	}

	@RequestMapping("testetest")
	public String testest() {
		return "testest";
	}

	@RequestMapping("cust_delivery")
	public String cust_delivery(@RequestParam("ord_merchant") String ord_merchant, HttpServletRequest request,
			Model model) {
		log.info("cust_delivery start() ===");
		log.info("cust_delivery merchant ===" + ord_merchant);

		service.cust_delivery(ord_merchant);
		log.info("cust_delivery end() ===");

		return "redirect:/sale_list";
	}

	@RequestMapping("cust_deliverycheck")
	public String cust_deliverycheck(@RequestParam("ord_merchant") String ord_merchant, HttpServletRequest request,
			Model model) {
		log.info("cust_deliverycheck start() ===");
		log.info("cust_deliverycheck merchant ===" + ord_merchant);

		service.cust_deliverycheck(ord_merchant);
		log.info("cust_deliverycheck end() ===");
		return "redirect:/sale_list";
	}

	@ResponseBody
	@RequestMapping("cust_cartCountUpdate")
	public void cust_cartCountUpdate(@Param("cart_count") String cart_count, @Param("prod_key") String prod_key) {
		log.info("@# cust_cartCountUpdate count : " + cart_count);
		log.info("@# cust_cartCountUpdate key : " + prod_key);
		service.cust_cartCountUpdate(cart_count, prod_key);
	}

	@RequestMapping("cust_buyPay")
	public String buyPay(@Param("cart_count") String cart_count,@RequestParam HashMap<String, String> param, HttpSession session, Model model) {
		String cust_id = (String)session.getAttribute("cust_id");
		log.info("@# buyPay cust_id : "+cust_id);
//		model.addAttribute("cust_id", cust_id);
		custdto dto = service.cust_userImport(cust_id);
		if(cust_id!=null) {
			log.info("@# buyPay - dto : "+dto);
			model.addAttribute("customer", dto);
		}
		int cust_key = dto.getCust_key();
		model.addAttribute("ord_count", cart_count);
		log.info("@# buyPay - param : "+param.get("prod_size"));
		log.info("@# buyPay - param : "+param.get("prod_price"));
		log.info("@# buyPay - param : "+param.get("prod_name"));
		model.addAttribute("prod_price", param.get("prod_price"));
		model.addAttribute("prod_size", param.get("prod_size"));
		model.addAttribute("prod_name", param.get("prod_name"));
		model.addAttribute("prod_imgpath", param.get("prod_imgpath"));
		
		
		return "cust_buyPay";
	}

	@RequestMapping("/cust_orderContent")
	public String content_view(@Param("ord_merchant") String ord_merchant, @RequestParam HashMap<String, String> param,
			HttpSession session, Model model) {
		log.info("@# content_view");

		String cust_id = (String) session.getAttribute("cust_id");

		ArrayList<totalOrderDto> dto = service.cust_orderContent(ord_merchant);
		model.addAttribute("content_view", dto);

		return "cust_orderContent";
	}
}
