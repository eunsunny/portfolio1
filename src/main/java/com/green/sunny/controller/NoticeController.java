package com.green.sunny.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.green.sunny.dto.GongziVO;
import com.green.sunny.dto.MemberVO;
import com.green.sunny.dto.OneoneVO;
import com.green.sunny.notice.NoticeService;
import com.green.sunny.utils.Criteria;
import com.green.sunny.utils.PageMaker;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	// 공지사항(페이징처리 포함)
	@RequestMapping("/notice_list")
	public String noticeList(Criteria criteria, Model model) {
			
		//List<GongziVO> noticeList = noticeService.noticeList(vo);
		
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
	
	// 공지사항 상세보기(조회수 카운트 포함)
	@RequestMapping("/notice_detail")
	public String noticeDetail(GongziVO vo, Model model) {
		
		int count = noticeService.noticeCnt(vo.getGseq());
		vo.setCount(count);
		noticeService.plusCntNotice(vo);
		
		GongziVO notice = noticeService.noticeDetail(vo);
		
		model.addAttribute("NoticeVO", notice);
		
		return "notice/noticeDetail";
	}
	
	
	
	
	// 자주묻는 질문
	@RequestMapping("/question_list")
	public String questionList() {
		
		return "notice/questionList";
	}
	
	
	// 1:1 문의하기 리스트
	@RequestMapping("/oneone_list")
	public String oneOneList(HttpSession session, OneoneVO vo, Model model) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		vo.setId(loginUser.getId());
		
		List<OneoneVO> oneList = noticeService.oneoneList(vo);
		
		model.addAttribute("OneoneList", oneList);
		
		return "notice/oneOneList";
	}
	
	// 1:1 문의 등록 페이지 이동
	@RequestMapping("/oneone_insert_view")
	public String oneoneInsertView(HttpSession session, OneoneVO vo) {
		
		return "notice/oneOneWrite";
	}
	
	// 1:1 문의 등록
	@RequestMapping(value="/oneone_insert", method=RequestMethod.POST)
	public String oneoneInsert(HttpSession session, OneoneVO vo) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		vo.setId(loginUser.getId());

		noticeService.inserOneone(vo);
		
		return "redirect:oneone_list";
	}
	
	// 1:1문의 상세보기
	@RequestMapping("/oneOne_Detail")
	public String oneoneDetail(HttpSession session, OneoneVO vo, Model model) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		vo.setId(loginUser.getId());
		
		OneoneVO oneone = noticeService.oneoneDetail(vo);
		
		model.addAttribute("OneoneVO", oneone);
		
		return "notice/oneOneDetail";
	}
	
}
