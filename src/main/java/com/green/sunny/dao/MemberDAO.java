package com.green.sunny.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.sunny.dto.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 아이디 가져오기
	public String getIdMember(String id) {
		
		return mybatis.selectOne("MemberDAO.getIdMember", id);
	}
	// 회원 상세정보
	// 등급표시용으로도 사용
	public MemberVO getMember(MemberVO vo) {
		
		return mybatis.selectOne("MemberDAO.getMember", vo);
	}
	
	// 회원 ID 존재 확인
	public int confirmID(String id) {
		
		String pwd = mybatis.selectOne("MemberDAO.confirmID", id);
		
		if (pwd != null) {  // 회원이 존재할 경우
			return 1;
		} else {   // 회원이 없을 경우
			return -1;
		}
	}
	
	/*
	 * 회원 로그인
	 */
	public int loginID(MemberVO vo) {
		int result = -1;
		String pwd = null;
		
		pwd = mybatis.selectOne("MemberDAO.confirmID", vo.getId());

		// DB에서 조회한 password와 사용자가 입력한 password비교
		if(pwd == null) {  // 사용자가 존재하지 않는 경우(아이디 틀린경우)
			result = -1;
		} else if (pwd.equals(vo.getPwd())) { // id와 pwd가 일치
			result = 1;
		} else {  // 비밀번호가 일치하지 않는 경우
			result = 0;
		}
		
		return result;
		
	}
	
	// 회원추가
	public void insertMember(MemberVO vo) {
		
		mybatis.insert("MemberDAO.insertMember", vo);
	}
	
	// 아이디 중복체크
	public int userIdCheck(String id) {
		
		return mybatis.selectOne("MemberDAO.checkOverId", id);
	}
	
	// 닉네임 중복체크
	public int userNicknameCheck(String nick_name) {
		
		return mybatis.selectOne("MemberDAO.checkOverNickname", nick_name);
	}
	
	// 회원정보 변경
	public void updateMember(MemberVO vo) {
		
		mybatis.update("MemberDAO.updateMember", vo);
	}
	
	// 아이디 찾기
	public MemberVO getMemberByNameAndEmail(String name, String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("email", email);
		
		return mybatis.selectOne("MemberDAO.getMemberByNameAndEmail", map);
	}
	
	public MemberVO findPassword(String id, String name, String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		
		return mybatis.selectOne("MemberDAO.findPassword", map);
	}
	
	public void changePassword(MemberVO vo) {
		
		mybatis.update("MemberDAO.changePassword", vo);
	}
	
	// 등급
//	public List<MemberVO> gradeSelect(MemberVO vo){
//		
//		return mybatis.selectOne("MemberDAO.gradeSelect", vo); 
//	}
	
	// 등급업
	public void gradeChange(MemberVO vo) {
		
		mybatis.update("MemberDAO.gradeChange", vo);
	}
	
}
