package com.green.sunny.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.sunny.dto.GongziVO;
import com.green.sunny.dto.MemberVO;
import com.green.sunny.dto.OneoneVO;
import com.green.sunny.dto.QuestionVO;
import com.green.sunny.dto.ReportVO;
import com.green.sunny.member.MemberService;
import com.green.sunny.notice.NoticeService;
import com.green.sunny.utils.Criteria;
import com.green.sunny.utils.PageMaker;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private MemberService memberService;
	
	// ��������(����¡ó�� ����)
	@RequestMapping("/notice_list")
	public String noticeList(Criteria criteria, Model model) {
			
		GongziVO vo = new GongziVO();
		
		List<GongziVO> noticeList = noticeService.noticeListPaging(criteria, vo);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		int totalCount = noticeService.countNotice();
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("noticeListSize", noticeList.size());
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageMaker", pageMaker);
		
		return "notice/noticeList";
		
	}
	
	// �������� �󼼺���(��ȸ�� ī��Ʈ ����)
	@RequestMapping("/notice_detail")
	public String noticeDetail(GongziVO vo, Model model) {
		
		int count = noticeService.noticeCnt(vo.getGseq());
		vo.setCount(count);
		
		noticeService.plusCntNotice(vo);
		
		GongziVO notice = noticeService.noticeDetail(vo);
		
		model.addAttribute("NoticeVO", notice);
		
		return "notice/noticeDetail";
	}
	
	// ���ֹ��� ����(����¡ ����)
	@RequestMapping("/question_list")
	public String questionList(@RequestParam(value="key", defaultValue="") String key,
								Criteria criteria, Model model) {

		List<QuestionVO> queList = noticeService.questionList(criteria, key);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		int totalCount = noticeService.questionCount(key);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("queList", queList);
		model.addAttribute("pageMaker", pageMaker);
		
		return "notice/questionList";
		
	}
	
	
	// 1:1 �����ϱ� ����Ʈ
	@RequestMapping("/oneone_list")
	public String oneOneList(HttpSession session, OneoneVO vo, Model model) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		vo.setId(loginUser.getId());
		
		List<OneoneVO> oneList = noticeService.oneoneList(vo);
		
		model.addAttribute("OneoneList", oneList);
		
		return "notice/oneOneList";
	}
	
	// 1:1 ���� ��� ������ �̵�
	@RequestMapping(value="/oneone_insert_view", method=RequestMethod.GET)
	public String oneoneInsertView(HttpSession session, OneoneVO vo) {
		
		return "notice/oneOneWrite";
	}
	
	// 1:1 ���� ���
	@RequestMapping(value="/oneone_insert", method=RequestMethod.POST)
	public String oneoneInsert(HttpSession session, OneoneVO vo) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		vo.setId(loginUser.getId());

		noticeService.inserOneone(vo);
		
		return "redirect:oneone_list";
	}
	
	// 1:1���� �󼼺���
	@RequestMapping(value="/oneOne_Detail", method=RequestMethod.GET)
	public String oneoneDetail(HttpSession session, OneoneVO vo, Model model) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		vo.setId(loginUser.getId());
		
		OneoneVO oneone = noticeService.oneoneDetail(vo);
		
		model.addAttribute("OneoneVO", oneone);
		
		return "notice/oneOneDetail";
	}
	
	// �Ű��ϱ� ������ �Ѿ��
	@RequestMapping("/report_write_view")
	public String reportWriteView() {
		
		return "notice/reportWrite";
	}
	
	// �Ű��ϱ�������
	@RequestMapping(value="/report_write", method=RequestMethod.GET)
	public String reportWrite(HttpSession session, ReportVO vo) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		vo.setId(loginUser.getId());
		
		String id = memberService.getIdMember(vo.getReport_id());
		
		if(vo.getReport_id().equals(id)) {
			
			noticeService.insertReport(vo);
			
			return "notice/report_success";
			
		} else {
			
			return "notice/report_fail";
		}
		
	}
	
}
