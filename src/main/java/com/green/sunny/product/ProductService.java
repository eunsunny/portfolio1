package com.green.sunny.product;

import java.util.List;

import com.green.sunny.dto.ProductImageVO;
import com.green.sunny.dto.ProductVO;
import com.green.sunny.utils.Criteria;

public interface ProductService {

	public List<ProductVO> getProductListByKind(String kind);
	
	public void insertProduct(ProductVO vo);
	
	public ProductVO getProduct(ProductVO vo);
	
	public ProductVO tryMethod(ProductVO vo);
	
	public void deleteProduct(int pseq);
	
	public void updateProduct(ProductVO vo);
	
	public List<ProductVO> getListWithPaging(Criteria criteria, String key, String kind);
	
	public int countProductList(String name, String kind);
	
	public void plusCount(ProductVO vo);
	
	public int selectCount(int pseq);
	
	public int selectMaxPseq();
	
	public void insertImage(ProductImageVO pvo);
	
	public String getOnePicture(int pseq);
	
	public List<ProductImageVO> getOtherPicture(ProductImageVO pvo);
	
	public void deleteComment(int pseq);
	
	public void deletePicture(int pseq);
}
