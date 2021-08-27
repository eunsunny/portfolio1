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

import com.green.sunny.comment.CommentService;
import com.green.sunny.dto.MemberVO;
import com.green.sunny.dto.ProductCommentVO;
import com.green.sunny.utils.Criteria;
import com.green.sunny.utils.PageMaker;

@RequestMapping(value="/comments/")
@RestController
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	@GetMapping(value="/list")
	public Map<String, Object> commentList(@RequestParam(value="pseq") int pseq, Criteria criteria, Model model, HttpSession session) {
		Map<String, Object> commentInfo = new HashMap<>();
		
		//List<ProductCommentVO> commentList = commentService.getCommentList(pseq);
		List<ProductCommentVO> commentList = commentService.getCommentListWithPaging(criteria, pseq);
		//System.out.println("commentList"+commentList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		int totalComment = commentService.countCommentList(pseq);
		pageMaker.setTotalCount(totalComment);
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");	//
	
		commentInfo.put("total", totalComment);
		commentInfo.put("commentList", commentList);
		commentInfo.put("pageInfo", pageMaker);
		commentInfo.put("loginUser", loginUser);		//
		
		return commentInfo;
	}
	
	@PostMapping(value="/save")
	public String saveComment(ProductCommentVO commentVO, HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "not_logedin";
		}else {
			// 작성자는 화면에서 입력되지 않으므로 로그인정보에서 추출함
			commentVO.setId(loginUser.getId());
			
			if(commentService.saveComment(commentVO)==1) {	//insert delete update 는 성공하면 1이 들어옴 
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
			commentService.updateComment(paramMap);
			return "success";
		} catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
	}
}
