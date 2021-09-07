package com.green.sunny.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.sunny.admin.AdminService;
import com.green.sunny.dao.AdminDAO;
import com.green.sunny.dto.AdminVO;
import com.green.sunny.dto.BoardVO;
import com.green.sunny.dto.KindCount;
import com.green.sunny.dto.MemberVO;
import com.green.sunny.dto.MostOrderMember;
import com.green.sunny.dto.OneoneVO;
import com.green.sunny.dto.OrderVO;
import com.green.sunny.dto.ProductImageVO;
import com.green.sunny.dto.ProductVO;
import com.green.sunny.dto.ReportVO;
import com.green.sunny.utils.Criteria;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDao;

	@Override
	public int adminCheck(String id, String pwd) {
		String pwd_db = adminDao.adminCheck(id);
		int result = 0;
		
		if(pwd_db == null) {
			result = -1;
		} else {
			if(pwd.equals(pwd_db)) {   // 입력 pwd와 DB저장 pwd가 일치
				result = 1;				
			} else {
				result = 0;
			}
		}
		
		return result;
	}

	@Override
	public AdminVO getAdmin(String id) {
		return adminDao.getAdmin(id);
	}

	/* Product */
	@Override
	public List<ProductVO> getAllProductPaging(Criteria criteria, String key) {
		return adminDao.getAllProductPaging(criteria, key);
	}

	@Override
	public int getTotalProduct(String name) {
		return adminDao.getTotalProduct(name);
	}

	@Override
	public ProductVO getProductDetail(int pseq) {
		return adminDao.getProductDetail(pseq);
	}
	
	@Override
	public List<ProductImageVO> getProductImage(int pseq) {
		return adminDao.getProductImage(pseq);
	}

	/* Member */
	@Override
	public List<MemberVO> getAllMemberPaging(Criteria criteria, String key) {
		return adminDao.getAllMemberPaging(criteria, key);
	}

	@Override
	public int getTotalMember(String name) {
		return adminDao.getTotalMember(name);
	}

	@Override
	public MemberVO getMemberDetail(String id) {
		return adminDao.getMemberDetail(id);
	}
	
	/* Board */
	@Override
	public List<BoardVO> getAllBoardPaging(Criteria criteria, String key) {
		return adminDao.getAllBoardPaging(criteria, key);
	}

	@Override
	public int getTotalBoard(String title) {
		return adminDao.getTotalBoard(title);
	}

	@Override
	public BoardVO getBoardDetail(int bseq) {
		return adminDao.getBoardDetail(bseq);
	}

	@Override
	public void deleteBoard(int bseq) {
		adminDao.deleteBoard(bseq);
	}

	/* Oneone */
	@Override
	public List<OneoneVO> getAllOneonePaging(Criteria criteria, String key) {
		return adminDao.getAllOneonePaging(criteria, key);
	}

	@Override
	public OneoneVO getOneoneDetail(int onseq) {
		return adminDao.getOneoneDetail(onseq);
	}

	@Override
	public void updateOneoneReply(OneoneVO vo) {
		adminDao.updateOneoneReply(vo);
	}
	
	@Override
	public int getTotalOneone(String id) {
		return adminDao.getTotalOneone(id);
	}

	/* Order */
	@Override
	public List<OrderVO> getAllOrderPaging(Criteria criteria, String key) {
		return adminDao.getAllOrderPaging(criteria, key);
	}
	
	@Override
	public int getTotalOrder(String id) {
		return adminDao.getTotalOrder(id);
	}
	
	/* Report */
	@Override
	public List<ReportVO> getAllReportPaging(Criteria criteria, String key) {
		return adminDao.getAllReportPaging(criteria, key);
	}

	@Override
	public int getTotalReport(String id) {
		return adminDao.getTotalReport(id);
	}

	@Override
	public ReportVO getReportDetail(int rseq) {
		return adminDao.getReportDetail(rseq);
	}

	@Override
	public void updateReportResult(int rseq) {
		adminDao.updateReportResult(rseq);
	}

	/* MainPage - Chart */
	@Override
	public List<MostOrderMember> getMostOrderMember() {
		return adminDao.getMostOrderMember();
	}

	@Override
	public List<KindCount> getKindCount() {
		return adminDao.getKindCount();
	}

	/*MainPage - today list*/
	@Override
	public int getTodayProduct() {
		return adminDao.getTodayProduct();
	}

	@Override
	public int getTodayOrder() {
		return adminDao.getTodayOrder();
	}

	@Override
	public int getNoRepOneone() {
		return adminDao.getNoRepOneone();
	}

	@Override
	public int getNoResultReport() {
		return adminDao.getNoResultReport();
	}

}
