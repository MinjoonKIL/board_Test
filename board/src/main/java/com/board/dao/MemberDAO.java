package com.board.dao;

import java.util.List;

import com.board.domain.MemberVO;

public interface MemberDAO {
	// 게시물 목록
	public List<MemberVO> list() throws Exception;
	
	// 회원가입
	public void loginform(MemberVO vo) throws Exception;

	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;
}
