package com.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.vo.MemberVO;

public interface MemberMapper {

	@Select(value = "select * from member where email = #{ email } and password = #{ password }")
	public MemberVO doLogin(MemberVO vo);
	
	@Update(value = "update member set member_image = #{member_image} where member_no = #{member_no}")
	public int updateImage(MemberVO vo);
	
	@Select(value = "select * from member where member_no = #{member_no}")
	public MemberVO selectMember(int member_no);
	
	@Update("update grade set grade = case when(share_point + empty_point between 0 and 100) then '»õ½Ï' " + 
			"when(share_point + empty_point between 101 and 200) then '³ª¹«'" + 
			"when(share_point + empty_point > 200) then '½£' end where member_no = #{member_no}")
	public int updateGrade(int member_no);
	
}
