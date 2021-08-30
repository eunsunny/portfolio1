package com.green.sunny.notice;

import java.util.List;

import com.green.sunny.dto.GongziVO;
import com.green.sunny.dto.OneoneVO;
import com.green.sunny.dto.QuestionVO;
import com.green.sunny.utils.Criteria;

public interface NoticeService {

	// 공지사항 리스트
	List<GongziVO> noticeList(GongziVO vo);
	
	// 공지사항 디테일
	public GongziVO noticeDetail(GongziVO vo);
	
	// 페이징포함 공지사항 리스트
	public List<GongziVO> noticeListPaging(Criteria criteria, GongziVO vo);

	// 공지사항 조회수
	public void plusCntNotice(GongziVO vo);
	public int noticeCnt(int gseq);
	
	// 공지사항 게시물 갯수
	public int countNotice();
		
	// 자주묻는질문 리스트
	List<QuestionVO> questionList(QuestionVO vo);

	// 1:1 질문 등록
	void inserOneone(OneoneVO vo);

	// 1:1 질문등록한거 상세보기
	OneoneVO oneoneDetail(OneoneVO vo);

	//1:1 질문 리스트
	List<OneoneVO> oneoneList(OneoneVO vo);

}