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
	
	// ������ �α��� �� ��й�ȣ�� �´��� üũ
	public String adminCheck(String id) {
		return mybatis.selectOne("AdminDAO.adminCheck", id);
	}
	
	// ������ id�� �������� ���������� ��ȸ
	public AdminVO getAdmin(String id) {
		return mybatis.selectOne("AdminDAO.getAdmin", id);
	}
	
	/* MainPage - ��ǰ/�ֹ�/����/�Ű� */
	// ���� �߰��� ��ǰ �Ǽ�
	public int getTodayProduct() {
		return mybatis.selectOne("AdminDAO.getTodayProduct");
	}
	
	// ���� �߰��� �ֹ� �Ǽ�
	public int getTodayOrder() {
		return mybatis.selectOne("AdminDAO.getTodayOrder");
	}
	
	// �̴亯 1:1 ���� �Ǽ�
	public int getNoRepOneone() {
		return mybatis.selectOne("AdminDAO.getNoRepOneone");
	}
	
	// �̴亯 �Ű� �Ǽ�
	public int getNoResultReport() {
		return mybatis.selectOne("AdminDAO.getNoResultReport");
	}
	
	/* MainPage - Chart */
	// �ִ� �ֹ� ȸ�� ��ȸ
	public List<MostOrderMember> getMostOrderMember(){
		return mybatis.selectList("AdminDAO.getMostOrderMember");
	}
	
	// ī�װ��� ��ϵ� ��ǰ ���� ��ȸ
	public List<KindCount> getKindCount(){
		return mybatis.selectList("AdminDAO.getKindCount");
	}
	
	/* Product Section */
	// �������� ��ǰ��� ��ȸ
	public List<ProductVO> getAllProductPaging(Criteria criteria, String key){
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("key", key);
		
		return mybatis.selectList("AdminDAO.getAllProductPaging", map);
	}
	
	// ��ü ��ǰ��� ���� ��ȸ
	public int getTotalProduct(String name) {
		return mybatis.selectOne("AdminDAO.getTotalProduct", name);
	}
	
	// ��ǰ �󼼺���
	public ProductVO getProductDetail(int pseq) {
		return mybatis.selectOne("AdminDAO.getProductDetail", pseq);
	}
	
	// ��ǰ �̹��� ��������
	public List<ProductImageVO> getProductImage(int fseq) {
		return mybatis.selectList("AdminDAO.getProductImage", fseq);
	}
	
	/* Member Section */
	// ��ü ȸ�� ��ȸ
	public List<MemberVO> getAllMemberPaging(Criteria criteria, String key){
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("key", key);
		
		return mybatis.selectList("AdminDAO.getAllMemberPaging", map);
	}
	
	// ��ü ȸ������ �� ��ȸ
	public int getTotalMember(String name) {
		return mybatis.selectOne("AdminDAO.getTotalMember", name);
	}
	
	// ȸ�� ����ȸ
	public MemberVO getMemberDetail(String id) {
		return mybatis.selectOne("AdminDAO.getMemberDetail", id);
	}
	
	/* Board Section */
	// ��ü �Խñ� ����Ʈ ��ȸ
	public List<BoardVO> getAllBoardPaging(Criteria criteria, String key){
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("key", key);
		
		return mybatis.selectList("AdminDAO.getAllBoardPaging", map);
	}
	
	// ��ü �Խñ� �� ��ȸ
	public int getTotalBoard(String title) {
		return mybatis.selectOne("AdminDAO.getTotalBoard", title);
	}
	
	// �Խñ� �󼼺���
	public BoardVO getBoardDetail(int bseq) {
		return mybatis.selectOne("AdminDAO.getBoardDetail", bseq);
	}
	
	// �Խñ� ����
	public void deleteBoard(int bseq) {
		mybatis.delete("AdminDAO.deleteBoard", bseq);
	}
	
	/* Oneone Section */
	// ��ü 1:1 ���� ���� ��ȸ
	public List<OneoneVO> getAllOneonePaging(Criteria criteria, String key){
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("key", key);
		
		return mybatis.selectList("AdminDAO.getAllOneonePaging", map);
	}
	
	// ������ 1:1 ���� �� ��ȸ
	public OneoneVO getOneoneDetail(int onseq) {
		return mybatis.selectOne("AdminDAO.getOneoneDetail", onseq);
	}
	
	// �亯�� �亯���� ������Ʈ
	public void updateOneoneReply(OneoneVO vo) {
		mybatis.update("AdminDAO.updateOneoneReply", vo);
	}
	
	// ��ü ���� ���� ��ȸ
	public int getTotalOneone(String id) {
		return mybatis.selectOne("AdminDAO.getTotalOneone", id);
	}
	
	/* Order Section */
	// ��ü �ֹ� ����Ʈ ��ȸ
	public List<OrderVO> getAllOrderPaging(Criteria criteria, String key){
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("key", key);
		
		return mybatis.selectList("AdminDAO.getAllOrderPaging", map);
	}
	
	// �ֹ� �󼼺��� ��ȸ
	public OrderVO getOrderDetail(int oseq) {
		return mybatis.selectOne("AdminDAO.getOrderDetail", oseq);
	}
	
	// ��ü �ֹ��� ���� ��ȸ
	public int getTotalOrder(String id) {
		return mybatis.selectOne("AdminDAO.getTotalOrder", id);
	}
	
	/* Report Section */
	// ��ü �Ű� ����Ʈ ���
	public List<ReportVO> getAllReportPaging(Criteria criteria, String key){
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("key", key);
		
		return mybatis.selectList("AdminDAO.getAllReportPaging", map);
	}
	
	// ��ü �Ű� Ƚ�� ��ȸ
	public int getTotalReport(String id) {
		return mybatis.selectOne("AdminDAO.getTotalReport", id);
	}
	
	// �ϳ��� �Ű� ����ȸ
	public ReportVO getReportDetail(int rseq) {
		return mybatis.selectOne("AdminDAO.getReportDetail", rseq);
	}
	
	// �Ű�Ϸ� ó�� ������Ʈ
	public void updateReportResult(int rseq) {
		mybatis.update("AdminDAO.updateReportResult", rseq);
	}
}
