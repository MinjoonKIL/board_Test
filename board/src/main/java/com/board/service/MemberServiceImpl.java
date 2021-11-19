package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.MemberDAO;
import com.board.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO dao;
	
	@Override
	public void loginform(MemberVO vo) throws Exception {
		dao.loginform(vo);
		
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return dao.login(vo);
	}

	@Override
	public List<MemberVO> list() throws Exception {
		return dao.list();
	}

}
