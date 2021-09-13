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
import com.green.sunny.adminUtils.Criteria;
import com.green.sunny.adminUtils.PageMaker;

@Controller
@SessionAttributes("adminUser")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private GongziService gongziService;
	@Autowired
	private QuestionService questionService;
	
	// �α��� ����
	@RequestMapping(value="/admin_login", method=RequestMethod.POST)
	public String adminLogin(@RequestParam(value="adminId")String id,
							 @RequestParam(value="adminPassword")String pwd,
							 Model model) {
		int result = adminService.adminCheck(id, pwd);
		
		if(result == 1) {
			AdminVO adminUser = adminService.getAdmin(id);
			model.addAttribute("adminUser", adminUser);
			
			return "redirect:/admin_main";
		}
		else {
			if(result == 0) {
			model.addAttribute("message", "��й�ȣ�� Ȯ���ϼ���.");
			} 
			else {
			model.addAttribute("message", "ID�� Ȯ���ϼ���.");				
			}
		
		return "admin/login";
		}
	}
	
	// ���� �������� �̵�
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
	
	// �ִ� �ֹ� ȸ�� ��ȸ �޼ҵ�
	@RequestMapping(value="/most_order_chart", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<MostOrderMember> getMostOrderMember() {		
		List<MostOrderMember> mostOrder = adminService.getMostOrderMember();
		
		return mostOrder;
	}
	
	// ī�װ��� ��ǰ ���� ��ȸ �޼ҵ�
	@RequestMapping(value="/kind_count_chart", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<KindCount> getKindCount(){
		List<KindCount> kindCount = adminService.getKindCount();

		for(KindCount item : kindCount) {
			switch(item.getKind()) {
				case "1": item.setKind("�м��Ƿ�/��ȭ"); break;
				case "2": item.setKind("��Ƽ"); break;
				case "3": item.setKind("���/���Ƶ�"); break;
				case "4": item.setKind("��ǰ"); break;
				case "5": item.setKind("�ֹ�/��Ȱ��ǰ"); break;
				case "6": item.setKind("���׸���"); break;
				case "7": item.setKind("����������"); break;
				case "8": item.setKind("����������"); break;
				case "9": item.setKind("�ڵ�����ǰ"); break;
				case "10": item.setKind("����/����/DVD"); break;
				case "11": item.setKind("�ϱ�/����/���"); break;
				case "12": item.setKind("�ݷ�������ǰ"); break;
				case "13": item.setKind("�ｺ/�ǰ���ǰ"); break;
				default: break;
			}
		}
		
		return kindCount;
	}
	
	// ȸ������ �������� �̵�
	@RequestMapping(value="/member_manage")
	public String memberManageView(@RequestParam(value="key", defaultValue="")String key, Model model,
								   Criteria criteria) {
		List<MemberVO> memberList = adminService.getAllMemberPaging(criteria, key);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);	// ���� �������� �������� �׸� �� ����
		
		// ��ü �Խñ� �� ��ȸ
		int totalCount = adminService.getTotalMember(key);
		pageMaker.setTotalCount(totalCount);
		
		// ��ȣ ����
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
	
	// ȸ�� �󼼺��� ������
	@RequestMapping(value="/admin_member_detail")
	public String memberDetail(@RequestParam(value="id")String id, Model model) {
		MemberVO member = adminService.getMemberDetail(id);
		
		model.addAttribute("Member", member);
		return "admin/member/member_detail";
	}
	
	// ��ǰ���� �������� �̵�
	@RequestMapping(value="/product_manage")
	public String productManageView(Model model, @RequestParam(value="key", defaultValue="")String key,
									Criteria criteria) {
		List<ProductVO> prodList = adminService.getAllProductPaging(criteria, key);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);	// ���� �������� �������� �׸� �� ����
		
		// ��ü �Խñ� �� ��ȸ
		int totalCount = adminService.getTotalProduct(key);
		pageMaker.setTotalCount(totalCount);
		
		// ��ȣ ����
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
	
	// ��ǰ �󼼺��� ������
	@RequestMapping(value="admin_product_detail")
	public String productDetail(@RequestParam(value="pseq")int pseq, Model model) {
		ProductVO product = adminService.getProductDetail(pseq);
		
		// ���� �̹��� ó���� ���� ���� �̹��� ����� ���̺��� �̹����� ��������
		List<ProductImageVO> pImageList = adminService.getProductImage(pseq);
		
		model.addAttribute("Product", product);
		model.addAttribute("productImageList", pImageList);
		
		return "admin/product/product_detail";
	}
	
	// �ֹ����� �������� �̵�
	@RequestMapping(value="/order_manage")
	public String orderManageView(@RequestParam(value="key", defaultValue="")String key, Criteria criteria, Model model) {
		List<OrderVO> orderList = adminService.getAllOrderPaging(criteria, key);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		int totalCount = adminService.getTotalOrder(key);
		pageMaker.setTotalCount(totalCount);
		
		// ��ȣ ����
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
	
	// �ֹ� �󼼺��� �������� �̵�
	@RequestMapping(value="admin_order_detail")
	public String orderDetail(@RequestParam(value="oseq")int oseq, Model model) {
		OrderVO order = adminService.getOrderDetail(oseq);
		
		model.addAttribute("order", order);
		return "admin/order/order_detail";
	}
	
	// �Խ��ǰ��� �������� �̵�
	@RequestMapping(value="/board")
	public String boardView(@RequestParam(value="key", defaultValue="")String key, Model model, Criteria criteria) {
		List<BoardVO> boardList = adminService.getAllBoardPaging(criteria, key);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		int totalCount = adminService.getTotalBoard(key);
		pageMaker.setTotalCount(totalCount);
		
		// ��ȣ ����
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
	
	// �Խ��� �Խñ� �󼼺��� ������
	@RequestMapping(value="/admin_board_detail")
	public String boardDetailView(@RequestParam(value="bseq")int bseq, Model model) {
		BoardVO board = adminService.getBoardDetail(bseq);
		
		model.addAttribute("board", board);
		
		return "admin/board/board_detail";
	}
	
	// �Խñ� ���� �޼ҵ�
	@RequestMapping(value="/admin_board_delete")
	public String deleteBoard(@RequestParam(value="bseq")int bseq) {
		adminService.deleteBoard(bseq);
		
		return "redirect:/board";
	}
	
	// �������� �������� �̵�
	@RequestMapping(value="/gongzi")
	public String gongziView(@RequestParam(value="key", defaultValue="")String key, Model model, Criteria criteria) {
		List<GongziVO> gongziList = gongziService.getAllGongziPaging(criteria, key);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		int totalCount = gongziService.getTotalGongzi(key);
		pageMaker.setTotalCount(totalCount);

		// ��ȣ ����
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
	
	// �������� �ۼ� ������
	@RequestMapping(value="/gongzi_add")
	public String gongziAddView() {
		return "admin/gongzi/gongzi_add";
	}
	
	/*
	 * ���� ���� ���� ���
	 * project_market\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Market_Admin\WEB-INF\resources\admin_images\
	 * */
	// �������� ��� �޼ҵ�
	@RequestMapping(value="/gongzi_add_action", method=RequestMethod.POST)
	public String gongziAddAction(GongziVO vo, @RequestParam(value="gongzi_image")MultipartFile uploadImage,
								  HttpSession session) {
		String fileName = "";
		
		if (!uploadImage.isEmpty()) {	// ȭ�鿡�� product_image �ʵ忡 �̹����� �Էµ� ���
			fileName = uploadImage.getOriginalFilename();
			vo.setImage(fileName); // VO ��ü�� �̹������ϸ� ����
			
			// �̹��� ������ ���ε� �ϱ� ���� �̹��� ���� ���� ��θ� ���Ѵ�.
			String image_path 
			= session.getServletContext().getRealPath("WEB-INF/resources/upload_images/gongzi/");
			System.out.println("�̵� �̹��� ���: " + image_path);
			
			try {
				File file = new File(image_path+fileName);
				uploadImage.transferTo(file); // ��ǰ�̹��� ���� ��η� �̵���Ŵ
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}	
		}
		
		gongziService.insertGongzi(vo);
		
		return "redirect:/gongzi";
	}
	
	// �������� �󼼺��� ������
	@RequestMapping(value="/gongzi_detail")
	public String gongziDetail(@RequestParam(value="gseq")int gseq, Model model) {
		GongziVO gongzi = gongziService.getGongzi(gseq);
		
		model.addAttribute("gongzi", gongzi);
		
		return "admin/gongzi/gongzi_detail";
	}
	
	// �������� ���� ������
	@RequestMapping(value="/gongzi_update")
	public String gongziUpdateView(@RequestParam(value="gseq")int gseq, Model model) {
		GongziVO gongzi = gongziService.getGongzi(gseq);
		
		model.addAttribute("gongzi", gongzi);
		
		return "admin/gongzi/gongzi_update";
	}
	
	// �������� ����
	@RequestMapping(value="/gongzi_update_action", method=RequestMethod.POST)
	public String gongziUpdateAction(GongziVO vo, @RequestParam(value="gongzi_image")MultipartFile uploadImage,
			  						 HttpSession session) {
		String fileName = "";
		
		if (!uploadImage.isEmpty()) {	// ȭ�鿡�� product_image �ʵ忡 �̹����� �Էµ� ���
			fileName = uploadImage.getOriginalFilename();
			vo.setImage(fileName); // VO ��ü�� �̹������ϸ� ����
			
			// �̹��� ������ ���ε� �ϱ� ���� �̹��� ���� ���� ��θ� ���Ѵ�.
			String image_path 
			= session.getServletContext().getRealPath("WEB-INF/resources/upload_images/gongzi/");
			System.out.println("�̵� �̹��� ���: " + image_path);
			
			try {
				File file = new File(image_path+fileName);
				uploadImage.transferTo(file); // ��ǰ�̹��� ���� ��η� �̵���Ŵ
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}	
		}
		
		gongziService.updateGongzi(vo);
		
		return "redirect:/gongzi";
	}
	
	// �������� ����
	@RequestMapping(value="/gongzi_delete")
	public String gongziDelete(@RequestParam(value="gseq")int gseq) {
		gongziService.deleteGongzi(gseq);
		
		return "redirect:/gongzi";
	}
	
	// ���ֹ������� �������� �̵�
	@RequestMapping(value="/usuallyask")
	public String usuallyAskView(Model model) {
		List<QuestionVO> questionList = questionService.getAllQuestion();
		
		model.addAttribute("questionList", questionList);
		return "admin/question/usuallyask";
	}
	
	// ���ֹ������� �ۼ� ������ �̵�
	@RequestMapping(value="usuallyask_add")
	public String usuallyAskAddView() {
		return "admin/question/usuallyask_add";
	}
	
	// ���ֹ������� �ۼ� �޼ҵ�
	@RequestMapping(value="usuallyask_add_action")
	public String usuallyAskAddAction(QuestionVO vo, @RequestParam(value="question_image")MultipartFile uploadImage,
									  HttpSession session) {
		String fileName = "";
		
		if (!uploadImage.isEmpty()) {	// ȭ�鿡�� product_image �ʵ忡 �̹����� �Էµ� ���
			fileName = uploadImage.getOriginalFilename();
			vo.setImage(fileName); // VO ��ü�� �̹������ϸ� ����
			
			// �̹��� ������ ���ε� �ϱ� ���� �̹��� ���� ���� ��θ� ���Ѵ�.
			String image_path 
			= session.getServletContext().getRealPath("WEB-INF/resources/upload_images/question/");
			System.out.println("�̵� �̹��� ���: " + image_path);
			
			try {
				File file = new File(image_path+fileName);
				uploadImage.transferTo(file); // ��ǰ�̹��� ���� ��η� �̵���Ŵ
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}	
		}
		
		questionService.insertQuestion(vo);
		
		return "redirect:/usuallyask";
	}
	
	// ���ֹ������� ���� ������
	@RequestMapping(value="usuallyask_update")
	public String usuallyAskUpdateView(@RequestParam(value="qseq")int qseq, Model model) {
		QuestionVO vo = questionService.getQuestion(qseq);
		model.addAttribute("Question", vo);
		
		return "admin/question/usuallyask_update";
	}
	
	// ���ֹ������� ���� �޼ҵ�
	@RequestMapping(value="usuallyask_update_action", method=RequestMethod.POST)
	public String usuallyAskUpdateAction(QuestionVO vo, @RequestParam(value="question_image")MultipartFile uploadImage,
									  HttpSession session) {
		String fileName = "";
		
		if (!uploadImage.isEmpty()) {	// ȭ�鿡�� product_image �ʵ忡 �̹����� �Էµ� ���
			fileName = uploadImage.getOriginalFilename();
			vo.setImage(fileName); // VO ��ü�� �̹������ϸ� ����
			
			// �̹��� ������ ���ε� �ϱ� ���� �̹��� ���� ���� ��θ� ���Ѵ�.
			String image_path 
			= session.getServletContext().getRealPath("WEB-INF/resources/upload_images/question/");
			System.out.println("�̵� �̹��� ���: " + image_path);
			
			try {
				File file = new File(image_path+fileName);
				uploadImage.transferTo(file); // ��ǰ�̹��� ���� ��η� �̵���Ŵ
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}	
		}
		
		questionService.updateQuestion(vo);
		
		return "redirect:/usuallyask";
	}
	
	// ���ֹ������� ���� �޼ҵ�
	@RequestMapping(value="usuallyask_delete")
	public String usuallyaskDelete(@RequestParam(value="qseq")int qseq) {
		questionService.deleteQuestion(qseq);
		
		return "redirect:/usuallyask";
	}
	
	// 1:1 ���� �������� �̵�
	@RequestMapping(value="/oneone")
	public String oneoneView(@RequestParam(value="key", defaultValue="")String key, Model model, Criteria criteria) {
		List<OneoneVO> oneoneList = adminService.getAllOneonePaging(criteria, key);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		int totalCount = adminService.getTotalOneone(key);
		pageMaker.setTotalCount(totalCount);
		
		// ��ȣ ����
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
	
	// 1:1 ���� �󼼺��� ������
	@RequestMapping(value="admin_oneone_detail")
	public String oneoneDetail(@RequestParam(value="onseq")int onseq, Model model) {
		OneoneVO oneone = adminService.getOneoneDetail(onseq);
		
		model.addAttribute("oneone", oneone);
		
		return "admin/oneone/oneone_detail";
	}
	
	// 1:1 ���� �亯 �ۼ� ������
	@RequestMapping(value="oneone_reply")
	public String oneoneReplyView(@RequestParam(value="onseq")int onseq, Model model) {
		OneoneVO oneone = adminService.getOneoneDetail(onseq);
		
		model.addAttribute("oneone", oneone);
		
		return "admin/oneone/oneone_reply";
	}
	
	// 1:1 ���� �亯 ��� �޼ҵ�
	@RequestMapping(value="oneone_reply_action")
	public String oneoneReplyAction(OneoneVO vo) {
		adminService.updateOneoneReply(vo);
		return "redirect:/oneone";
	}
	
	// �Ű���� �������� �̵�
	@RequestMapping(value="/report")
	public String reportView(@RequestParam(value="key", defaultValue="")String key, Model model, Criteria criteria) {
		List<ReportVO> reportList = adminService.getAllReportPaging(criteria, key);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		int totalCount = adminService.getTotalReport(key);
		pageMaker.setTotalCount(totalCount);
		
		// ��ȣ ����
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
	
	// �Ű� �󼼺��� ������
	@RequestMapping(value="/admin_report_detail")
	public String reportDetail(@RequestParam(value="rseq")int rseq, Model model) {
		ReportVO report = adminService.getReportDetail(rseq);
		
		model.addAttribute("Report", report);
		
		return "admin/report/report_detail";
	}
	
	// �Ű� �Ϸ� ó�� �޼ҵ�
	@RequestMapping(value="/admin_report_update")
	public String updateReportResult(@RequestParam(value="rseq")int rseq) {
		adminService.updateReportResult(rseq);
		
		return "redirect:/report";
	}
	
	// �α׾ƿ�
	@RequestMapping(value="/admin_logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "admin/login";
	}
}
