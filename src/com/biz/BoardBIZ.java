package com.biz;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BoardDAO;
import com.dao.BoardDaoJDBC;
import com.vo.CommentsVO;
import com.vo.DataVO;
import com.vo.GoodsVO;
import com.vo.GradeVO;
import com.vo.SharingVO;

@Service(value = "boardBIZ")
public class BoardBIZ {
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Autowired
	private BoardDaoJDBC boardDaoJDBC;

	public List<DataVO> selectAllIndex() {
		return boardDaoJDBC.selectAllIndex();
	}

	public List<DataVO> selectAllGoods() {
		return boardDaoJDBC.selectAllGoods();
	}

	public GoodsVO selectOneGoods(int goods_no) throws ParseException {
		return boardDaoJDBC.selectOneGoods(goods_no);
	}
	
	public SharingVO selectStatus(int goods_no) {		
		return boardDAO.selectStatus(goods_no);
	}
	
	public void updateStatus(SharingVO sh_vo) {
		boardDAO.updateStatus(sh_vo);
	}
	
	public GoodsVO selectGoods(int goods_no) {
		return boardDAO.selectGoods(goods_no);
	}
	
	public String insertGoods(GoodsVO g_vo) {
			String res = boardDaoJDBC.insertGoods(g_vo);
			int count = 0;
			if(!res.isEmpty()) {
				count = updateGrade(g_vo.getMember_no());
				System.out.println("updateGrade »Æ¿Œ:  " + count);
			}
		return res;
	}
	
	public int updateGrade(int member_no) {
		return boardDAO.updateGrade(member_no);
	}
	
	public GoodsVO selectRecentGoods(int member_no) {		
		return boardDaoJDBC.selectRecentGoods(member_no);
	}
	
	public void insertSharing(GoodsVO goodsVO) {
		boardDAO.insertSharing(goodsVO);
	}
	
	public GoodsVO updateGoods(GoodsVO g_vo) {
		return boardDAO.updateGoods(g_vo);
	}

	public List<DataVO> selectAllComments(int goods_no) {
		return boardDaoJDBC.selectAllComments(goods_no);
	}

	public void doComment(CommentsVO vo) {
		boardDaoJDBC.doComment(vo);
	}

	public void deleteComment(int comments_no) {
		boardDaoJDBC.deleteComment(comments_no);
	}

	public List<DataVO> selectAllLikes(int goods_no) {
		return boardDaoJDBC.selectAllLikes(goods_no);
	}

	public void doLike(int goods_no, int member_no) {		
		boardDaoJDBC.doLike(goods_no, member_no);		
	}
	
	public void doUnlike(int goods_no, int member_no) {
		boardDaoJDBC.doUnlike(goods_no, member_no);		
	}
	
	public int deleteGoods(int goods_no) {
		return boardDAO.deleteGoods(goods_no);		
	}

}
