package com.green.sunny.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.sunny.dao.NoticeDAO;
import com.green.sunny.dto.GongziVO;
import com.green.sunny.dto.OneoneVO;
import com.green.sunny.dto.QuestionVO;
import com.green.sunny.utils.Criteria;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO noticeDao;

	@Override
	public List<GongziVO> noticeList(GongziVO vo) {
		
		return noticeDao.noticeList(vo);
	}

	@Override
	public GongziVO noticeDetail(GongziVO vo) {
		
		return noticeDao.noticeDetail(vo);
	}

	@Override
	public List<GongziVO> noticeListPaging(Criteria criteria, GongziVO vo) {
		
		return noticeDao.noticeListPaging(criteria, vo);
	}

	@Override
	public int countNotice() {
		
		return noticeDao.countNotice();
	}

	@Override
	public int noticeCnt(int gseq) {
		
		return noticeDao.noticeCnt(gseq);
	}

	@Override
	public void plusCntNotice(GongziVO vo) {
		
		noticeDao.plusCntNotice(vo);
	}

	@Override
	public List<QuestionVO> questionList(QuestionVO vo) {
		
		return noticeDao.questionList(vo);
	}

	@Override
	public void inserOneone(OneoneVO vo) {
		
		noticeDao.inserOneone(vo);
	}

	@Override
	public OneoneVO oneoneDetail(OneoneVO vo) {
		
		return noticeDao.oneoneDetail(vo);
	}

	@Override
	public List<OneoneVO> oneoneList(OneoneVO vo) {
		
		return noticeDao.oneoneList(vo);
	}


}
