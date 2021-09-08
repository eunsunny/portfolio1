package com.green.sunny.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.green.sunny.board_comment.BoardCommentService;

import com.green.sunny.dto.BoardCommentVO;
import com.green.sunny.dto.MemberVO;

import com.green.sunny.utils.Criteria;
import com.green.sunny.utils.PageMaker;

@RequestMapping(value="/board_comments/")
@RestController
public class BoardCommentController {

	@Autowired
	private BoardCommentService boardCommentService;
	
	@GetMapping(value="/list")
	public Map<String, Object> commentList(@RequestParam(value="bseq") int bseq, Criteria criteria, Model model, HttpSession session) {
		
		Map<String, Object> commentInfo = new HashMap<>();
		
		
		List<BoardCommentVO> commentList = boardCommentService.getCommentListWithPaging(criteria, bseq);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		int totalComment = boardCommentService.countCommentList(bseq);
		pageMaker.setTotalCount(totalComment);
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");	
	
		commentInfo.put("total", totalComment);
		commentInfo.put("commentList", commentList);
		commentInfo.put("pageInfo", pageMaker);
		commentInfo.put("loginUser", loginUser);		
		
		return commentInfo;
	}
	
	@PostMapping(value="/save")
	public String saveComment(BoardCommentVO commentVO, HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "not_logedin";
		}else {
			// 작성자는 화면에서 입력되지 않으므로 로그인정보에서 추출함
			commentVO.setId(loginUser.getId());
			
			if(boardCommentService.saveComment(commentVO)==1) {	//insert delete update 는 성공하면 1이 들어옴 
				return "success";
			}else {
				return "fail";
			}
		}
	}
	
	@PostMapping(value="/update")
	public String updateComment(@RequestParam Map<String, Object> paramMap, HttpSession session) {
		System.out.println("paramMap:"+paramMap);
		if ((MemberVO)session.getAttribute("loginUser") == null) return "not_logedin";
		try{
			boardCommentService.updateComment(paramMap);
			return "success";
		} catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
	}
}
