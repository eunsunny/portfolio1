package com.green.sunny.controller;

import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.green.sunny.admin.AdminService;
import com.green.sunny.admin.GongziService;
import com.green.sunny.admin.QuestionService;
import com.green.sunny.dto.AdminVO;
import com.green.sunny.dto.BoardVO;
import com.green.sunny.dto.GongziVO;
import com.green.sunny.dto.KindCount;
import com.green.sunny.dto.MemberVO;
import com.green.sunny.dto.MostOrderMember;
import com.green.sunny.dto.OneoneVO;
import com.green.sunny.dto.OrderVO;
import com.green.sunny.dto.ProductImageVO;
import com.green.sunny.dto.ProductVO;
import com.green.sunny.dto.QuestionVO;
import com.green.sunny.dto.ReportVO;
import com.green.sunny.utils.Criteria;
import com.green.sunny.utils.PageMaker;

@Controller
@SessionAttributes("adminUser")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private GongziService gongziService;
	@Autowired
	private QuestionService questionService;
	
	// 로그인 수행
	@RequestMapping(value="/admin_login", method=RequestMethod.POST)
	public String adminLogin(@RequestParam(value="adminId")String id,
							 @RequestParam(value="adminPassword")String pwd,
							 Model model) {
		int result = adminService.adminCheck(id, pwd);
		
		if(result == 1) {
			AdminVO adminUser = adminService.getAdmin(id);
			model.addAttribute("adminUser", adminUser);
			
			return "admin/main";
		}
		else {
			if(result == 0) {
			model.addAttribute("message", "비밀번호를 확인하세요.");
			} 
			else {
			model.addAttribute("message", "ID를 확인하세요.");				
			}
		
		return "admin/login";
		}
	}
	
	// 메인 페이지로 이동
	@RequestMapping(value="/admin_main")
	public String adminMainView(Model model) {
		int todayProduct = adminService.getTodayProduct();
		int todayOrder = adminService.getTodayOrder();
		int noOneone = adminService.getNoRepOneone();
		int noReport = adminService.getNoResultReport();
		
		model.addAttribute("todayProduct", todayProduct);
		model.addAttribute("todayOrder", todayOrder);
		model.addAttribute("noOneone", noOneone);
		model.addAttribute("noReport", noReport);
		
		return "admin/main";
	}
	
	// 최다 주문 회원 조회 메소드
	@RequestMapping(value="/most_order_chart", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<MostOrderMember> getMostOrderMember() {		
		List<MostOrderMember> mostOrder = adminService.getMostOrderMember();
		
		return mostOrder;
	}
	
	// 카테고리별 상품 갯수 조회 메소드
	@RequestMapping(value="/kind_count_chart", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<KindCount> getKindCount(){
		List<KindCount> kindCount = adminService.getKindCount();

		for(KindCount item : kindCount) {
			switch(item.getKind()) {
				case "1": item.setKind("패션의류/잡화"); break;
				case "2": item.setKind("뷰티"); break;
				case "3": item.setKind("출산/유아동"); break;
				case "4": item.setKind("식품"); break;
				case "5": item.setKind("주방/생활용품"); break;
				case "6": item.setKind("인테리어"); break;
				case "7": item.setKind("가전디지털"); break;
				case "8": item.setKind("스포츠레저"); break;
				case "9": item.setKind("자동차용품"); break;
				case "10": item.setKind("도서/음반/DVD"); break;
				case "11": item.setKind("완구/문구/취미"); break;
				case "12": item.setKind("반려동물용품"); break;
				case "13": item.setKind("헬스/건강식품"); break;
				default: break;
			}
		}
		
		return kindCount;
	}
	
	// 회원관리 페이지로 이동
	@RequestMapping(value="/member_manage")
	public String memberManageView(@RequestParam(value="key", defaultValue="")String key, Model model,
								   Criteria criteria) {
		List<MemberVO> memberList = adminService.getAllMemberPaging(criteria, key);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);	// 현재 페이지와 페이지당 항목 수 설정
		
		// 전체 게시글 수 조회
		int totalCount = adminService.getTotalMember(key);
		pageMaker.setTotalCount(totalCount);
		
		// 번호 설정
		int memberNum = 0;
		if(criteria.getPageNum() == 1) {
			memberNum = criteria.getPageNum()-1;
		}
		else {
			memberNum = criteria.getPageNum()*10 - 10;
		}
		
		model.addAttribute("memberSize", memberList.size());
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("number", memberNum);
		model.addAttribute("key", key);
		return "admin/member/member";
	}
	
	// 회원 상세보기 페이지
	@RequestMapping(value="/admin_member_detail")
	public String memberDetail(@RequestParam(value="id")String id, Model model) {
		MemberVO member = adminService.getMemberDetail(id);
		
		model.addAttribute("Member", member);
		return "admin/member/member_detail";
	}
	
	// 상품관리 페이지로 이동
	@RequestMapping(value="/product_manage")
	public String productManageView(Model model, @RequestParam(value="key", defaultValue="")String key,
									Criteria criteria) {
		List<ProductVO> prodList = adminService.getAllProductPaging(criteria, key);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);	// 현재 페이지와 페이지당 항목 수 설정
		
		// 전체 게시글 수 조회
		int totalCount = adminService.getTotalProduct(key);
		pageMaker.setTotalCount(totalCount);
		
		// 번호 설정
		int productNum = 0;
		if(criteria.getPageNum() == 1) {
			productNum = criteria.getPageNum()-1;
		}
		else {
			productNum = criteria.getPageNum()*10 - 10;
		}		
		
		model.addAttribute("productSize", prodList.size());
		model.addAttribute("productList", prodList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("number", productNum);		
		
		return "admin/product/product";
	}
	
	// 상품 상세보기 페이지
	@RequestMapping(value="admin_product_detail")
	public String productDetail(@RequestParam(value="pseq")int pseq, Model model) {
		ProductVO product = adminService.getProductDetail(pseq);
		
		// 다중 이미지 처리를 위해 만든 이미지 저장용 테이블에서 이미지들 가져오기
		List<ProductImageVO> pImageList = adminService.getProductImage(pseq);
		
		model.addAttribute("Product", product);
		model.addAttribute("productImageList", pImageList);
		
		return "admin/product/product_detail";
	}
	
	// 결제관리 페이지로 이동
	@RequestMapping(value="/order_manage")
	public String payManageView(@RequestParam(value="key", defaultValue="")String key, Criteria criteria, Model model) {
		List<OrderVO> orderList = adminService.getAllOrderPaging(criteria, key);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		int totalCount = adminService.getTotalOrder(key);
		pageMaker.setTotalCount(totalCount);
		
		// 번호 설정
		int orderNum = 0;
		if(criteria.getPageNum() == 1) {
			orderNum = criteria.getPageNum()-1;
		}
		else {
			orderNum = criteria.getPageNum()*10 - 10;
		}
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("orderSize", orderList.size());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("number", orderNum);
		
		return "admin/order/order";
	}
	
	// 게시판관리 페이지로 이동
	@RequestMapping(value="/board")
	public String boardView(@RequestParam(value="key", defaultValue="")String key, Model model, Criteria criteria) {
		List<BoardVO> boardList = adminService.getAllBoardPaging(criteria, key);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		int totalCount = adminService.getTotalBoard(key);
		pageMaker.setTotalCount(totalCount);
		
		// 번호 설정
		int boardNum = 0;
		if(criteria.getPageNum() == 1) {
			boardNum = criteria.getPageNum()-1;
		}
		else {
			boardNum = criteria.getPageNum()*10 - 10;
		}
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardSize", boardList.size());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("number", boardNum);
		
		
		return "admin/board/board";
	}
	
	// 게시판 게시글 상세보기 페이지
	@RequestMapping(value="/admin_board_detail")
	public String boardDetailView(@RequestParam(value="bseq")int bseq, Model model) {
		BoardVO board = adminService.getBoardDetail(bseq);
		
		model.addAttribute("board", board);
		
		return "admin/board/board_detail";
	}
	
	// 게시글 삭제 메소드
	@RequestMapping(value="/admin_board_delete")
	public String deleteBoard(@RequestParam(value="bseq")int bseq) {
		adminService.deleteBoard(bseq);
		
		return "redirect:/board";
	}
	
	// 공지사항 페이지로 이동
	@RequestMapping(value="/gongzi")
	public String gongziView(@RequestParam(value="key", defaultValue="")String key, Model model, Criteria criteria) {
		List<GongziVO> gongziList = gongziService.getAllGongziPaging(criteria, key);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		int totalCount = gongziService.getTotalGongzi(key);
		pageMaker.setTotalCount(totalCount);

		// 번호 설정
		int gongziNum = 0;
		if(criteria.getPageNum() == 1) {
			gongziNum = criteria.getPageNum()-1;
		}
		else {
			gongziNum = criteria.getPageNum()*10 - 10;
		}
		
		model.addAttribute("gongziList", gongziList);
		model.addAttribute("number", gongziNum);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("number", totalCount);
		
		return "admin/gongzi/gongzi";
	}
	
	// 공지사항 작성 페이지
	@RequestMapping(value="/gongzi_add")
	public String gongziAddView() {
		return "admin/gongzi/gongzi_add";
	}
	
	/*
	 * 파일 실제 저장 경로
	 * project_market\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Market_Admin\WEB-INF\resources\admin_images\
	 * */
	// 공지사항 등록 메소드
	@RequestMapping(value="/gongzi_add_action", method=RequestMethod.POST)
	public String gongziAddAction(GongziVO vo, @RequestParam(value="gongzi_image")MultipartFile uploadImage,
								  HttpSession session) {
		String fileName = "";
		
		if (!uploadImage.isEmpty()) {	// 화면에서 product_image 필드에 이미지가 입력된 경우
			fileName = uploadImage.getOriginalFilename();
			vo.setImage(fileName); // VO 객체에 이미지파일명 저장
			
			// 이미지 파일을 업로드 하기 위해 이미지 저장 실제 경로를 구한다.
			String image_path 
			= session.getServletContext().getRealPath("WEB-INF/resources/upload_images/gongzi/");
			System.out.println("이동 이미지 경로: " + image_path);
			
			try {
				File file = new File(image_path+fileName);
				uploadImage.transferTo(file); // 상품이미지 저장 경로로 이동시킴
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}	
		}
		
		gongziService.insertGongzi(vo);
		
		return "redirect:/gongzi";
	}
	
	// 공지사항 상세보기 페이지
	@RequestMapping(value="/gongzi_detail")
	public String gongziDetail(@RequestParam(value="gseq")int gseq, Model model) {
		GongziVO gongzi = gongziService.getGongzi(gseq);
		
		model.addAttribute("gongzi", gongzi);
		
		return "admin/gongzi/gongzi_detail";
	}
	
	// 공지사항 수정 페이지
	@RequestMapping(value="/gongzi_update")
	public String gongziUpdateView(@RequestParam(value="gseq")int gseq, Model model) {
		GongziVO gongzi = gongziService.getGongzi(gseq);
		
		model.addAttribute("gongzi", gongzi);
		
		return "admin/gongzi/gongzi_update";
	}
	
	// 공지사항 수정
	@RequestMapping(value="/gongzi_update_action", method=RequestMethod.POST)
	public String gongziUpdateAction(GongziVO vo, @RequestParam(value="gongzi_image")MultipartFile uploadImage,
			  						 HttpSession session) {
		String fileName = "";
		
		if (!uploadImage.isEmpty()) {	// 화면에서 product_image 필드에 이미지가 입력된 경우
			fileName = uploadImage.getOriginalFilename();
			vo.setImage(fileName); // VO 객체에 이미지파일명 저장
			
			// 이미지 파일을 업로드 하기 위해 이미지 저장 실제 경로를 구한다.
			String image_path 
			= session.getServletContext().getRealPath("WEB-INF/resources/upload_images/gongzi/");
			System.out.println("이동 이미지 경로: " + image_path);
			
			try {
				File file = new File(image_path+fileName);
				uploadImage.transferTo(file); // 상품이미지 저장 경로로 이동시킴
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}	
		}
		
		gongziService.updateGongzi(vo);
		
		return "redirect:/gongzi";
	}
	
	// 공지사항 삭제
	@RequestMapping(value="/gongzi_delete")
	public String gongziDelete(@RequestParam(value="gseq")int gseq) {
		gongziService.deleteGongzi(gseq);
		
		return "redirect:/gongzi";
	}
	
	// 자주묻는질문 페이지로 이동
	@RequestMapping(value="/usuallyask")
	public String usuallyAskView(Model model) {
		List<QuestionVO> questionList = questionService.getAllQuestion();
		
		model.addAttribute("questionList", questionList);
		return "admin/question/usuallyask";
	}
	
	// 자주묻는질문 작성 페이지 이동
	@RequestMapping(value="usuallyask_add")
	public String usuallyAskAddView() {
		return "admin/question/usuallyask_add";
	}
	
	// 자주묻는질문 작성 메소드
	@RequestMapping(value="usuallyask_add_action")
	public String usuallyAskAddAction(QuestionVO vo, @RequestParam(value="question_image")MultipartFile uploadImage,
									  HttpSession session) {
		String fileName = "";
		
		if (!uploadImage.isEmpty()) {	// 화면에서 product_image 필드에 이미지가 입력된 경우
			fileName = uploadImage.getOriginalFilename();
			vo.setImage(fileName); // VO 객체에 이미지파일명 저장
			
			// 이미지 파일을 업로드 하기 위해 이미지 저장 실제 경로를 구한다.
			String image_path 
			= session.getServletContext().getRealPath("WEB-INF/resources/upload_images/question/");
			System.out.println("이동 이미지 경로: " + image_path);
			
			try {
				File file = new File(image_path+fileName);
				uploadImage.transferTo(file); // 상품이미지 저장 경로로 이동시킴
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}	
		}
		
		questionService.insertQuestion(vo);
		
		return "redirect:/usuallyask";
	}
	
	// 자주묻는질문 수정 페이지
	@RequestMapping(value="usuallyask_update")
	public String usuallyAskUpdateView(@RequestParam(value="qseq")int qseq, Model model) {
		QuestionVO vo = questionService.getQuestion(qseq);
		model.addAttribute("Question", vo);
		
		return "admin/question/usuallyask_update";
	}
	
	// 자주묻는질문 수정 메소드
	@RequestMapping(value="usuallyask_update_action", method=RequestMethod.POST)
	public String usuallyAskUpdateAction(QuestionVO vo, @RequestParam(value="question_image")MultipartFile uploadImage,
									  HttpSession session) {
		String fileName = "";
		
		if (!uploadImage.isEmpty()) {	// 화면에서 product_image 필드에 이미지가 입력된 경우
			fileName = uploadImage.getOriginalFilename();
			vo.setImage(fileName); // VO 객체에 이미지파일명 저장
			
			// 이미지 파일을 업로드 하기 위해 이미지 저장 실제 경로를 구한다.
			String image_path 
			= session.getServletContext().getRealPath("WEB-INF/resources/upload_images/question/");
			System.out.println("이동 이미지 경로: " + image_path);
			
			try {
				File file = new File(image_path+fileName);
				uploadImage.transferTo(file); // 상품이미지 저장 경로로 이동시킴
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}	
		}
		
		questionService.updateQuestion(vo);
		
		return "redirect:/usuallyask";
	}
	
	// 자주묻는질문 삭제 메소드
	@RequestMapping(value="usuallyask_delete")
	public String usuallyaskDelete(@RequestParam(value="qseq")int qseq) {
		questionService.deleteQuestion(qseq);
		
		return "redirect:/usuallyask";
	}
	
	// 1:1 질문 페이지로 이동
	@RequestMapping(value="/oneone")
	public String oneoneView(@RequestParam(value="key", defaultValue="")String key, Model model, Criteria criteria) {
		List<OneoneVO> oneoneList = adminService.getAllOneonePaging(criteria, key);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		int totalCount = adminService.getTotalOneone(key);
		pageMaker.setTotalCount(totalCount);
		
		// 번호 설정
		int oneoneNum = 0;
		if(criteria.getPageNum() == 1) {
			oneoneNum = criteria.getPageNum()-1;
		}
		else {
			oneoneNum = criteria.getPageNum()*10 - 10;
		}
		
		model.addAttribute("oneoneList", oneoneList);
		model.addAttribute("oneoneSize", oneoneList.size());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("number", oneoneNum);
		
		return "admin/oneone/oneone";
	}
	
	// 1:1 문의 상세보기 페이지
	@RequestMapping(value="admin_oneone_detail")
	public String oneoneDetail(@RequestParam(value="onseq")int onseq, Model model) {
		OneoneVO oneone = adminService.getOneoneDetail(onseq);
		
		model.addAttribute("oneone", oneone);
		
		return "admin/oneone/oneone_detail";
	}
	
	// 1:1 문의 답변 작성 페이지
	@RequestMapping(value="oneone_reply")
	public String oneoneReplyView(@RequestParam(value="onseq")int onseq, Model model) {
		OneoneVO oneone = adminService.getOneoneDetail(onseq);
		
		model.addAttribute("oneone", oneone);
		
		return "admin/oneone/oneone_reply";
	}
	
	// 1:1 문의 답변 등록 메소드
	@RequestMapping(value="oneone_reply_action")
	public String oneoneReplyAction(OneoneVO vo) {
		adminService.updateOneoneReply(vo);
		return "redirect:/oneone";
	}
	
	// 신고관리 페이지로 이동
	@RequestMapping(value="/report")
	public String reportView(@RequestParam(value="key", defaultValue="")String key, Model model, Criteria criteria) {
		List<ReportVO> reportList = adminService.getAllReportPaging(criteria, key);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		int totalCount = adminService.getTotalReport(key);
		pageMaker.setTotalCount(totalCount);
		
		// 번호 설정
		int reportNum = 0;
		if(criteria.getPageNum() == 1) {
			reportNum = criteria.getPageNum()-1;
		}
		else {
			reportNum = criteria.getPageNum()*10 - 10;
		}
		
		model.addAttribute("reportList", reportList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("number", reportNum);
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/report/report";
	}
	
	// 신고 상세보기 페이지
	@RequestMapping(value="/admin_report_detail")
	public String reportDetail(@RequestParam(value="rseq")int rseq, Model model) {
		ReportVO report = adminService.getReportDetail(rseq);
		
		model.addAttribute("Report", report);
		
		return "admin/report/report_detail";
	}
	
	// 신고 완료 처리 메소드
	@RequestMapping(value="/admin_report_update")
	public String updateReportResult(@RequestParam(value="rseq")int rseq) {
		adminService.updateReportResult(rseq);
		
		return "redirect:/report";
	}
	
	// 로그아웃
	@RequestMapping(value="/admin_logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "admin/login";
	}
}
