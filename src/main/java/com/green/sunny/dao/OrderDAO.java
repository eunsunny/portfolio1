package com.green.sunny.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.sunny.dto.OrderVO;
import com.green.sunny.dto.ProductVO;
import com.green.sunny.utils.Criteria;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProductVO> myProductList(ProductVO vo) {
		
		return mybatis.selectList("OrderDAO.myProductList", vo);
	}
	
	public int countMyProduct(String id) {
		
		return mybatis.selectOne("OrderDAO.countMyProduct", id);
	}
	
	public List<ProductVO> myProductListPaging(Criteria criteria, String id) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("criteria", criteria);
		map.put("id", id);
		
		return mybatis.selectList("OrderDAO.myProductListPaging", map);
		
	}
	
	// �ֹ� �������� ����Ʈ
	public List<OrderVO> orderList(OrderVO vo) {
		
		return mybatis.selectList("OrderDAO.orderListPaging", vo);
	}
	
	public int countMyOrder(String id) {
		
		return mybatis.selectOne("OrderDAO.countMyOrder", id);
	}
	
	// �ֹ��������� ����Ʈ(����¡ ����)
	public List<OrderVO> orderListPaging(Criteria criteria, String id) {

		HashMap<String, Object> map = new HashMap<>();
		
		map.put("criteria", criteria);
		map.put("id", id);		
		
		return mybatis.selectList("OrderDAO.orderListPaging", map);
	}
	
	// �ֹ� Ȯ�� ��ư
	public void orderSet(OrderVO vo) {
		
		mybatis.update("OrderDAO.orderUpdate", vo);
	}
	
	// �ֹ� Ȯ���� ���� ��� ����
	public int orderSetCount(String id) {
		
		return mybatis.selectOne("OrderDAO.orderSetCount", id);
	}
	
	public OrderVO selectAllByPseq(int pseq) {
		
		return mybatis.selectOne("OrderDAO.selectAllByPseq", pseq);
	}
	
	// �ֹ� ��
	public HashMap<String, Object> orderDetail(int oseq) {
		
		return mybatis.selectOne("OrderDAO.orderDetail", oseq);
	}
	
}
