package com.green.sunny.product;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.sunny.dao.ProductDAO;
import com.green.sunny.dto.ProductImageVO;
import com.green.sunny.dto.ProductVO;
import com.green.sunny.utils.Criteria;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO pDao;

	@Override
	public List<ProductVO> getProductListByKind(String kind) {
		
		return pDao.getProductListByKind(kind);
	}

	@Override
	public void insertProduct(ProductVO vo) {
		
		pDao.insertProduct(vo);
		
	}

	@Override
	public ProductVO getProduct(ProductVO vo) {
		
		return pDao.getProduct(vo);
	}

	@Override
	public void deleteProduct(int pseq) {

		pDao.deleteProduct(pseq);
		
	}

	@Override
	public void updateProduct(ProductVO vo) {
		pDao.updateProduct(vo);
		
	}

	@Override
	public List<ProductVO> getListWithPaging(Criteria criteria, String key, String kind) {

		return pDao.getListWithPaging(criteria, key, kind);
	}

	@Override
	public int countProductList(String name, String kind) {
	
		return pDao.countProductList(name, kind);
	}

	@Override
	public ProductVO tryMethod(ProductVO vo) {
		
		return pDao.tryMethod(vo);
	}

	@Override
	public void plusCount(ProductVO vo) {
		
		pDao.plusCount(vo);
	}

	@Override
	public int selectCount(int pseq) {
		
		return pDao.selectCount(pseq);
	}

	@Override
	public void insertImage(ProductImageVO pvo) {
		
		pDao.insertImage(pvo);
	}

	@Override
	public int selectMaxPseq() {
		return pDao.selectMaxPseq();
	}

	@Override
	public String getOnePicture(int pseq) {
		
		return pDao.getOnePicture(pseq);
	}

	@Override
	public List<ProductImageVO> getOtherPicture(ProductImageVO pvo) {
	
		return pDao.getOtherPicture(pvo);
	}

	@Override
	public void deleteComment(int pseq) {
		
		pDao.deleteComment(pseq);
	}

	@Override
	public void deletePicture(int pseq) {
		
		pDao.deletePicture(pseq);
	}

	@Override
	public List<ProductVO> listWithPaging2(Criteria criteria, String keyword, String search_option) {
		
		return pDao.listWithPaging2(criteria, keyword, search_option);
	}

	@Override
	public int countProductList2(String search_option, String keyword) {
		
		return pDao.countProductList2(search_option, keyword);
	}

	@Override
	public List<ProductImageVO> getAllPicture() {
		
		return pDao.getAllPicture();
	}
	
	@Override
	public int insertPayInfo(Map<String,Object> paramMap) {
		return pDao.insertPayInfo(paramMap);
	}

	@Override
	public void updateSoldyn(Map<String, Object> paramMap) {
		pDao.updateSoldyn(paramMap);
		
	}
}
