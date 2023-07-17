package com.lgy.projectfinal.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lgy.projectfinal.dao.admindao;
import com.lgy.projectfinal.dto.Criteria;
import com.lgy.projectfinal.dto.PageDTO;
import com.lgy.projectfinal.dto.admindto;
import com.lgy.projectfinal.service.adminService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class adminController {

	@Autowired
	private adminService service;

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/admin_memberlist")
	public String admin_list(Criteria cri, Model model) {
		log.info("@# memberlist");
		log.info("@# cri===>" + cri);

		model.addAttribute("list", service.admin_list(cri));
		int total = service.admin_getTotalCount();

		log.info("@# total===>" + total);
		log.info("@# list===>" + service.admin_list(cri));

		model.addAttribute("pageMaker", new PageDTO(total, cri));

		return "admin_memberlist";
	}

	@RequestMapping("/admin_managerlist")
	public String admin_managerlistWithPaging(HttpSession session, Model model) {
		log.info("@# managerlist");

		String ad_id = (String) session.getAttribute("ad_id"); // 세션 받아서 변수화
		model.addAttribute("ad_id", ad_id);

		int ad_auth = service.admin_getAdAuthByAdId(ad_id);
		model.addAttribute("ad_auth", ad_auth);

		log.info("@# managerlist===>ad_auth  " + ad_auth);

		ArrayList<admindto> list = service.admin_managerlist();
		model.addAttribute("managerlist", list);

		log.info("@# managerlist===>" + list);
		return "admin_managerlist";
	}

	@RequestMapping("/admin_search")
	public String admin_search(HttpServletRequest request, Model model) {
		log.info("@#  search() ======");

		admindao dao = sqlSession.getMapper(admindao.class);
		model.addAttribute("search", dao.admin_search(request.getParameter("keyword")));

		log.info("@#  search()  search======" + dao.admin_search(request.getParameter("keyword")));
		return "admin_search";
	}

	@RequestMapping("/admin_searchmanager")
	public String admin_searchmanager(HttpServletRequest request, Model model) {
		log.info("@#  searchmanager() ======");
		
		admindao dao = sqlSession.getMapper(admindao.class);
		model.addAttribute("searchmanager", dao.admin_searchmanager(request.getParameter("keyword")));
		
		log.info("@#  searchmanager()  searchmanager======" + dao.admin_search(request.getParameter("keyword")));
		return "admin_searchmanager";
	}

	@RequestMapping("/admin_main")
	public String admin_main() {
		log.info("@# admin_main");
		return "admin_main";
	}

	@RequestMapping("/admin_nav")
	public String admin_nav() {
		log.info("@# main");
		return "admin_nav";
	}

	@RequestMapping("/admin_login")
	public String admin_login() {
		log.info("@# login");
		return "admin_login";
	}

	@RequestMapping("admin_logout")
	public String admin_logout(HttpSession session) {
		log.info("logged out");
		
		String ad_id = (String) session.getAttribute("ad_id");
		log.info("@# log out ,  cust_id : " + ad_id);
		
		session.invalidate();
		
		return "redirect:admin_loginmanager";
	}

	@RequestMapping("/admin_loginmanager")
	public String admin_loginmanager() {
		log.info("@# loginmanager");
		return "admin_loginmanager";
	}

	@RequestMapping("/admin_loginOk")
	public String admin_login_ok(HttpServletRequest request) {
		log.info("@# admin_login_ok");

		String ad_id = request.getParameter("ad_id");
		// 세션 있으면 반환, 없으면 생성
		HttpSession session = request.getSession(false);
		session.setAttribute("ad_id", ad_id);

		log.info("@# login_ok session " + ad_id);
		return "redirect:admin_managerpage";
	}

	@RequestMapping("/admin_registerOk")
	public String admin_registerOk(@RequestParam HashMap<String, String> param) {
		log.info("@# registerOk start()");

		service.admin_registerOk(param);

		log.info("@# registerOk end()");
		return "redirect:admin_loginmanager";
	}

	@RequestMapping(value = "/admin_login_yn", produces = "application/json")
	@ResponseBody
	public int admin_loginYn(HttpServletRequest request) {
		log.info("@# login_yn start()");

		String ad_id = request.getParameter("ad_id");
		String ad_pwd = request.getParameter("ad_pwd");
		admindto dtos = service.admin_loginYn(ad_id);
		
		log.info("ad_id====>   " + ad_id);
		log.info("ad_pwd====>   " + ad_pwd);
		
		int res = 0;
		if (dtos != null) {
			if (ad_pwd.equals(dtos.getAd_pwd())) {
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
		log.info("@# login_yn end()");
		return res;
	}

	@RequestMapping("/admin_managerpage")
	public String admin_managerpage(HttpSession session, Model model) {
		log.info("@# managerpage");

		String ad_id = (String) session.getAttribute("ad_id"); // 세션 받아서 변수화
		model.addAttribute("ad_id", ad_id); // 세션 넘겨줌
		
		int ad_auth = service.admin_getAdAuthByAdId(ad_id);
		model.addAttribute("ad_auth", ad_auth);
		
		if (ad_id != null) { // id 있으면 -> 로그인 상태
			log.info("@# login-success ,  session id : " + ad_id);
		}

		return "admin_managerpage";
	}

	@RequestMapping("/admin_content_view")
	public String admin_content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# admin_content_view");

		admindto dto = service.admin_contentView(param);
		model.addAttribute("manager", dto);

		return "admin_content_view";
	}

	@RequestMapping("/admin_modify")
	public String admin_modify(@RequestParam HashMap<String, String> param) {
		log.info("@# modify");

		service.admin_modify(param);

		return "redirect:admin_managerlist";
	}

	@RequestMapping("/admin_delete")
	public String admin_delete(@RequestParam HashMap<String, String> param) {
		log.info("@# delete");

		service.admin_delete(param);

		return "redirect:admin_managerlist";
	}

}
