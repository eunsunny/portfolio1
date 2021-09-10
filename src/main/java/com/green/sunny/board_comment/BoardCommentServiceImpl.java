package com.green.sunny.board_comment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.sunny.dao.BoardCommentDAO;

import com.green.sunny.dto.BoardCommentVO;

import com.green.sunny.utils.Criteria;

@Service("boardCommentService")
public class BoardCommentServiceImpl implements BoardCommentService {

	@Autowired
	private BoardCommentDAO bcDao;
	
	@Override
	public List<BoardCommentVO> getCommentListWithPaging(Criteria criteria, int bseq) {
		
		return bcDao.getCommentListWithPaging(criteria, bseq);
	}

	@Override
	public int countCommentList(int bseq) {
		
		return bcDao.countCommentList(bseq);
	}

	@Override
	public int saveComment(BoardCommentVO vo) {
	
		return bcDao.saveComment(vo);
	}

	@Override
	public void updateComment(Map<String, Object> paramMap) {
		System.out.println("paramMap:"+paramMap);
		if("modify".equals(paramMap.get("status"))){
			bcDao.updateComment(paramMap);
		} else {
			bcDao.deleteComment(paramMap);
		}
	}

	@Override
	public void deleteAllComment(int bseq) {
		bcDao.deleteAllComment(bseq);
		
	}

	

}
