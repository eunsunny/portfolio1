package com.green.sunny.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.green.sunny.dto.AddressDoroVO;
import com.green.sunny.dto.AddressJibunVO;
import com.green.sunny.dto.MemberVO;
import com.green.sunny.member.MemberService;

@Controller
@SessionAttributes("loginUser")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	// 로그인 화면 표시
	@RequestMapping("/login_form")
	public String loginView() {

		return "member/login";
	}

	// 사용자 로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginAction(MemberVO vo, Model model, 
							  @RequestParam(value = "id") String id,
							  @RequestParam(value = "pwd") String pwd) {

		MemberVO loginUser = null;

		int result = memberService.loginID(vo);

		if (result == 1) { // 사용자 인증 성공
			loginUser = memberService.getMember(vo);

			model.addAttribute("loginUser", loginUser);
			
			return "redirect:/index";

		} else {

			return "member/login_fail";
		}

	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(SessionStatus status) {

		status.setComplete();

		return "redirect:/index";
	}

	// 약관동의 화면 출력
	@RequestMapping("/contract")
	public String contractView() {

		return "member/contract";
	}

	// 회원가입 페이지 출력
	@RequestMapping("/join_form")
	public String joinView() {

		return "member/join";
	}

	// 아이디 중복체크 컨트롤러
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestParam(value = "id") String id) throws Exception {

		int result = memberService.userIdCheck(id);

		System.out.println(result);

		return result;

	}

	// 회원가입 완료
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinAction(@RequestParam(value = "addr1") String addr1,
							 @RequestParam(value = "addr2") String addr2, 
							 MemberVO vo) {

		String id = memberService.getIdMember(vo.getId());

		if (vo.getId().equals(id)) {

			return "member/join_fail";

		} else {

			vo.setAddress(addr1 + " " + addr2);
			memberService.insertMember(vo);

			return "member/login";
			
		}

	}

	@RequestMapping("/find_zip_num_dong")
	public String findZipNum1() {

		return "member/findZipNumDong";
	}

	@RequestMapping("/find_zip_num_doro")
	public String findZipNum2() {

		return "member/findZipNumDoro";
	}

	// 주소찾기
	@RequestMapping(value = "/find_zip_dong", method = RequestMethod.POST)
	public String findZipNumDongAction(AddressJibunVO vo, Model model) {

		List<AddressJibunVO> addrList = memberService.selectAddressByDong(vo.getDong());

		model.addAttribute("addressList", addrList);

		return "member/findZipNumDong";
	}

	@RequestMapping(value = "/find_zip_doro", method = RequestMethod.POST)
	public String findZipNumDoroAction(AddressDoroVO vo, Model model) {

		List<AddressDoroVO> addrList = memberService.selectAddressByDoro(vo.getDoro());

		model.addAttribute("addressList", addrList);

		return "member/findZipNumDoro";
	}

	// 회원정보 페이지 넘기기 및 정보 가져오기
	@RequestMapping("/member_info")
	public String memberInfo(HttpSession session, MemberVO vo, Model model) {

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			
			return "member/login";
		} else {

			String[] kindList = { "패션의류/잡화", "뷰티", "출산/유아동", "식품", "주방/생활용품", "인테리어", "가전디지털", "스포츠/레저", 
								"자동차용품", "도서/음반/DVD", "완구/문구/취미", "반려동물", "헬스/건강식품" };

			model.addAttribute("inter_kindList", kindList);

			vo.setId(loginUser.getId());

			MemberVO member = memberService.getMember(vo);
			model.addAttribute("MemberVO", member);

			return "member/memberInfo";

		}
	}

	// 회원정보 변경 페이지 이동
	@RequestMapping("/member_update_form")
	public String updateMemberView(HttpSession session, MemberVO vo, Model model) {

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			
			return "member/login";
		} else {

			String[] kindList = { "패션의류/잡화", "뷰티", "출산/유아동", "식품", "주방/생활용품", "인테리어", "가전디지털", "스포츠/레저", "자동차용품",
					"도서/음반/DVD", "완구/문구/취미", "반려동물", "헬스/건강식품" };

			model.addAttribute("inter_kindList", kindList);

			vo.setId(loginUser.getId());

			MemberVO member = memberService.getMember(vo);
			model.addAttribute("MemberVO", member);

			return "member/memberUpdate";
		}
	}

	// 회원정보 변경
	@RequestMapping(value = "/member_update", method = RequestMethod.POST)
	public String updateMember(@RequestParam(value = "addr1") String addr1, 
							   @RequestParam(value = "addr2") String addr2, 
							   MemberVO vo, HttpSession session) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		vo.setId(loginUser.getId());
		vo.setAddress(addr1 + " " + addr2);

		memberService.updateMember(vo);

		return "redirect:member_info";

	}

	// 아이디 비밀번호 찾기 페이지로 이동
	@RequestMapping("/find_id_form")
	public String findIdView() {

		return "member/find_id";
	}

	@RequestMapping("/find_pwd_form")
	public String findPwdView() {

		return "member/find_pwd";
	}

	@RequestMapping("/find_id")
	public String findId(MemberVO vo, Model model) {

		String name = vo.getName();
		String email = vo.getEmail();

		MemberVO member = memberService.getMemberByNameAndEmail(name, email);

		if (member != null) {
			model.addAttribute("message", 1);
			model.addAttribute("id", member.getId());
		} else {
			model.addAttribute("message", -1);
		}

		return "member/findResult";

	}

	@RequestMapping("/find_pwd")
	public String findPwd(MemberVO vo, Model model) {

		String id = vo.getId();
		String name = vo.getName();
		String email = vo.getEmail();

		MemberVO member = memberService.findPassword(id, name, email);

		if (member != null) {
			model.addAttribute("message", 1);
			model.addAttribute("id", member.getId());
		} else {
			model.addAttribute("message", -1);
		}

		return "member/findPwdResult";

	}

	@RequestMapping("/change_pwd")
	public String changePwd(MemberVO vo, Model model) {

		memberService.changePassword(vo);

		return "member/close";

	}

}
