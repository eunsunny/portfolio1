package com.green.sunny.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.sunny.dao.OrderDAO;
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

}
