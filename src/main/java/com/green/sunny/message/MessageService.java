package com.green.sunny.message;

import java.util.List;

import com.green.sunny.dto.AdminVO;
import com.green.sunny.dto.MessageVO;

public interface MessageService {

	void insertMessage(MessageVO vo);

	List<MessageVO> messageList(MessageVO vo);
	
	public List<MessageVO> messageSendList(MessageVO vo);

	void readMessage(int no);

	void deleteMessage(int no);
	
	public MessageVO messageDetail(int no);
	
	public String adminMessage(String id);

}