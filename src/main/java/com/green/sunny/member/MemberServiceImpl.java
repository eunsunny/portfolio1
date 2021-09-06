package com.green.sunny.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.sunny.dao.MemberDAO;
import com.green.sunny.dto.AddressDoroVO;
import com.green.sunny.dto.AddressJibunVO;
import com.green.sunny.dto.MemberVO;
import com.green.sunny.member.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDao;

	@Override
	public MemberVO getMember(MemberVO vo) {
		
		return memberDao.getMember(vo);
	}

	@Override
	public int confirmID(String id) {
		
		return memberDao.confirmID(id);
	}

	@Override
	public int loginID(MemberVO vo) {
		
		return memberDao.loginID(vo);
	}

	@Override
	public void insertMember(MemberVO vo) {
		
		memberDao.insertMember(vo);
	}
	
	@Override
	public List<AddressJibunVO> selectAddressByDong(String dong) {
		
		return memberDao.selectAddressByDong(dong);
	}
	
	@Override
	public List<AddressDoroVO> selectAddressByDoro(String doro) {
		
		return memberDao.selectAddressByDoro(doro);
	}

	@Override
	public int userIdCheck(String id) {
		
		return memberDao.userIdCheck(id);
	}

	@Override
	public int userNicknameCheck(String nick_name) {
		
		return memberDao.userNicknameCheck(nick_name);
	}

	@Override
	public void updateMember(MemberVO vo) {
		
		memberDao.updateMember(vo);
	}

	@Override
	public MemberVO getMemberByNameAndEmail(String name, String email) {
		
		return memberDao.getMemberByNameAndEmail(name, email);
	}

	@Override
	public MemberVO findPassword(String id, String name, String email) {
		
		return memberDao.findPassword(id, name, email);
	}

	@Override
	public void changePassword(MemberVO vo) {
		
		memberDao.changePassword(vo);
	}

	@Override
	public String getIdMember(String id) {
		
		return memberDao.getIdMember(id);
	}

	@Override
	public void gradeChange(MemberVO vo) {
		
		memberDao.gradeChange(vo);
	}

	

}
