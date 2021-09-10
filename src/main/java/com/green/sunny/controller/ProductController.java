package com.green.sunny.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.green.sunny.comment.CommentService;
import com.green.sunny.dto.MemberVO;
import com.green.sunny.dto.OrderVO;
import com.green.sunny.dto.ProductCommentVO;
import com.green.sunny.dto.ProductImageVO;
import com.green.sunny.dto.ProductVO;
import com.green.sunny.member.MemberService;
import com.green.sunny.order.OrderService;
import com.green.sunny.product.ProductService;
import com.green.sunny.utils.Criteria;
import com.green.sunny.utils.PageMaker;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/category", method=RequestMethod.GET)
	public String productKindAction(ProductVO vo, Model model, @RequestParam(value="key", defaultValue="") String key,
			Criteria criteria, String kind) {
		
		System.out.println("vo=" +vo);
		//����¡ ó�� 
		List<ProductVO> prodList = productService.getListWithPaging(criteria, key, kind);

		ProductVO productTry = productService.tryMethod(vo);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria); 	//���� �������� �������� �׸� �� ���� 
		
		System.out.println("prodList="+prodList);
		
		//��ü �Խñ��� �� ��ȸ
		int totalCount = productService.countProductList(key, kind);
		pageMaker.setTotalCount(totalCount);

		model.addAttribute("productListSize", prodList.size());
		model.addAttribute("productList", prodList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("kind", kind);
		model.addAttribute("productTry",productTry);
		model.addAttribute("criteria", criteria);
		return "category/product_list";
	}
	
	@RequestMapping(value="/product_detail", method=RequestMethod.GET)
	public String productDetailAction(ProductVO vo, Model model, HttpSession session, ProductImageVO pvo) {
		
		//MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		int count = productService.selectCount(vo.getPseq());
		
		
		vo.setCnt(count);
		productService.plusCount(vo);
		ProductVO product = productService.getProduct(vo);	
		System.out.println(product);
		//��� �� 
		int totalComment = commentService.countCommentList(vo.getPseq());
		
		//�ٸ����� �ҷ�����
		List<ProductImageVO> productImageList = productService.getOtherPicture(pvo);
		
		model.addAttribute("productVO", product);
		model.addAttribute("productImageList", productImageList);
		model.addAttribute("totalComment", totalComment);
		
		return "category/product_detail";
	}
	
	
	@RequestMapping(value="/admin_product_write_form")
	public String adminProductWriteView(ProductVO vo, Model model, HttpSession session) {
		System.out.println(("vo=" +vo));
		
		String url = "member/login";
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		String kind_nm = vo.getKind_nm();
		
		if (loginUser == null) {
			return url;
		}else {
		
			//��� ������ �켱������ ������ �ϱ� 	
			String[] n = new String[]{"�м��Ƿ�/��ȭ", "��Ƽ", "���/���Ƶ�", "��ǰ", "�ֹ�/��Ȱ��ǰ", "���׸���", "����������", "������/����", "�ڵ�����ǰ", "����/����/DVD", "�ϱ�/����/���", "�ݷ�����", "�ｺ/�ǰ���ǰ", "���ᳪ��"};
			List<String> list = new ArrayList<String>();
			Collections.addAll(list, n);
			list.remove(kind_nm);
			list.add(0, kind_nm);
			int arrListSize = list.size();
			String kindList[] = list.toArray(new String[arrListSize]);
			
			String kindList2[] = {"���ŷ�", "�����ŷ�", "��ΰ���"};
			
			model.addAttribute("kindList", kindList);
			model.addAttribute("kindList2", kindList2);
			
			return "category/product_write";
		}
	}
	
	/*
	 * ��ǰ���
	 */
	@RequestMapping(value="/admin_product_write", method=RequestMethod.POST)
	public String adminProductWrite(MultipartHttpServletRequest uploadFile ,ProductVO vo, ProductImageVO pvo, HttpSession session) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if (loginUser == null) return "index";
		else {
			    vo.setId(loginUser.getId());
			    
			    String kind = productService.findCodByKindName(vo.getKind_nm());
			    vo.setKind(kind);
			    
				productService.insertProduct(vo);
				int pseq = productService.selectMaxPseq();
				
			    List<MultipartFile> fileList = uploadFile.getFiles("file");
	
		        String path = session.getServletContext().getRealPath("WEB-INF/resources/product_images/");
		       
		        //�������� ���ε�
		        for (MultipartFile mf : fileList) {
		            String originFileName = mf.getOriginalFilename(); // ���� ���� ��
		           
		            String safeFile = path + System.currentTimeMillis() + originFileName;
		            pvo.setProduct_image(System.currentTimeMillis() + originFileName);
		            pvo.setPseq(pseq);
		           
		            productService.insertImage(pvo);
		            try {
		                mf.transferTo(new File(safeFile));
		            } catch (IllegalStateException e) {
		                e.printStackTrace();
		            } catch (IOException e) {
		                e.printStackTrace();
		            }
		        }
		        return "redirect:category?kind="+vo.getKind();
		}
	}
	
	@RequestMapping(value="/cancel")
	public String test() {
		
		return "category/cancel";
	}
	
	@RequestMapping(value="/product_delete")
	public String productDelete(ProductVO vo) {
		
		productService.deleteFromJjimBypseq(vo.getPseq());
		productService.deleteComment(vo.getPseq());
		productService.deletePicture(vo.getPseq());
		productService.deleteProduct(vo.getPseq());
		
		return "redirect:category?kind="+vo.getKind();  
	}
	
	@RequestMapping(value="/update_form")
	public String productUpdate(Model model, HttpSession session, ProductVO vo) {
		
		String url = "member/login";
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return url;
		}else {
		
		ProductVO product = productService.getProduct(vo);	
		
		model.addAttribute("productVO", product);
			
		String kindList[] = {"�м��Ƿ�/��ȭ", "��Ƽ", "���/���Ƶ�", "��ǰ", "�ֹ�/��Ȱ��ǰ", "���׸���", "����������", "������/����", "�ڵ�����ǰ", "����/����/DVD", "�ϱ�/����/���", "�ݷ�����", "�ｺ/�ǰ���ǰ", "���ᳪ��"};
		String kindList2[] = {"���ŷ�", "�����ŷ�", "��ΰ���"};
		model.addAttribute("kindList", kindList);
		model.addAttribute("kindList2", kindList2);
		
		return "category/product_update";
		}
		
		
	}
	
	@RequestMapping(value="/product_update")
	public String continueProductUpdate(MultipartHttpServletRequest uploadFile,ProductVO vo, HttpSession session, ProductImageVO pvo) {
		
	MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "index";
		}
		else {
			        vo.setId(loginUser.getId());
				    
					//productService.insertProduct(vo);
					int pseq = productService.selectMaxPseq();
					
				    List<MultipartFile> fileList = uploadFile.getFiles("file");
			        String src = uploadFile.getParameter("src");
			        String path = session.getServletContext().getRealPath("WEB-INF/resources/product_images/");
			        
			        productService.deletePicture(pseq);
			        productService.updateProduct(vo);
			        
			        for (MultipartFile mf : fileList) {
			            String originFileName = mf.getOriginalFilename(); // ���� ���� ��
			            long fileSize = mf.getSize(); // ���� ������
			            
			            pvo.setProduct_image(originFileName);
			            pvo.setPseq(pseq);
			            
			            String safeFile = path + System.currentTimeMillis() + originFileName;
			            productService.insertImage(pvo);
			            try {
			                mf.transferTo(new File(safeFile));
			            } catch (IllegalStateException e) {
			                e.printStackTrace();
			            } catch (IOException e) {
			                e.printStackTrace();
			            }
			        }
			        return "redirect:category?kind="+vo.getKind();
		}
	}
	
	//�˻�
	@RequestMapping("list.do")
	public ModelAndView list(Criteria criteria,
			@RequestParam(defaultValue="user_id") String search_option, //�⺻ �˻� �ɼǰ��� �ۼ��ڷ� �Ѵ�.

            @RequestParam(defaultValue="") String keyword   //Ű������ �⺻���� ""���� �Ѵ�.
            )
        throws Exception{
		
		List<ProductVO> prodList = productService.listWithPaging2(criteria, keyword, search_option);
		//System.out.println("prodList:"+prodList);
		
		ModelAndView mav = new ModelAndView();
        Map<String,Object> map = new HashMap<>(); 
       
        PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria); 	//���� �������� �������� �׸� �� ���� 
		
		int totalCount = productService.countProductList2(search_option, keyword);
		pageMaker.setTotalCount(totalCount);
		
		map.put("criteria", criteria);
        map.put("productListSize", prodList.size());
        map.put("productList", prodList);  
        map.put("search_option", search_option);
        map.put("pageMaker", pageMaker);
        map.put("keyword", keyword);
        map.put("search_option", search_option);
        map.put("keyword", keyword);
        mav.addObject("map", map);
        
        
        System.out.println("map : "+map);
        mav.setViewName("category/product_list2");
		
		return mav;
	}
	
	@RequestMapping(value="/move_pay_form", method =RequestMethod.POST) 
	public String paypage(Model model, ProductVO vo, HttpSession session) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if (loginUser == null) return "/member/login";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("loginUserName", loginUser.getName());  
		paramMap.put("email", loginUser.getEmail()); 
		paramMap.put("phone", loginUser.getPhone()); 
		paramMap.put("address", loginUser.getAddress()); 
		paramMap.put("pseq", vo.getPseq());
		paramMap.put("price", vo.getPrice());
		paramMap.put("kind", vo.getKind());
		model.addAttribute("buyerInfo", paramMap);
		return "category/product_payform";
	}
	
	@RequestMapping(value="/call_iamport_success", method =RequestMethod.GET) 
	public String callPaySuccessPage(int pseq,
						Model model, ProductVO vo, HttpSession session) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if (loginUser == null) return "/member/login";
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap = orderService.selectAllByPseq(pseq);
		
		paramMap.put("loginUserName", loginUser.getName());  
		paramMap.put("email", loginUser.getEmail()); 
		paramMap.put("phone", loginUser.getPhone()); 
		paramMap.put("address", resultMap.get("BUYER_ADDRESS")); 
		paramMap.put("price", resultMap.get("PRICE"));
		
		model.addAttribute("buyerInfo", paramMap);
		
		
		return "category/product_pay_success";
	}
	
	@RequestMapping(value="/call_iamport_fail", method =RequestMethod.GET) 
	public String callPayFailPage(Model model, ProductVO vo, HttpSession session) {
		return "category/product_pay_fail";
	}
	
	@RequestMapping(value="/pay_save")
	@ResponseBody
	public boolean paySave(@RequestParam Map<String,Object> paramMap, HttpSession session) {
		//paramMap = {buyer_address=��õ ��籸 ������� 35 , pseq=81, id=one}
		System.out.println("huj"+paramMap);
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		paramMap.put("id", loginUser.getId());
		
		productService.updateSoldyn(paramMap);
		
		return productService.insertPayInfo(paramMap) == 1 ? true : false; 
	}
}	