package com.green.sunny.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.sunny.dao.OrderDAO;
import com.green.sunny.dto.OrderVO;
import com.green.sunny.dto.ProductVO;
import com.green.sunny.utils.Criteria;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDao;
	
	@Override
	public List<ProductVO> myProductList(ProductVO vo) {
		
		return orderDao.myProductList(vo);
	}

	@Override
	public int countMyProduct(String id) {
		
		return orderDao.countMyProduct(id);
	}

	@Override
	public List<ProductVO> myProductListPaging(Criteria criteria, String id) {
		
		return orderDao.myProductListPaging(criteria, id);
	}

	@Override
	public List<OrderVO> orderList(OrderVO vo) {
		
		return orderDao.orderList(vo);
	}

	@Override
	public int countMyOrder(String id) {
		
		return orderDao.countMyOrder(id);
	}

	@Override
	public List<OrderVO> orderListPaging(Criteria criteria, String id) {
		
		return orderDao.orderListPaging(criteria, id);
	}
	
	// �ֹ� Ȯ����ư
	@Override
	public void orderSet(OrderVO vo) {
		
		orderDao.orderSet(vo);
	}
	
	// �ֹ� ��޿뵵 ī��Ʈ
	@Override
	public int orderSetCount(String id) {
		
		return orderDao.orderSetCount(id);
	}

	@Override
	public OrderVO selectAllByPseq(int pseq) {
		return orderDao.selectAllByPseq(pseq);
	}

	@Override
	public HashMap<String, Object> orderDetail(int oseq) {
		
		return orderDao.orderDetail(oseq);
	}

}
