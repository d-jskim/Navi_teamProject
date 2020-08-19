package com.dao;

import java.util.List;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vo.ChartVO;

@Repository
public class ChartDAO {

	@Autowired
	private SqlSessionFactory sqlSessionFactory;

	public List<ChartVO> countCategory(int member_no) {
			
		List<ChartVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			list = session.selectList("com.mapper.ChartMapper.countCategory", member_no);
		} finally {
			session.close();
		}		
	
		return list;
	}

	public List<ChartVO> countEmptyPost(int member_no) {
		List<ChartVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			list = session.selectList("com.mapper.ChartMapper.countEmptyPost", member_no);
		} finally {
			session.close();
		}		
	
		return list;
	}

	public List<ChartVO> countCategoryAdmin() {
		List<ChartVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			list = session.selectList("com.mapper.ChartMapper.countCategoryAdmin");
		} finally {
			session.close();
		}		
	
		return list;
	}

	public List<ChartVO> countPostAdmin() {
		List<ChartVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			list = session.selectList("com.mapper.ChartMapper.countPostAdmin");
		} finally {
			session.close();
		}		
	
		return list;
	}

	public List<ChartVO> countGenderAdmin() {
		List<ChartVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			list = session.selectList("com.mapper.ChartMapper.countGender");
		} finally {
			session.close();
		}		
	
		return list;
	}
}
