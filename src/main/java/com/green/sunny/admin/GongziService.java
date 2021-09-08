package com.green.sunny.admin;

import java.util.List;

import com.green.sunny.dto.GongziVO;
import com.green.sunny.adminUtils.Criteria;

public interface GongziService {
	public List<GongziVO> getAllGongzi();
	
	public List<GongziVO> getAllGongziPaging(Criteria criteria, String key);
	
	public int getTotalGongzi(String title);
	
	public GongziVO getGongzi(int gseq);

	public void insertGongzi(GongziVO vo);
	
	public void updateGongzi(GongziVO vo);
	
	public void deleteGongzi(int gseq);
}
