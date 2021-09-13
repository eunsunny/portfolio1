package com.green.sunny.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.sunny.dto.AdminVO;
import com.green.sunny.dto.MessageVO;

@Repository
public class MessageDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertMessage(MessageVO vo) {
		
		mybatis.insert("MessageDAO.insertMessage", vo);
	}
	
	public List<MessageVO> messageList(MessageVO vo) {
		
		return mybatis.selectList("MessageDAO.messageList", vo);
	}

	public List<MessageVO> messageSendList(MessageVO vo) {
		
		return mybatis.selectList("MessageDAO.messageSendList", vo);
	}
	
	public void readMessage(int no) {
		
		mybatis.update("MessageDAO.readMessage", no);
	}
	
	public void deleteMessage(int no) {
		
		mybatis.delete("MessageDAO.deleteMessage", no);
	}
	
	public MessageVO messageDetail(int no) {
		
		return mybatis.selectOne("MessageDAO.messageDetail", no);
	}
	
	public String adminMessage(String id) {
		
		return mybatis.selectOne("MessageDAO.adminMessage", id);
	}
	
}
