package com.green.sunny.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.sunny.dao.MessageDAO;
import com.green.sunny.dto.MessageVO;

@Service("messageService")
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDAO messageDao;
	
	@Override
	public void insertMessage(MessageVO vo) {
		
		messageDao.insertMessage(vo);
	}

	@Override
	public List<MessageVO> messageList(MessageVO vo) {
		
		return messageDao.messageList(vo);
	}

	@Override
	public void readMessage(int no) {
		
		messageDao.readMessage(no);
	}

	@Override
	public void deleteMessage(int no) {
		
		messageDao.deleteMessage(no);
	}

	@Override
	public MessageVO messageDetail(int no) {
		
		return messageDao.messageDetail(no);
	}

}
