package com.dao;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import com.vo.DataVO;

@Repository(value = "profileDaoJDBC")
public class ProfileDaoJDBC {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private SimpleJdbcCall simpleJdbcCall;
	
	public SimpleJdbcCall createSimpleJdbcCall() {
		return new SimpleJdbcCall(this.jdbcTemplate);
	}

	public DataVO userProfile(int member_no) throws ParseException {
		simpleJdbcCall = createSimpleJdbcCall();
		
		simpleJdbcCall.withProcedureName("FIND_GRADE");
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("P_MEMBER_NO", member_no);
		
		System.out.println("ProfileDaoJDBC -> Member BIZ : ok");
		Map<String, Object> out = simpleJdbcCall.execute(in);
		//List<Data> list = (List<Data>) out.get("G_RES");
		List<Map<String, Object>> list = (List<Map<String,Object>>) out.get("G_RES");
		DataVO res = new DataVO();
		res.setMember_no(String.valueOf(((BigDecimal) list.get(0).get("member_no")).intValue()));
		res.setUsername((String) list.get(0).get("username"));
		res.setMember_image((String) list.get(0).get("member_image"));
		res.setGrade((String) list.get(0).get("grade"));
		res.setEmpty_point(String.valueOf(((BigDecimal) list.get(0).get("empty_point")).intValue()));
		res.setShare_point(String.valueOf(((BigDecimal) list.get(0).get("share_point")).intValue()));
		System.out.println(res);
		return res;
	}

}
