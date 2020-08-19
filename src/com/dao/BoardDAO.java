package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vo.GoodsVO;
import com.vo.GradeVO;
import com.vo.SharingVO;

@Repository(value = "boardDAO")
public class BoardDAO {
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;

	
	public GoodsVO insertGoods(GoodsVO g_vo) {
		SqlSession session = sqlSessionFactory.openSession();
		GoodsVO res = null;
		
		try {
			int count = session.insert("com.mapper.BoardMapper.insertGoods", g_vo);
			if(count > 0) {
				res = g_vo;
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}


	public List<GoodsVO> doSelectAll() {
		List<GoodsVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			list = session.selectList("com.mapper.BoardMapper.selectAllGoods");
		} finally {
			session.close();
		}
		return list;
	}

	public void updateStatus(SharingVO sh_vo) {
		SqlSession session = sqlSessionFactory.openSession();
		System.out.println("DAO updateStatus: " + sh_vo.toString());
		
		try {
			int count = session.update("com.mapper.BoardMapper.updateStatus", sh_vo);
			if(count > 0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}


	public void insertSharing(GoodsVO goodsVO) {
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			int count = session.insert("com.mapper.BoardMapper.insertSharing", goodsVO);
			if(count > 0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
	}


	public SharingVO selectStatus(int goods_no) {
		
		SharingVO g_vo = new SharingVO();
		SqlSession session = sqlSessionFactory.openSession();
		try {
			g_vo = session.selectOne("com.mapper.BoardMapper.selectStatus", goods_no);					
		} finally {
			session.close();
		}
		return g_vo;
	}
	
	public GoodsVO selectGoods(int goods_no) {
		GoodsVO g_vo = new GoodsVO();
		SqlSession session = sqlSessionFactory.openSession();
		try {
			g_vo = session.selectOne("com.mapper.BoardMapper.selectGoods", goods_no);					
		} finally {
			session.close();
		}
		return g_vo;
	}


	public GoodsVO updateGoods(GoodsVO g_vo) {
		SqlSession session = sqlSessionFactory.openSession();
		GoodsVO res_vo = null;
		try {
			int count = session.update("com.mapper.BoardMapper.updateGoods", g_vo);
			if(count > 0) {
				session.commit();
				res_vo = g_vo; 
				//성공적으로 업데이트가 됐을 경우에만 g_vo를 리턴하고 싶어서 일부러 res_vo에 대입하고 finally 이후 res_vo 리턴
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
			System.out.println("여기 session.close() finally 구문");
		}
		return res_vo;
	}
	
	public int deleteGoods(int goods_no) {
		SqlSession session = sqlSessionFactory.openSession();
		int res = 0;
		try {
			res = session.delete("com.mapper.BoardMapper.deleteGoods", goods_no);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}


	public int updateGrade(int member_no) {
		SqlSession session = sqlSessionFactory.openSession();
		int count = 0;
		try {
			count = session.update("com.mapper.MemberMapper.updateGrade", member_no);
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

}
