package com.green.sunny.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.sunny.dao.BoardDAO;
import com.green.sunny.dto.BoardVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO bDao;
	
	@Override
	public List<Map<String, Object>> selectBoardList() {
		return bDao.selectBoardList();
	}

	@Override
	public Map<String, Object> selectBoardDetail(int bseq) {
		
		return bDao.selectBoardDetail(bseq);
	}

	@Override
	public int selectCount(int bseq) {
	
		return bDao.selectCount(bseq);
	}

	@Override
	public void plusCount(BoardVO vo) {
		bDao.plusCount(vo);
		
	}

	@Override
	public void deleteBoard(int bseq) {
		bDao.deleteBoard(bseq);
		
	}

	@Override
	public void insertBoardInfo(Map<String, Object> param) {
		bDao.insertBoardInfo(param);
	}
	
	@Override
	public void insertFile(Map<String, Object> param) {
		bDao.insertFile(param);
	}
	
	@Override
	public int seletcBSeq() {
		return bDao.seletcBSeq();
	}

	@Override
	public void updateBoardInfo(Map<String, Object> param) {
		bDao.updateBoardInfo(param);
		
	}

	@Override
	public void deleteBoardPicture(int bseq) {
		bDao.deleteBoardPicture(bseq);
		
	}
}
