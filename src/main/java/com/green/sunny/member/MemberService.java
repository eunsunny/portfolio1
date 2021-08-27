package com.green.sunny.member;

import java.util.List;

import com.green.sunny.dto.AddressDoroVO;
import com.green.sunny.dto.AddressJibunVO;
import com.green.sunny.dto.MemberVO;

public interface MemberService {

	// 회원 상세정보
	MemberVO getMember(MemberVO vo);

	// 회원 ID 존재 확인
	int confirmID(String id);

	/*
	 * 회원 로그인
	 */
	int loginID(MemberVO vo);

	// 회원추가
	void insertMember(MemberVO vo);
	
	// 주소 찾기
	// 동으로 찾기
	public List<AddressJibunVO> selectAddressByDong(String dong) ;
	
	// 도로명으로 찾기
	public List<AddressDoroVO> selectAddressByDoro(String doro);
	
	// 아이디 중복 체크
	public int userIdCheck(String id);
	
	// 닉네임 중복체크
	public int userNicknameCheck(String nick_name);

	// 회원정보 변경
	public void updateMember(MemberVO vo);
	
	// 아이디 찾기
	public MemberVO getMemberByNameAndEmail(String name, String email);
	
	public MemberVO findPassword(String id, String name, String email);
	
	public void changePassword(MemberVO vo);
	
}