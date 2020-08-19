package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.vo.GoodsVO;
import com.vo.SharingVO;

public interface BoardMapper {

	@Insert("insert into empty_goods (goods_no, goods_name, goods_image, goods_category, goods_price, empty_date, empty_reason, empty_way, memo, post_date, member_no) " + 
			"values(empty_goods_seq.nextval, #{goods_name}, #{goods_image}, #{goods_category}, #{goods_price}, #{empty_date}, #{empty_reason}, #{empty_way}, #{memo}, sysdate, #{member_no})")
	public int insertGoods(GoodsVO vo);
	
	@Select("select * from empty_goods")
	public List<GoodsVO> selectAllGoods();
	
	@Select("select * from empty_goods where goods_no = #{goods_no}")
	public GoodsVO selectGoods(int goods_no);
	
	@Insert("insert into sharing(goods_no, member_no) values(#{goods_no}, #{member_no})")
	public void insertSharing(GoodsVO vo);
	
	@Update("update sharing set status = #{status} where goods_no = #{goods_no}")
	public void updateStatus(SharingVO vo);
	
	@Select("select * from sharing where goods_no = #{goods_no}")
	public SharingVO selectStatus(int goods_no);
	
	@Update("update empty_goods set goods_name = #{goods_name}, goods_image = #{goods_image}, " + 
			"goods_category = #{goods_category}, goods_price = #{goods_price}, empty_date = #{empty_date}, "+ 
			"empty_reason =#{empty_reason}, empty_way = #{empty_way}, memo = #{memo} where goods_no = #{goods_no}")
	public int updateGoods(GoodsVO goodsVO);
	
	@Delete("delete from empty_goods where goods_no = #{goods_no}")
	public int deleteGoods(int goods_no);
	
	
}
