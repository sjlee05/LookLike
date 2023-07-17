package com.lgy.projectfinal.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lgy.projectfinal.dto.Criteria;
import com.lgy.projectfinal.dto.SaleDto;
import com.lgy.projectfinal.dto.board_Criteria;
import com.lgy.projectfinal.dto.board_pageDTO;
import com.lgy.projectfinal.service.SaleService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SaleController {
	@Autowired
	private SaleService service;

	@RequestMapping("/sale_list")
	public String sale_list(board_Criteria cri, Model model) {
		log.info("@# list");

		model.addAttribute("list", service.sale_list(cri));
		int total = service.sale_getTotalCount(cri);

		model.addAttribute("pageMaker", new board_pageDTO(total, cri));

		return "sale_list";
	}

	@RequestMapping("/sale_content_view")
	public String content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# content_view");
		log.info("@# content_view param : "+param);
		ArrayList<SaleDto> dto = service.sale_contentView(param);
		log.info("@# content_view dto : "+dto);
		model.addAttribute("content_view", dto);
		sale_getSales(param, model);
//		content_view.jsp 에서 pageMaker 를 가지고 페이징 처리
		model.addAttribute("pageMaker", param);

		return "sale_content_view";
	}

//	@ResponseBody
	@RequestMapping("/sale_modify")
	public String modify(@RequestParam HashMap<String, String> param
						,@ModelAttribute("cri") Criteria cri
						,RedirectAttributes rttr) {
		log.info("@# modify");
		log.info("@# modify param : "+param);
		
//		service.sale_modifySales(param);
		service.sale_modify(param);

		return "redirect:sale_list";

	}

	@RequestMapping("/sale_delete")
	public String sale_delete(@RequestParam HashMap<String, String> param
							 ,@ModelAttribute("cri") board_Criteria cri
							 ,RedirectAttributes rttr) {
		log.info("@# delete");

		service.sale_delete(param);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:sale_list";

	}

	public void sale_getSales(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# getSales");

		model.addAttribute("list", service.sale_getSales(param));
	}
}