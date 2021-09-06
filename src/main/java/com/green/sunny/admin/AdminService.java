package com.green.sunny.admin;

import java.util.List;

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

public interface AdminService {
	public int adminCheck(String id, String pwd);
	
	public AdminVO getAdmin(String id);
	
	// MainPage Section - today list
	public int getTodayProduct();
	
	public int getTodayOrder();
	
	public int getNoRepOneone();
	
	public int getNoResultReport();
	
	// MainPage Section - chart
	public List<MostOrderMember> getMostOrderMember();
	
	public List<KindCount> getKindCount();
	
	//Product Section
	public List<ProductVO> getAllProductPaging(Criteria criteria, String key);
	
	public int getTotalProduct(String name);
	
	public ProductVO getProductDetail(int pseq);
	
	public List<ProductImageVO> getProductImage(int fseq);
	
	// Member Section
	public List<MemberVO> getAllMemberPaging(Criteria criteria, String key);
	
	public int getTotalMember(String name);
	
	public MemberVO getMemberDetail(String id);
	
	// Board Section
	public List<BoardVO> getAllBoardPaging(Criteria criteria, String key);
	
	public int getTotalBoard(String title);
	
	public BoardVO getBoardDetail(int bseq);
	
	public void deleteBoard(int bseq);
	
	// Oneone Section
	public List<OneoneVO> getAllOneonePaging(Criteria criteria, String key);
	
	public OneoneVO getOneoneDetail(int onseq);
	
	public void updateOneoneReply(OneoneVO vo);
	
	public int getTotalOneone(String id);

	// Order Section
	public List<OrderVO> getAllOrderPaging(Criteria criteria, String key);
	
	public int getTotalOrder(String id);
	
	// Report Section
	public List<ReportVO> getAllReportPaging(Criteria criteria, String key);
	
	public int getTotalReport(String id);
	
	public ReportVO getReportDetail(int rseq);
	
	public void updateReportResult(int rseq);

}
