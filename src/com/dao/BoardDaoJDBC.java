package com.dao;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import com.vo.CommentsVO;
import com.vo.DataVO;
import com.vo.GoodsVO;

import oracle.jdbc.OracleTypes;

@Repository(value = "boardDaoJDBC")
public class BoardDaoJDBC {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SimpleJdbcCall simpleJdbcCall;
	
	public SimpleJdbcCall createSimpleJdbcCall() {
		return new SimpleJdbcCall(this.jdbcTemplate);
	}

	public List<DataVO> selectAllIndex() {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("SELECTALLINDEX")
			.returningResultSet("dataVO", new RowMapper<DataVO>() {

				@Override
				public DataVO mapRow(ResultSet rs, int rowNum) throws SQLException {
					DataVO vo = new DataVO();
					vo.setGoods_no(String.valueOf(rs.getString("goods_no")));
					vo.setGoods_name(rs.getString("goods_name"));
					vo.setGoods_image(rs.getString("goods_image"));
					vo.setGoods_category(rs.getString("goods_category"));
					vo.setGoods_price(String.valueOf(rs.getString("goods_price")));
					vo.setEmpty_date(rs.getString("empty_date"));
					vo.setEmpty_reason(rs.getString("empty_reason"));
					vo.setEmpty_way(rs.getString("empty_way"));
					vo.setMemo(rs.getString("memo"));
					vo.setPost_date(rs.getString("post_date"));
					vo.setMember_no(String.valueOf(rs.getInt("member_no")));
					vo.setLikes_count(String.valueOf(rs.getInt("likes_count")));
					vo.setComments_count(String.valueOf(rs.getInt("comments_count")));
					return vo;
				}
				
			});
		Map<String, Object> out = simpleJdbcCall.execute();
		List<DataVO> list = (List<DataVO>) out.get("SELECTALLINDEX_RES");
		return list;
	}

	public List<DataVO> selectAllGoods() {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("SELECTALLGOODS")
			.returningResultSet("dataVO", new RowMapper<DataVO>() {
	
				@Override
				public DataVO mapRow(ResultSet rs, int rowNum) throws SQLException {
					DataVO vo = new DataVO();
					vo.setGoods_no(String.valueOf(rs.getString("goods_no")));
					vo.setGoods_name(rs.getString("goods_name"));
					vo.setGoods_image(rs.getString("goods_image"));
					vo.setGoods_category(rs.getString("goods_category"));
					vo.setGoods_price(String.valueOf(rs.getString("goods_price")));
					vo.setEmpty_date(rs.getString("empty_date"));
					vo.setEmpty_reason(rs.getString("empty_reason"));
					vo.setEmpty_way(rs.getString("empty_way"));
					vo.setMemo(rs.getString("memo"));
					vo.setPost_date(rs.getString("post_date"));
					vo.setMember_no(String.valueOf(rs.getInt("member_no")));
					vo.setLikes_count(String.valueOf(rs.getInt("likes_count")));
					vo.setComments_count(String.valueOf(rs.getInt("comments_count")));
					return vo;
				}
				
			});
		Map<String, Object> out = simpleJdbcCall.execute();
		List<DataVO> list = (List<DataVO>) out.get("SELECTALLGOODS_RES");
		return list;
	}

	public GoodsVO selectOneGoods(int goods_no) throws ParseException {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("SELECTONEGOODS")
			.addDeclaredParameter(new SqlOutParameter("SELECTONEGOODS_RES", OracleTypes.CURSOR));
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("P_GOODS_NO", goods_no);
		Map<String, Object> out = simpleJdbcCall.execute(in);
		List<Map<String, Object>> list = (List<Map<String, Object>>) out.get("SELECTONEGOODS_RES");
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		GoodsVO res = new GoodsVO();
		res.setGoods_no(Integer.parseInt(list.get(0).get("goods_no").toString()));
		res.setGoods_name(list.get(0).get("goods_name").toString());
		res.setGoods_image(list.get(0).get("goods_image").toString());
		res.setGoods_category(list.get(0).get("goods_category").toString());
		res.setGoods_price(Integer.parseInt(list.get(0).get("goods_price").toString()));
		res.setEmpty_date(sdf.parse(list.get(0).get("empty_date").toString()));
		res.setEmpty_reason(list.get(0).get("empty_reason").toString());
		res.setEmpty_way(list.get(0).get("empty_way").toString());
		res.setMemo(list.get(0).get("memo").toString());
		res.setPost_date(sdf.parse(list.get(0).get("post_date").toString()));
		res.setMember_no(Integer.parseInt(list.get(0).get("member_no").toString()));
		return res;
	}
	
	public String insertGoods(GoodsVO vo) {
		simpleJdbcCall = createSimpleJdbcCall();	
		
		simpleJdbcCall.withProcedureName("insertGoods");
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("G_NAME", vo.getGoods_name())
				.addValue("G_IMAGE", vo.getGoods_image())
				.addValue("G_CATEGORY", vo.getGoods_category())
				.addValue("G_PRICE", vo.getGoods_price())
				.addValue("E_DATE", vo.getEmpty_date())
				.addValue("E_REASON", vo.getEmpty_reason())
				.addValue("E_WAY", vo.getEmpty_way())
				.addValue("MEMO", vo.getMemo())
				.addValue("M_NO", vo.getMember_no());
		
		Map<String, Object> out = simpleJdbcCall.execute(in);
		
		simpleJdbcCall.withoutProcedureColumnMetaDataAccess();
	    //simpleJdbcCall.setAccessCallParameterMetaData(false);
		String msg = "1 row has been inserted successfully.";
		
		return msg;
	}
	
	public GoodsVO selectRecentGoods(int member_no) {
		simpleJdbcCall = createSimpleJdbcCall();
		System.out.println("DAO-selectRecentGoods: " + member_no);
		simpleJdbcCall.withProcedureName("selectRecentGoods02");
		SqlParameterSource in = new MapSqlParameterSource().addValue("M_NO_V", member_no);
		
		System.out.println("에러나는 부분");
		Map<String, Object> out = simpleJdbcCall.execute(in);
		System.out.println(out);
		System.out.println("hey 3");
		
		GoodsVO vo = new GoodsVO();
		vo.setGoods_no(((BigDecimal)out.get("G_NO")).intValue());
		vo.setGoods_name((String)out.get("G_NAME"));
		vo.setGoods_image((String)out.get("G_IMAGE"));
		vo.setGoods_category((String)out.get("G_CATEGORY"));
		vo.setGoods_price(((BigDecimal)out.get("G_PRICE")).intValue());
		vo.setEmpty_date((Date)out.get("E_DATE"));
		vo.setEmpty_reason((String)out.get("E_REASON"));
		vo.setEmpty_way((String)out.get("E_WAY"));
		vo.setMemo((String)out.get("MEMO"));
		vo.setPost_date((Date)out.get("P_DATE"));
		vo.setMember_no(((BigDecimal)out.get("M_NO")).intValue());
		return vo;
	}

	public List<DataVO> selectAllComments(int goods_no) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("SELECTALLCOMMENTS")
			.returningResultSet("dataVO", new RowMapper<DataVO>() {

				@Override
				public DataVO mapRow(ResultSet rs, int rowNum) throws SQLException {
					DataVO vo = new DataVO();
					vo.setComments_no(String.valueOf(rs.getString("comments_no")));
					vo.setGoods_no(String.valueOf(rs.getString("goods_no")));
					vo.setMember_no(String.valueOf(rs.getString("member_no")));
					vo.setContents(rs.getString("contents"));
					vo.setComments_date(rs.getString("comments_date"));
					vo.setUpdated_date(rs.getString("updated_date"));
					vo.setComments_level(String.valueOf(rs.getString("comments_level")));
					vo.setMember_image(rs.getString("member_image"));
					vo.setUsername(rs.getString("username"));
					return vo;
				}
				
			});
		SqlParameterSource in = new MapSqlParameterSource()
			.addValue("P_GOODS_NO", goods_no);
		Map<String, Object> out = simpleJdbcCall.execute(in);
		List<DataVO> list = (List<DataVO>) out.get("SELECTALLCOMMENTS_RES");
		return list;
	}

	public void doComment(CommentsVO vo) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("DOCOMMENT");
		SqlParameterSource in = new MapSqlParameterSource()
		.addValue("P_GOODS_NO", vo.getGoods_no())
		.addValue("P_MEMBER_NO", vo.getMember_no())
		.addValue("P_CONTENTS", vo.getContents())
		.addValue("P_COMMENTS_LEVEL", vo.getComments_level());
		simpleJdbcCall.execute(in);
	}

	public void deleteComment(int comments_no) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("DELETECOMMENT");
		SqlParameterSource in = new MapSqlParameterSource()
		.addValue("P_COMMENTS_NO", comments_no);
		simpleJdbcCall.execute(in);
	}

	public List<DataVO> selectAllLikes(int goods_no) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("SELECTALLLIKES")
			.returningResultSet("dataVO", new RowMapper<DataVO>() {

				@Override
				public DataVO mapRow(ResultSet rs, int rowNum) throws SQLException {
					DataVO vo = new DataVO();
					vo.setGoods_no(String.valueOf(rs.getString("goods_no")));
					vo.setMember_no(String.valueOf(rs.getString("member_no")));
					vo.setUsername(rs.getString("username"));
					return vo;
				}
				
			});
		SqlParameterSource in = new MapSqlParameterSource()
			.addValue("P_GOODS_NO", goods_no);
		Map<String, Object> out = simpleJdbcCall.execute(in);
		List<DataVO> list = (List<DataVO>) out.get("SELECTALLLIKES_RES");
		return list;
	}

	public void doLike(int goods_no, int member_no) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("DOLIKE");
		SqlParameterSource in = new MapSqlParameterSource()
		.addValue("P_GOODS_NO", goods_no)
		.addValue("P_MEMBER_NO", member_no);
		simpleJdbcCall.execute(in);
	}

	public void doUnlike(int goods_no, int member_no) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("DOUNLIKE");
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("P_GOODS_NO", goods_no)
				.addValue("P_MEMBER_NO", member_no);
		simpleJdbcCall.execute(in);
	}

}
