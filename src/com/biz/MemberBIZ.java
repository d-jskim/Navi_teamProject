package com.biz;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dao.MemberDaoJDBC;
import com.dao.ProfileDaoJDBC;
import com.vo.DataVO;
import com.vo.MemberVO;

@Service(value = "memberBIZ")
public class MemberBIZ {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private MemberDaoJDBC memberDaoJDBC;
	
	@Autowired
	private ProfileDaoJDBC profileDaoJDBC;

	public MemberVO doLogin(MemberVO vo) {
		return memberDAO.doLogin(vo);
	}
	
	public MemberVO doSignup(MemberVO vo) throws ParseException {
		return memberDaoJDBC.doSignup(vo);
	}

	public List<DataVO> selectAllMember() {
		return memberDaoJDBC.selectAllMember();
	}

	public void doDelete(int member_no) {
		memberDaoJDBC.doDelete(member_no);
	}
	
	public DataVO userProfile(int member_no) throws ParseException {
		return profileDaoJDBC.userProfile(member_no);
	}
	
	public int updateImage(MemberVO m_vo) {
		return memberDAO.updateImage(m_vo);
	}
	public MemberVO selectMember(int member_no) {
		return memberDAO.selectMember(member_no);
	}

}
