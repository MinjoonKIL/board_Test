package com.board.service;

import java.util.List;

import com.board.domain.MemberVO;

public interface MemberService {
	
	// 게시물 목록
	public List<MemberVO> list() throws Exception;
	
	// 회원가입
	public void loginform(MemberVO vo) throws Exception;

	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;
}
