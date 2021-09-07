package com.green.sunny.order;

import java.util.List;
import java.util.Map;

import com.green.sunny.dto.OrderVO;
import com.green.sunny.dto.ProductVO;
import com.green.sunny.utils.Criteria;

public interface OrderService {
	
	public List<ProductVO> myProductList(ProductVO vo);
	
	public int countMyProduct(String id);
	
	public List<ProductVO> myProductListPaging(Criteria criteria, String id);
	
	// 주문 결제내역 리스트
	public List<OrderVO> orderList(OrderVO vo);
	
	public int countMyOrder(String id);
	
	// 주문결제내역 리스트(페이징 포함)
	public List<OrderVO> orderListPaging(Criteria criteria, String id);
	
	// 주문 확정 버튼
	public void orderSet(OrderVO vo);
	
	// 주문 확정에 따른 등급 관리
	public int orderSetCount(String id);
	
	public Map<String,Object> selectAllByPseq(int pseq);
}
