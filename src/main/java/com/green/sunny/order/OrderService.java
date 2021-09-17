package com.green.sunny.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.green.sunny.dto.OrderVO;
import com.green.sunny.dto.ProductVO;
import com.green.sunny.utils.Criteria;

public interface OrderService {
	
	public List<ProductVO> myProductList(ProductVO vo);
	
	public int countMyProduct(String id);
	
	public List<ProductVO> myProductListPaging(Criteria criteria, String id);
	
	// �ֹ� �������� ����Ʈ
	public List<OrderVO> orderList(OrderVO vo);
	
	public int countMyOrder(String id);
	
	// �ֹ��������� ����Ʈ(����¡ ����)
	public List<OrderVO> orderListPaging(Criteria criteria, String id);
	
	// �ֹ� Ȯ�� ��ư
	public void orderSet(OrderVO vo);
	
	// �ֹ� Ȯ���� ���� ��� ����
	public int orderSetCount(String id);
	
	public OrderVO selectAllByPseq(int pseq);
	
	// �ֹ� ��
	public HashMap<String, Object> orderDetail(int oseq);
}
