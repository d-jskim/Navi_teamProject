package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.vo.ChartVO;

public interface ChartMapper {
	
	@Select("select goods_category, count(*) as count from empty_goods group by goods_category ")
	public List<ChartVO> countCategoryAdmin();
	
	@Select("select TO_CHAR(empty_date, 'YYYY-MM-DD') as empty_date, count(*) as count from empty_goods group by empty_date")
	public List<ChartVO> countPostAdmin();
	
	@Select("select gender, count(*) as count from member group by gender")
	public List<ChartVO> countGender();
	
	@Select("select goods_category, count(*) as count from empty_goods where member_no = #{member_no} group by goods_category ")
	public List<ChartVO> countCategory(int member_no);
	
	@Select("select TO_CHAR(empty_date, 'YYYY-MM-DD') as empty_date, count(*) as count from empty_goods where member_no = #{member_no} group by empty_date")
	public List<ChartVO> countEmptyPost(int member_no);
	
}
