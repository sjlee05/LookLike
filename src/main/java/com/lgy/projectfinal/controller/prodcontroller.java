
package com.lgy.projectfinal.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lgy.projectfinal.dao.custDao;
import com.lgy.projectfinal.dao.prodDao;
import com.lgy.projectfinal.dto.CategoryDto;
import com.lgy.projectfinal.dto.Criteria;
import com.lgy.projectfinal.dto.PageDTO;
import com.lgy.projectfinal.dto.board_Criteria;
import com.lgy.projectfinal.dto.board_pageDTO;
import com.lgy.projectfinal.dto.custdto;
import com.lgy.projectfinal.dto.prodDto;
import com.lgy.projectfinal.service.CustService;
import com.lgy.projectfinal.service.prodservice;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Slf4j
public class prodcontroller {
	@Autowired
	private prodservice service;

	@Autowired
	private CustService custService;

	@Autowired
	private SqlSession sqlSession;

//	관리자가 보는 상품목록
	@RequestMapping("/prod_list")
	public String prod_list(Criteria cri, Model model) {
		log.info("@@@### prodcontroller prod_list");
		log.info("@@@### prodcontroller prod_list cri ===>" + cri);

		ArrayList<prodDto> prod_list = service.prod_list(cri);

		for (prodDto dto : prod_list) {
			String thumbnailPath = dto.getProd_thumbnailPath();
			if (thumbnailPath != null) {
				String[] thumbnailPaths = thumbnailPath.split(",");
				if (thumbnailPaths.length > 0) {
					thumbnailPaths[0] = "\\img" + thumbnailPaths[0];
					dto.setProd_thumbnailPath(thumbnailPaths[0]);
				}
			}
		}

		model.addAttribute("list", prod_list);
		int total = service.prod_getTotalCount(cri);

		log.info("@# prodcontroller prod_list total ===>" + total);

		model.addAttribute("pageMaker", new PageDTO(total, cri));

		return "prod_list";
	}

//  회원이 보는 상품목록 
  @RequestMapping("/prod_member_list")
  public String prod_member_list(Model model) {
//     페이징 처리하는 부분
     log.info("@@@### prodcontroller member_list");

     
     ArrayList<prodDto> prod_member_list = service.prod_main_list();
     
     for (prodDto dto : prod_member_list) {
//          String thumbnailPath = dto.getProd_thumbnailPath();
          String thumbnailPath = dto.getProd_imgPath();
          if (thumbnailPath!=null) {
           String[] thumbnailPaths = thumbnailPath.split(",");
                 if(thumbnailPaths.length > 0) {
                thumbnailPaths[0] = "\\img" + thumbnailPaths[0];
//                dto.setProd_thumbnailPath(thumbnailPaths[0]);
                dto.setProd_imgPath(thumbnailPaths[0]);
               }
          }
     }
     
     model.addAttribute("prod_member_list", prod_member_list);
  
     
     return "prod_member_list";
  }

//	회원이 보는 상의 상품목록
	@RequestMapping("/prod_member_TopList")
	public String prod_member_TopList(@RequestParam(name="cat_key", defaultValue = "1") int cat_key, Criteria cri, Model model) {
		log.info("@# prodcontroller prod_member_TopList start~!!");
		log.info("@# TopList cat_key : "+cat_key);
		ArrayList<prodDto> prod_member_TopList = null;
		if (cat_key<10) {
			log.info("@# TopList cat_key < 10");
			prod_member_TopList = service.prod_categoryTotalSearch(cat_key);
		}else {
			log.info("@# TopList cat_key > 10");
			prod_member_TopList = service.prod_categorySearch(cat_key);
		}
		
		log.info("@# TopList : "+prod_member_TopList);
		for (prodDto dto : prod_member_TopList) {
			String thumbnailPath = dto.getProd_imgPath();
			if (thumbnailPath != null) {
				String[] thumbnailPaths = thumbnailPath.split(",");
				if (thumbnailPaths.length > 0) {
					thumbnailPaths[0] = "\\img" + thumbnailPaths[0];
			        dto.setProd_imgPath(thumbnailPaths[0]);
				}
			}
		}
		model.addAttribute("cat_key", cat_key);
		model.addAttribute("prod_member_TopList", prod_member_TopList);
		int total = service.prod_getTotalCount_top(cri);
		
		log.info("@@@### prodcontroller prod_member_TopList total ===>"+total);
		
		model.addAttribute("pageMaker", new PageDTO(total,cri));
		
		return "prod_member_TopList";
	}


//	관리자가 보는 검색기능
	@RequestMapping("/prod_search")
	public String prod_search(HttpServletRequest request, Model model) {
		log.info("@@@### prodcontroller prod_search()");
		
		prodDao dao = sqlSession.getMapper(prodDao.class);
		ArrayList<prodDto> prod_search = service.prod_search(request.getParameter("keyword"));

		for (prodDto dto : prod_search) {
			String thumbnailPath = dto.getProd_thumbnailPath();
			if (thumbnailPath != null) {
				String[] thumbnailPaths = thumbnailPath.split(",");
				if (thumbnailPaths.length > 0) {
					thumbnailPaths[0] = "\\img" + thumbnailPaths[0];
					dto.setProd_thumbnailPath(thumbnailPaths[0]);
				}
			}
		}

		model.addAttribute("search", prod_search);
		log.info("@@@### prodcontroller prod_search()  search ======> "
				+ dao.prod_search(request.getParameter("keyword")));

		return "prod_search";
	}

//	회원이 보는 전체 상품목록 검색 기능
	@RequestMapping("/prod_member_search")
	public String prod_member_search(HttpServletRequest request, Model model) {
		log.info("@@@### prodcontroller prod_member_search()");
		
		prodDao dao = sqlSession.getMapper(prodDao.class);
		ArrayList<prodDto> prod_member_search = service.prod_member_search(request.getParameter("keyword"));

		for (prodDto dto : prod_member_search) {
			String thumbnailPath = dto.getProd_imgPath();
			if (thumbnailPath != null) {
				String[] thumbnailPaths = thumbnailPath.split(",");
				if (thumbnailPaths.length > 0) {
					thumbnailPaths[0] = "\\img" + thumbnailPaths[0];
					dto.setProd_imgPath(thumbnailPaths[0]);
				}
			}
		}

		model.addAttribute("search", prod_member_search);
		log.info("@@@### prodcontroller prod_member_search()  search ======> "
				+ dao.prod_search(request.getParameter("keyword")));

		return "prod_member_search";
	}


//	관리자 상품등록
	@RequestMapping("/prod_write")
	public String prod_write(@RequestParam HashMap<String, String> param,
			@RequestParam("uploadFile") MultipartFile[] uploadFiles) {
		log.info("@@@### prodcontroller prod_write()");
		prod_uploadFile(param, uploadFiles);
		service.prod_write(param);

		return "redirect:prod_list";
	}

//  관리자 상품등록 뷰
	@RequestMapping("/prod_itemWrite")
	public String prod_itemWrite(Model model) {
		log.info("@@@### prodcontroller prod_itemWrite()");
		ArrayList<CategoryDto> categoryList = service.prod_categoryList();
		log.info("@# Category list : " + categoryList);
		model.addAttribute("categoryList", categoryList);

		return "prod_itemWrite";
	}

// 관리자가 보는 상품수정 및 삭제 상세페이지 뷰
	@RequestMapping("/prod_content_view")
	public String prod_content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@@@### prodcontroller prod_content_view() ");

		prodDto dto = service.prod_contentView(param);

		if (dto.getProd_imgPath() != null) {
			String[] imgs = dto.getProd_imgPath().split(", ");

			for (int i = 0; i < imgs.length; i++) {
				imgs[i] = "\\img" + imgs[i];
			}

			model.addAttribute("imgs", imgs);

			for (int i = 0; i < imgs.length; i++) {
				System.out.println("@# prodcontroller prod_content_view imgs ===> " + imgs[i]);
			}

		}

		model.addAttribute("prod_content_view", dto);

		return "prod_content_view";
	}

// 회원이 보는 상세페이지
	@RequestMapping("/prod_member_content_view")
	public String prod_member_content_view(@RequestParam HashMap<String, String> param, Model model,
			HttpSession session, board_Criteria cri) {
		log.info("@# prod_member_content_view");

		String cust_id = (String) session.getAttribute("cust_id");
		model.addAttribute("cust_id", cust_id);

		prodDto dto = service.prod_member_contentview(param);

		if (dto.getProd_imgPath() != null) {
			String[] imgs = dto.getProd_imgPath().split(", ");

			for (int i = 0; i < imgs.length; i++) {
				imgs[i] = "\\img" + imgs[i];
			}

			model.addAttribute("imgs", imgs);

			for (int i = 0; i < imgs.length; i++) {
				System.out.println("@# prodcontroller prod_member_content_view imgs ===> " + imgs[i]);
			}

		}

		model.addAttribute("prod_member_content_view", dto);

		model.addAttribute("list", service.qna_list(cri));
		int total = service.qna_getTotalCount(cri);
		model.addAttribute("pageMaker", new board_pageDTO(total, cri));

		return "prod_member_content_view";
	}

//	관리자 수정 메소드
	@RequestMapping("prod_modify")
	public String prod_modify(@RequestParam HashMap<String, String> param,
			@RequestParam("uploadFile") MultipartFile[] uploadFiles) {
		log.info("@# modify");

		prodDto dto = service.prod_contentView(param);
		boolean hasFiles = false; // 파일 첨부 여부를 저장할 변수

		for (MultipartFile file : uploadFiles) {
			if (!file.isEmpty()) {
				hasFiles = true;
				break;
			}
		}

		if (hasFiles) {
			if (dto.getProd_imgPath() != null) {
				String[] imgs = dto.getProd_imgPath().split(", ");
				String[] s_imgs = dto.getProd_thumbnailPath().split(", ");
				for (String fileName : imgs) {
					System.out.println("@# 게시글 삭제할 때 파일 이름 ===> " + fileName);
					prod_deleteFile(param, fileName);
				}
				for (String fileName : s_imgs) {
					System.out.println("@# 게시글 삭제할 때 썸네일 파일 이름 ===> " + fileName);
					prod_deleteFile(param, fileName);
				}
			}
			prod_uploadFile(param, uploadFiles);
		}

		service.prod_modify(param);

		return "redirect:prod_list";
	}

//	관리자 업로드된 상세페이지 삭제 메소드
	@RequestMapping("/prod_delete")
	public String prod_delete(@RequestParam HashMap<String, String> param) {
		log.info("@@@### prodcontroller prod_delete()");

		prodDto dto = service.prod_contentView(param);

		if (dto.getProd_imgPath() != null) {
			String[] imgs = dto.getProd_imgPath().split(", ");
			String[] s_imgs = dto.getProd_thumbnailPath().split(", ");
			for (String fileName : imgs) {
				System.out.println("@# 게시글 삭제할 때 파일 이름 ===> " + fileName);
				prod_deleteFile(param, fileName);
			}
			for (String fileName : s_imgs) {
				System.out.println("@# 게시글 삭제할 때 썸네일 파일 이름 ===> " + fileName);
				prod_deleteFile(param, fileName);
			}
		}

		service.prod_delete(param);

		return "redirect:prod_list";
	}

//	관리자 업로드 된 파일(+경로) 삭제 메소드
	@PostMapping("/prod_deleteFile")
	@ResponseBody
	public ResponseEntity<String> prod_deleteFile(@RequestParam HashMap<String, String> param,
			@RequestParam("fileName") String fileName) {
		log.info("@@@### deleteFile ====> start");

		try {
			prodDto dto = service.prod_contentView(param);

			String filePath = fileName.replace("\\img", "");

//			DB 업데이트 처리
			String save_prodImgPath = dto.getProd_imgPath().replace(", " + filePath, "").replace(filePath + ", ", "")
					.replace(filePath, "");
			System.out.println(" prod_delete 파일 경로 데이터 ====>" + save_prodImgPath);
			param.put("save_prodImgPath", save_prodImgPath);

			String imgName = filePath.substring(12);
			String save_prodImg = dto.getProd_img().replace(", " + imgName, "").replace(imgName + ", ", "")
					.replace(imgName, "");
			param.put("save_prodImg", save_prodImg);

			String thumbnail = "s_" + filePath.substring(12);
			String save_prod_thumbnail = dto.getProd_thumbnail().replace(", " + thumbnail, "")
					.replace(thumbnail + ", ", "").replace(thumbnail, "");
			param.put("save_prod_thumbnail", save_prod_thumbnail);

			String date = filePath.substring(0, 12);
			String filesub = "s_" + filePath.substring(12);
			String thumbnailPath = date + filesub;
			System.out.println("썸네일 데이터 이름 =======>" + thumbnailPath);
			String save_prod_thumbnailPath = dto.getProd_thumbnailPath().replace(", " + thumbnailPath, "")
					.replace(thumbnailPath + ", ", "").replace(thumbnailPath, "");
			param.put("save_prod_thumbnailPath", save_prod_thumbnailPath);

			service.prod_deleteFile(param);

//			파일 삭제 처리
			System.out.println("fileName 입니다..." + filePath);
//			학원
			File file = new File("D:\\dev\\looklike" + filePath);
//			집
//			File file = new File("C:\\dev\\looklike"+filePath);
			file.delete();

			date = fileName.substring(0, 16);
			filesub = "s_" + fileName.substring(16);
			System.out.println("@# date ===>" + date);
			System.out.println("@# filesub ===>" + filesub);
//			학원
			String largeFileName = "D:\\dev\\looklike" + (date + filesub).replace("\\img", "");
//			집
//			String largeFileName = "C:\\dev\\looklike"+(date+filesub).replace("\\img", "");
			System.out.println("largeFileName 입니다... " + largeFileName);
			file = new File(largeFileName);

			if (file.exists()) {
				if (file.delete()) {
					System.out.println("파일 삭제 성공: " + largeFileName);
					return new ResponseEntity<String>("200", HttpStatus.OK);
				} else {
					System.out.println("파일 삭제 실패: " + largeFileName);
					return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
				}
			} else {
				System.out.println("파일이 존재하지 않습니다:  " + largeFileName);
				return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

//	관리자 업로드 파일 경로 및 폴더 생성 메소드
	public void prod_uploadFile(@RequestParam HashMap<String, String> param,
			@RequestParam("uploadFile") MultipartFile[] uploadFiles) {
		log.info("@@@### prodcontroller prod_uploadFile()");

//		학원
		String uploadFolder = "D:\\dev\\looklike";
//		집
//		String uploadFolder = "C:\\dev\\looklike";

//	    현재 날짜 폴더 생성
		LocalDate currentDate = LocalDate.now();
		String dateFolder = currentDate.toString();
		String uploadPath = uploadFolder + File.separator + dateFolder;
//
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		List<String> save_prodImg = new ArrayList<>(); // 파일명 목록을 저장할 리스트
		List<String> save_prodImgPath = new ArrayList<>(); // 파일 경로 목록을 저장할 리스트
		List<String> save_prod_thumbnail = new ArrayList<>(); // 썸네일 파일명
		List<String> save_prod_thumbnailPath = new ArrayList<>(); // 썸네일 파일경로

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
					save_prodImg.add(saveFileName); // 파일명을 리스트에 추가
					save_prodImgPath.add((uploadPath + File.separator + saveFileName).substring(15)); // 파일 경로를 리스트에 추가

					String thumbnailFileName = "s_" + saveFileName;
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, thumbnailFileName));
					Thumbnailator.createThumbnail(uploadFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
					save_prod_thumbnail.add(thumbnailFileName);
					save_prod_thumbnailPath.add((uploadPath + File.separator + thumbnailFileName).substring(15));
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		}

		if (save_prodImg != null) {
			// 파일명 리스트를 param 매개변수에 추가
			param.put("save_prodImg", save_prodImg.toString().replace("[", "").replace("]", ""));
			param.put("save_prodImgPath", save_prodImgPath.toString().replace("[", "").replace("]", ""));

			param.put("save_prod_thumbnail", save_prod_thumbnail.toString().replace("[", "").replace("]", ""));
			param.put("save_prod_thumbnailPath", save_prod_thumbnailPath.toString().replace("[", "").replace("]", ""));
		}
	}

	@RequestMapping("cust_addCart")
	public String cust_addCart(@RequestParam HashMap<String, String> param) {
		log.info("@# addCart param : " + param);
		custdto dto = custService.cust_userImport(param.get("cust_id"));
		int cust_key = dto.getCust_key();
		String a = String.valueOf(cust_key);
		param.put("cust_key", a);
		custService.cust_addCart(param);

		return "redirect:cust_cart";
	}

	@RequestMapping("cust_addWish")
	public String cust_addWish(@RequestParam HashMap<String, String> param) {
		log.info("@# addWish param : " + param);
		custdto dto = custService.cust_userImport(param.get("cust_id"));
		int cust_key = dto.getCust_key();
		String a = String.valueOf(cust_key);
		param.put("cust_key", a);
		custService.cust_addWish(param);

		return "redirect:cust_wish";
	}

}
