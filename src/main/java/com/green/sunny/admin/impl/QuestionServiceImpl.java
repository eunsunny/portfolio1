package com.green.sunny.admin.impl;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.sunny.admin.QuestionService;
import com.green.sunny.dao.QuestionDAO;
import com.green.sunny.dto.QuestionVO;

@Service("questionService")
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	private QuestionDAO questionDao;

	@Override
	public List<QuestionVO> getAllQuestion() {
		return questionDao.getAllQuestion();
	}

	@Override
	public QuestionVO getQuestion(int qseq) {
		return questionDao.getQuestion(qseq);
	}

	@Override
	public void insertQuestion(QuestionVO vo) {
		questionDao.insertQuestion(vo);
	}

	@Override
	public void updateQuestion(QuestionVO vo) {
		questionDao.updateQuestion(vo);
	}

	@Override
	public void deleteQuestion(int qseq) {
		questionDao.deleteQuestion(qseq);
	}

}
