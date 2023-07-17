package com.lgy.projectfinal.controller;

import java.io.File;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lgy.projectfinal.dto.NoticeDto;
import com.lgy.projectfinal.dto.ReviewDto;
import com.lgy.projectfinal.dto.board_Criteria;
import com.lgy.projectfinal.dto.board_pageDTO;
import com.lgy.projectfinal.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ReviewController {
	@Autowired
	private ReviewService service;

	@RequestMapping("/review_list")
	public String review_list(board_Criteria cri, Model model, HttpSession session) {
		log.info("@# list");

		ArrayList<ReviewDto> list = service.review_list(cri);
		model.addAttribute("list", list);

		int total = service.review_getTotalCount(cri);

		model.addAttribute("pageMaker", new board_pageDTO(total, cri));

		String cust_id = (String) session.getAttribute("cust_id"); // 세션 받아서 변수화
		
		if (cust_id != null) { // id 있으면 -> 로그인 상태
			model.addAttribute("cust_id", cust_id); // 세션 넘겨줌
			log.info("@# success ,  session cust_id : " + cust_id);
		}
		
		String ad_id = (String) session.getAttribute("ad_id"); // 세션 받아서 변수화
		
		if (ad_id != null) { // id 있으면 -> 로그인 상태
			model.addAttribute("ad_id", ad_id); // 세션 넘겨줌
			log.info("@# success ,  session ad_id : " + ad_id);
		}

		return "review_list";
	}

	@RequestMapping("/review_write")
	public String review_write(@RequestParam HashMap<String, String> param, @RequestParam("uploadFile") MultipartFile[] uploadFiles) {

		review_uploadFile(param, uploadFiles);
		service.review_write(param);
		service.review_rating(param);

		return "redirect:review_list";
	}

	@RequestMapping("/review_write_view")
	public String review_write_view(@RequestParam HashMap<String, String> param, Model model) {

		model.addAttribute("prod_name", param.get("prod_name"));

		return "review_write_view";
	}

	@RequestMapping("/review_content_view")
	public String review_content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# content_view");

		ReviewDto dto = service.review_contentView(param);

		if (dto.getRev_imgpath() != null) {
			String[] rev_imgpathArr = dto.getRev_imgpath().split(", ");

			for (int i = 0; i < rev_imgpathArr.length; i++) {
				rev_imgpathArr[i] = "\\img" + rev_imgpathArr[i];
			}

			model.addAttribute("rev_imgpath", rev_imgpathArr);

			for (int i = 0; i < rev_imgpathArr.length; i++) {
				System.out.println("@# 컨트롤러단 rev_imgpathArr===> " + rev_imgpathArr[i]);
			}

		}
		model.addAttribute("content_view", dto);
		System.out.println("@# getCust_id ==>" + dto.getCust_id());

//		content_view.jsp 에서 pageMaker 를 가지고 페이징 처리
		model.addAttribute("pageMaker", param);

		return "review_content_view";
	}

	@RequestMapping("/review_modify")
	public String review_modify(@RequestParam HashMap<String, String> param
								,@ModelAttribute("cri") board_Criteria cri
								,RedirectAttributes rttr
								,@RequestParam("uploadFile") MultipartFile[] uploadFiles) {
		log.info("@# modify");

		ReviewDto dto = service.review_modifytView(param);
		boolean hasFiles = false; // 파일 첨부 여부를 저장할 변수

		for (MultipartFile file : uploadFiles) {
			if (!file.isEmpty()) {
				hasFiles = true;
				break;
			}
		}

		if (hasFiles) {
			if (dto.getRev_imgpath() != null) {
				String[] rev_imgpathArr = dto.getRev_imgpath().split(", ");
				for (String fileName : rev_imgpathArr) {
					System.out.println("@# 게시글 삭제할 때 파일 이름 ===>" + fileName);
					review_deleteFile(param, fileName);
				}
			}
			review_uploadFile(param, uploadFiles);
		}

		service.review_modify(param);

		return "redirect:review_list";

	}

//	@ResponseBody
	@RequestMapping("/review_modify_view")
	public String review_modify_view(@RequestParam HashMap<String, String> param
									,@ModelAttribute("cri") board_Criteria cri
									,RedirectAttributes rttr, Model model
									,@RequestParam("uploadFile") MultipartFile[] uploadFiles) {
		log.info("@# modify_view");

		ReviewDto dto = service.review_contentView(param);

		if (dto.getRev_imgpath() != null) {
			String[] rev_imgpathArr = dto.getRev_imgpath().split(", ");

			for (int i = 0; i < rev_imgpathArr.length; i++) {
				rev_imgpathArr[i] = "\\img" + rev_imgpathArr[i];
			}

			model.addAttribute("rev_imgpath", rev_imgpathArr);

			for (int i = 0; i < rev_imgpathArr.length; i++) {
				System.out.println("@# 컨트롤러단 rev_imgpathArr===> " + rev_imgpathArr[i]);
			}
		}

		System.out.println("@# getrev_imgpath ===> " + dto.getRev_imgpath());

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		model.addAttribute("pageMaker", param);
		model.addAttribute("content_view", dto);

		return "review_modify_view";

	}

	@RequestMapping("/review_delete")
	public String review_delete(@RequestParam HashMap<String, String> param
							   ,@ModelAttribute("cri") board_Criteria cri
							   ,RedirectAttributes rttr) {
		log.info("@# delete");

		ReviewDto dto = service.review_modifytView(param);

		if (dto.getRev_imgpath() != null) {
			String[] not_revpathArr = dto.getRev_imgpath().split(", ");
			for (String fileName : not_revpathArr) {
				System.out.println("@# 게시글 삭제할 때 파일 이름 ===>" + fileName);
				review_deleteFile(param, fileName);
			}
		}
		service.review_delete(param);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:review_list";

	}

	@PostMapping("/review_deleteFile")
	@ResponseBody
	public ResponseEntity<String> review_deleteFile(@RequestParam HashMap<String, String> param, @RequestParam("fileName") String fileName) {
		try {
			ReviewDto dto = service.review_modifytView(param);
			String filePath = fileName.replace("\\img", "");

//			DB 업데이트 처리
			String imgName = filePath.substring(12);
			String saveFileNames = dto.getRev_img().replace(", " + imgName, "").replace(imgName + ", ", "")
					.replace(imgName, "");
			System.out.println(" saveFileNames 파일 경로 데이터 ====>" + saveFileNames);
			param.put("saveFileNames", saveFileNames);

			String saveFilePaths = dto.getRev_imgpath().replace(", " + filePath, "").replace(filePath + ", ", "")
					.replace(filePath, "");
			param.put("saveFilePaths", saveFilePaths);

			service.review_deleteFile(param);

//			파일 삭제 처리
			System.out.println("fileName입니다::::" + filePath);
			File file = new File("D:\\dev\\looklike" + filePath);

			if (file.exists()) {
				if (file.delete()) {
					System.out.println("파일 삭제 성공: " + filePath);
					return new ResponseEntity<String>("200", HttpStatus.OK);
				} else {
					System.out.println("파일 삭제 실패: " + filePath);
					return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
				}
			} else {
				System.out.println("파일이 존재하지 않습니다: " + filePath);
				return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	public void review_uploadFile(@RequestParam HashMap<String, String> param, @RequestParam("uploadFile") MultipartFile[] uploadFiles) {
		log.info("@# uploadFile");

//	    String uploadFolder = "C:\\upload\\temp";
		String uploadFolder = "D:\\dev\\looklike";
//	    String uploadFolder = "\\img";

		// 현재 날짜 폴더 생성
		LocalDate currentDate = LocalDate.now();
		String dateFolder = currentDate.toString();
		String uploadPath = uploadFolder + File.separator + dateFolder;

		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		List<String> saveFileNames = new ArrayList<>(); // 파일명 목록을 저장할 리스트
//	    String[] saveFileNames; // 파일명 목록을 저장할 리스트
		List<String> saveFilePaths = new ArrayList<>(); // 파일 경로 목록을 저장할 리스트

		for (MultipartFile uploadFile : uploadFiles) {
			if (!uploadFile.isEmpty()) {
				log.info("-----------------------------------------------");
				log.info("파일 이름 : " + uploadFile.getOriginalFilename());
				log.info("파일 타입 : " + uploadFile.getContentType());
				log.info("파일 크기 : " + uploadFile.getSize());

				// UUID 생성
				String uuid = UUID.randomUUID().toString().replace("-", "");

				String originalFileName = uploadFile.getOriginalFilename();
				String extension = originalFileName.substring(originalFileName.lastIndexOf("."));

				String saveFileName = uuid + extension;
				File saveFile = new File(uploadPath, saveFileName);

				try {
					uploadFile.transferTo(saveFile);
					saveFileNames.add(saveFileName); // 파일명을 리스트에 추가
					saveFilePaths.add((uploadPath + File.separator + saveFileName).substring(15)); // 파일 경로를 리스트에 추가
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		}

		if (saveFileNames != null) {
			// 파일명 리스트를 param 매개변수에 추가
			param.put("saveFileNames", saveFileNames.toString().replace("[", "").replace("]", ""));
			// 파일 경로 리스트를 param 매개변수에 추가
			param.put("saveFilePaths", saveFilePaths.toString().replace("[", "").replace("]", ""));
		}
	}

	@RequestMapping("/review_reply_view")
	public String review_reply_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# reply_view");

//	    // ref, step, level 값을 파라미터에 추가
		model.addAttribute("replyNum", param);
		model.addAttribute("prod_name", param.get("prod_name"));

		return "review_reply_view";
	}

	@RequestMapping("/review_reply")
	public String review_reply(@RequestParam HashMap<String, String> param, @RequestParam("uploadFile") MultipartFile[] uploadFiles) {

		review_uploadFile(param, uploadFiles);

		service.review_reply(param);

		return "redirect:review_list";
	}

}