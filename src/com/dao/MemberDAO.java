package com.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vo.MemberVO;

@Repository(value = "memberDAO")
public class MemberDAO {
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;

	public MemberVO doLogin(MemberVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		MemberVO res = null;
		try {
			res = session.selectOne("com.mapper.MemberMapper.doLogin", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	public int updateImage(MemberVO m_vo) {
		
		SqlSession session = sqlSessionFactory.openSession();		
		int count = 0;
		
		try {
			count = session.update("com.mapper.MemberMapper.updateImage", m_vo);
			if(count > 0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return count;
		
	}
	
	public MemberVO selectMember(int member_no) {
		
		SqlSession session = sqlSessionFactory.openSession();
		MemberVO vo = null;
		
		try {
			vo = session.selectOne("com.mapper.MemberMapper.selectMember", member_no);
		} finally {
			session.close();
		}		
		
		return vo;
	}

}
