package com.green.sunny.jjim;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.sunny.dao.JjimDAO;
import com.green.sunny.dto.JjimVO;
import com.green.sunny.utils.Criteria;

@Service("jjimService")
public class JjimServiceImpl implements JjimService {
	
	@Autowired
	private JjimDAO jjimDao;

	@Override
	public List<JjimVO> jjimList(String id) {
		
		return jjimDao.jjimList(id);
	}

	@Override
	public void insertJjim(JjimVO vo) {
		
		jjimDao.insertJjim(vo);
	}

	@Override
	public void deleteJjim(int jjseq) {
		
		jjimDao.deleteJjim(jjseq);
	}

	@Override
	public List<JjimVO> getJjimListPaging(Criteria criteria, String id) {
		
		return jjimDao.getJjimListPaging(criteria, id);
	}

	@Override
	public int countJjimList(String id) {
		
		return jjimDao.countJjimList(id);
	}

}
