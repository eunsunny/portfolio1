package com.green.sunny.admin;

import java.util.List;

import com.green.sunny.dto.QuestionVO;

public interface QuestionService {
	public List<QuestionVO> getAllQuestion();
	
	public QuestionVO getQuestion(int qseq);

	public void insertQuestion(QuestionVO vo);
	
	public void updateQuestion(QuestionVO vo);
	
	public void deleteQuestion(int qseq);

}
