package com.green.sunny.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.sunny.admin.GongziService;
import com.green.sunny.dao.GongziDAO;
import com.green.sunny.dto.GongziVO;
import com.green.sunny.adminUtils.Criteria;

@Service("gongziService")
public class GongziServiceImpl implements GongziService {
	@Autowired
	private GongziDAO gongziDao;

	@Override
	public List<GongziVO> getAllGongzi() {
		return gongziDao.getAllGongzi();
	}
	
	@Override
	public List<GongziVO> getAllGongziPaging(Criteria criteria, String key) {
		return gongziDao.getAllGongziPaging(criteria, key);
	}

	@Override
	public int getTotalGongzi(String title) {
		return gongziDao.getTotalGongzi(title);
	}

	@Override
	public GongziVO getGongzi(int gseq) {
		return gongziDao.getGongzi(gseq);
	}

	@Override
	public void insertGongzi(GongziVO vo) {
		gongziDao.insertGongzi(vo);
	}
	
	@Override
	public void updateGongzi(GongziVO vo) {
		gongziDao.updateGongzi(vo);
	}

	@Override
	public void deleteGongzi(int gseq) {
		gongziDao.deleteGongzi(gseq);
	}

}
