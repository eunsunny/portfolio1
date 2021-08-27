package com.green.sunny.comment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.sunny.dao.CommentDAO;
import com.green.sunny.dto.ProductCommentVO;
import com.green.sunny.utils.Criteria;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO cDao;
	
	@Override
	public List<ProductCommentVO> getCommentListWithPaging(Criteria criteria, int pseq) {
		
		return cDao.getCommentListWithPaging(criteria, pseq);
	}

	@Override
	public int countCommentList(int pseq) {
		
		return cDao.countCommentList(pseq);
	}

	@Override
	public int saveComment(ProductCommentVO vo) {
	
		return cDao.saveComment(vo);
	}

	@Override
	public void updateComment(Map<String, Object> paramMap) {
		System.out.println("paramMap:"+paramMap);
		if("modify".equals(paramMap.get("status"))){
			cDao.updateComment(paramMap);
		} else {
			cDao.deleteComment(paramMap);
		}
	}

}
