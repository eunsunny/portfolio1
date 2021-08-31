package com.green.sunny.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.sunny.dto.QuestionVO;

@Repository
public class QuestionDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<QuestionVO> getAllQuestion() {
		return mybatis.selectList("QuestionDAO.getAllQuestion");
	}
	
	public QuestionVO getQuestion(int qseq) {
		return mybatis.selectOne("QuestionDAO.getQuestion", qseq);
	}
	
	public void insertQuestion(QuestionVO vo) {
		mybatis.insert("QuestionDAO.insertQuestion", vo);
	}
	
	public void updateQuestion(QuestionVO vo) {
		mybatis.update("QuestionDAO.updateQuestion", vo);
	}
	
	public void deleteQuestion(int qseq) {
		mybatis.delete("QuestionDAO.deleteQuestion", qseq);
	}
}
