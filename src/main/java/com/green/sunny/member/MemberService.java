package com.green.sunny.member;

import com.green.sunny.dto.MemberVO;

public interface MemberService {
	
	// ���̵� ��������
	public String getIdMember(String id);
	
	// ȸ�� ������
	// ���ǥ�ÿ����ε� ���
	MemberVO getMember(MemberVO vo);

	// ȸ�� ID ���� Ȯ��
	int confirmID(String id);

	/*
	 * ȸ�� �α���
	 */
	int loginID(MemberVO vo);

	// ȸ���߰�
	void insertMember(MemberVO vo);

	// ���̵� �ߺ� üũ
	public int userIdCheck(String id);
	
	// �г��� �ߺ�üũ
	public int userNicknameCheck(String nick_name);

	// ȸ������ ����
	public void updateMember(MemberVO vo);
	
	// ���̵� ã��
	public MemberVO getMemberByNameAndEmail(String name, String email);
	
	public MemberVO findPassword(String id, String name, String email);
	
	public void changePassword(MemberVO vo);
	
	// ��޾�
	public void gradeChange(MemberVO vo);
	
}