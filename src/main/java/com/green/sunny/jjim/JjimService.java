package com.green.sunny.jjim;

import java.util.List;

import com.green.sunny.dto.JjimVO;
import com.green.sunny.utils.Criteria;

public interface JjimService {

	List<JjimVO> jjimList(String id);

	void insertJjim(JjimVO vo);

	void deleteJjim(int jjseq);
	
	public List<JjimVO> getJjimListPaging(Criteria criteria, String id);
	
	public int countJjimList(String id);
	
	public int jjimCheck(int pseq);

}