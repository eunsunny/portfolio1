package com.green.sunny.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.sunny.dto.AdminVO;
import com.green.sunny.dto.BoardVO;
import com.green.sunny.dto.KindCount;
import com.green.sunny.dto.MemberVO;
import com.green.sunny.dto.MessageVO;
import com.green.sunny.dto.MostOrderMember;
import com.green.sunny.dto.OneoneVO;
import com.green.sunny.dto.OrderVO;
import com.green.sunny.dto.ProductImageVO;
import com.green.sunny.dto.ProductVO;
import com.green.sunny.dto.ReportVO;
import com.green.sunny.adminUtils.Criteria;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 관리자 로그인 시 비밀번호가 맞는지 체크
	public String adminCheck(String id) {
		return mybatis.selectOne("AdminDAO.adminCheck", id);
	}
	
	// 관리자 id롤 조건으로 관리자정보 조회
	public AdminVO getAdmin(String id) {
		return mybatis.selectOne("AdminDAO.getAdmin", id);
	}
	
	/* MainPage - 상품/주문/문의/신고 */
	// 오늘 추가된 상품 건수
	public int getTodayProduct() {
		return mybatis.selectOne("AdminDAO.getTodayProduct");
	}
	
	// 오늘 추가된 주문 건수
	public int getTodayOrder() {
		return mybatis.selectOne("AdminDAO.getTodayOrder");
	}
	
	// 미답변 1:1 문의 건수
	public int getNoRepOneone() {
		return mybatis.selectOne("AdminDAO.getNoRepOneone");
	}
	
	// 미답변 신고 건수
	public int getNoResultReport() {
		return mybatis.selectOne("AdminDAO.getNoResultReport");
	}
	
	/* MainPage - Chart */
	// 최다 주문 회원 조회
	public List<MostOrderMember> getMostOrderMember(){
		return mybatis.selectList("AdminDAO.getMostOrderMember");
	}
	
	// 카테고리별 등록된 상품 갯수 조회
	public List<KindCount> getKindCount(){
		return mybatis.selectList("AdminDAO.getKindCount");
	}
	
	/* Product Section */
	// 페이지별 상품목록 조회
	public List<ProductVO> getAllProductPaging(Criteria criteria, String key){
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("key", key);
		
		return mybatis.selectList("AdminDAO.getAllProductPaging", map);
	}
	
	// 전체 상품목록 갯수 조회
	public int getTotalProduct(String name) {
		return mybatis.selectOne("AdminDAO.getTotalProduct", name);
	}
	
	// 상품 상세보기
	public ProductVO getProductDetail(int pseq) {
		return mybatis.selectOne("AdminDAO.getProductDetail", pseq);
	}
	
	// 상품 이미지 가져오기
	public List<ProductImageVO> getProductImage(int fseq) {
		return mybatis.selectList("AdminDAO.getProductImage", fseq);
	}
	
	/* Member Section */
	// 전체 회원 조회
	public List<MemberVO> getAllMemberPaging(Criteria criteria, String key){
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("key", key);
		
		return mybatis.selectList("AdminDAO.getAllMemberPaging", map);
	}
	
	// 전체 회원들의 수 조회
	public int getTotalMember(String name) {
		return mybatis.selectOne("AdminDAO.getTotalMember", name);
	}
	
	// 회원 상세조회
	public MemberVO getMemberDetail(String id) {
		return mybatis.selectOne("AdminDAO.getMemberDetail", id);
	}
	
	/* Board Section */
	// 전체 게시글 리스트 조회
	public List<BoardVO> getAllBoardPaging(Criteria criteria, String key){
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("key", key);
		
		return mybatis.selectList("AdminDAO.getAllBoardPaging", map);
	}
	
	// 전체 게시글 수 조회
	public int getTotalBoard(String title) {
		return mybatis.selectOne("AdminDAO.getTotalBoard", title);
	}
	
	// 게시글 상세보기
	public BoardVO getBoardDetail(int bseq) {
		return mybatis.selectOne("AdminDAO.getBoardDetail", bseq);
	}
	
	// 게시글 삭제
	public void deleteBoard(int bseq) {
		mybatis.delete("AdminDAO.deleteBoard", bseq);
	}
	
	/* Oneone Section */
	// 전체 1:1 문의 내역 조회
	public List<OneoneVO> getAllOneonePaging(Criteria criteria, String key){
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("key", key);
		
		return mybatis.selectList("AdminDAO.getAllOneonePaging", map);
	}
	
	// 선택한 1:1 문의 상세 조회
	public OneoneVO getOneoneDetail(int onseq) {
		return mybatis.selectOne("AdminDAO.getOneoneDetail", onseq);
	}
	
	// 답변과 답변여부 업데이트
	public void updateOneoneReply(OneoneVO vo) {
		mybatis.update("AdminDAO.updateOneoneReply", vo);
	}
	
	// 전체 문의 갯수 조회
	public int getTotalOneone(String id) {
		return mybatis.selectOne("AdminDAO.getTotalOneone", id);
	}
	
	/* Order Section */
	// 전체 주문 리스트 조회
	public List<OrderVO> getAllOrderPaging(Criteria criteria, String key){
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("key", key);
		
		return mybatis.selectList("AdminDAO.getAllOrderPaging", map);
	}
	
	// 주문 상세보기 조회
	public OrderVO getOrderDetail(int oseq) {
		return mybatis.selectOne("AdminDAO.getOrderDetail", oseq);
	}
	
	// 전체 주문의 갯수 조회
	public int getTotalOrder(String id) {
		return mybatis.selectOne("AdminDAO.getTotalOrder", id);
	}
	
	/* Report Section */
	// 전체 신고 리스트 출력
	public List<ReportVO> getAllReportPaging(Criteria criteria, String key){
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("key", key);
		
		return mybatis.selectList("AdminDAO.getAllReportPaging", map);
	}
	
	// 전체 신고 횟수 조회
	public int getTotalReport(String id) {
		return mybatis.selectOne("AdminDAO.getTotalReport", id);
	}
	
	// 하나의 신고 상세조회
	public ReportVO getReportDetail(int rseq) {
		return mybatis.selectOne("AdminDAO.getReportDetail", rseq);
	}
	
	// 신고완료 처리 업데이트
	public void updateReportResult(int rseq) {
		mybatis.update("AdminDAO.updateReportResult", rseq);
	}
	
	/* Message Section(쪽지) */
	public void insertMessage(String pid) {
		mybatis.insert("AdminDAO.insertMessage", pid);
	}
}
