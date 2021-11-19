package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.MemberVO;

@Repository
public class MemberDAOimpl implements MemberDAO {
	@Inject
	private SqlSession sql;

	private static String namespace = "com.board.mappers.member";
	@Override
	public void loginform(MemberVO vo) throws Exception {
		sql.insert(namespace + ".loginform", vo);
		
	}
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sql.selectOne(namespace + ".login", vo);
	}
	@Override
	public List<MemberVO> list() throws Exception {
		return sql.selectList(namespace + ".list");
	}

}
