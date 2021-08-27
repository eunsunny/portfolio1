package com.green.sunny.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.sunny.member.MemberService;

//@Controller
//@RequestMapping("/user")
//public class MemberJoinCheckController {
//
//	@Autowired
//	private MemberService memberService;
//	
//	// 아이디 중복체크 컨트롤러
//	@PostMapping("/idCheck")
//	@ResponseBody
//	public int idCheck(@RequestParam("id") String id) throws Exception {
//		
//		int result = memberService.userIdCheck(id);
////		System.out.println(result);
//		return result;
//	}
//}
