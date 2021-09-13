package com.green.sunny.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.sunny.dto.MemberVO;
import com.green.sunny.dto.MessageVO;
import com.green.sunny.member.MemberService;
import com.green.sunny.message.MessageService;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private MemberService memberService;
	
	// 받은 쪽지함
	@RequestMapping("/message_list")
	public String messageList(MessageVO vo, Model model, HttpSession session) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		vo.setRecv_id(loginUser.getId());
		
		List<MessageVO> messageList = messageService.messageList(vo);
		
		model.addAttribute("messageList", messageList);
		
		return "message/messageList";
		
	}
	
	@RequestMapping("/send_message_view")
	public String sendMessageView() {
		
		return "message/messageWrite";
		
	}
	
	@RequestMapping("/send_message")
	public String sendMessage(MessageVO vo, HttpSession session) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		vo.setSend_id(loginUser.getId());
		
		String id = memberService.getIdMember(vo.getRecv_id());
		
		if(vo.getRecv_id().equals(id)) {
			
			messageService.insertMessage(vo);
			
			return "message/message_success";
		} else {
			
			return "message/message_fail";
		}
		
	}
	
	@RequestMapping("/message_detail")
	public String messageDetail(int no, Model model) {
		
		MessageVO message = messageService.messageDetail(no);
		
		messageService.readMessage(message.getNo());
		
		model.addAttribute("message", message);
		
		return "message/messageDetail";
		
	}
	
	@RequestMapping("/message_delete")
	public String messageDelete(int no) {
		
		messageService.deleteMessage(no);
		
		return "redirect:message_list";
	}
	
	// 보낸 쪽지함
	@RequestMapping("/message_send_list")
	public String messageSendList(MessageVO vo, Model model, HttpSession session) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		vo.setSend_id(loginUser.getId());
		
		List<MessageVO> messageList = messageService.messageSendList(vo);
		
		model.addAttribute("messageList", messageList);
		
		return "message/messageSendList";
		
	}
	
	@RequestMapping("/message_send_detail")
	public String messageSendDetail(int no, Model model) {
		
		MessageVO message = messageService.messageDetail(no);
		
		model.addAttribute("message", message);
		
		return "message/messageSendDetail";
		
	}
	
	@RequestMapping("/message_send_delete")
	public String messageSendDelete(int no) {
		
		messageService.deleteMessage(no);
		
		return "redirect:message_send_list";
	}
	
}
