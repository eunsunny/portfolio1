package com.green.sunny.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.sunny.dto.GongziVO;
import com.green.sunny.dto.OneoneVO;
import com.green.sunny.dto.QuestionVO;
import com.green.sunny.utils.Criteria;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 공지사항 리스트
	public List<GongziVO> noticeList(GongziVO vo) {
		
		return mybatis.selectList("NoticeDAO.noticeList", vo);
	}
	
	// 페이징포함 공지사항 리스트
	public List<GongziVO> noticeListPaging(Criteria criteria, GongziVO vo) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("criteria", criteria);
		map.put("vo", vo);
		
		return mybatis.selectList("NoticeDAO.noticeListPaging", map);
	}
	
	// 공지사항 게시물 갯수
	public int countNotice() {
		
		return mybatis.selectOne("NoticeDAO.countNotice");
	}
	
	// 공지사항 조회수
	public void plusCntNotice(GongziVO vo) {
		
		mybatis.update("NoticeDAO.plusCntNotice", vo);
	}
	
	public int noticeCnt(int gseq) {
		
		return mybatis.selectOne("NoticeDAO.noticeCnt", gseq);
	}
	
	// 공지사항 디테일
	public GongziVO noticeDetail(GongziVO vo) {
		
		return mybatis.selectOne("NoticeDAO.noticeDetail", vo);
	}
	
	// 자주묻는질문 리스트
	public List<QuestionVO> questionList(QuestionVO vo) {
		
		return mybatis.selectList("NoticeDAO.questionList", vo);
	}
	
	// 1:1 질문 등록
	public void inserOneone(OneoneVO vo) {
		
		mybatis.insert("NoticeDAO.insertOneone", vo);
	}
	
	// 1:1 질문등록한거 상세보기
	public OneoneVO oneoneDetail(OneoneVO vo) {
		
		return mybatis.selectOne("NoticeDAO.oneoneDetail", vo);
	}
	
	//1:1 질문 리스트
	public List<OneoneVO> oneoneList(OneoneVO vo) {
		
		return mybatis.selectList("NoticeDAO.oneoneList", vo);
	}
	
	
}
