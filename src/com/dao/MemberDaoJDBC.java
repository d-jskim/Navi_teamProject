package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import com.vo.DataVO;
import com.vo.MemberVO;

import oracle.jdbc.OracleTypes;

@Repository(value = "memberDaoJDBC")
public class MemberDaoJDBC {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SimpleJdbcCall simpleJdbcCall;
	
	public SimpleJdbcCall createSimpleJdbcCall() {
		return new SimpleJdbcCall(this.jdbcTemplate);
	}

	public List<DataVO> selectAllMember() {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall
			.withProcedureName("SELECTALLMEMBER")
			.returningResultSet("dataVO", new RowMapper<DataVO>() {

				@Override
				public DataVO mapRow(ResultSet rs, int rowNum) throws SQLException {
					DataVO vo = new DataVO();
					vo.setMember_no(String.valueOf(rs.getInt("member_no")));
					vo.setEmail(rs.getString("email"));
					vo.setPassword(rs.getString("password"));
					vo.setUsername(rs.getString("username"));
					vo.setName(rs.getString("name"));
					vo.setBirthdate(rs.getString("birthdate"));
					vo.setAddress(rs.getString("address"));
					vo.setGender(rs.getString("gender"));
					vo.setMember_image(rs.getString("member_image"));
					vo.setJoin_date(rs.getString("join_date"));
					return vo;
				}
				
			});
		Map<String, Object> out = simpleJdbcCall.execute();
		List<DataVO> list = (List<DataVO>) out.get("SELECTALLMEMBER_RES");
		return list;
	}
	
	public MemberVO doSignup(MemberVO vo) throws ParseException {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("DOSIGNUP")
		.addDeclaredParameter(new SqlOutParameter("DOSIGNUP_RES", OracleTypes.CURSOR));
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("P_EMAIL", vo.getEmail())
				.addValue("P_PASSWORD", vo.getPassword())
				.addValue("P_USERNAME", vo.getUsername())
				.addValue("P_NAME", vo.getName())
				.addValue("P_BIRTHDATE", sdf.format(vo.getBirthdate()))
				.addValue("P_ADDRESS", vo.getAddress())
				.addValue("P_GENDER", vo.getGender());
		Map<String, Object> out = simpleJdbcCall.execute(in);
		List<Map<String, Object>> list = (List<Map<String, Object>>) out.get("DOSIGNUP_RES");
		MemberVO res = new MemberVO();
		res.setMember_no(Integer.parseInt(list.get(0).get("member_no").toString()));
		res.setEmail(list.get(0).get("email").toString());
		res.setPassword(list.get(0).get("password").toString());
		res.setUsername(list.get(0).get("username").toString());
		res.setName(list.get(0).get("name").toString());
		res.setBirthdate(sdf.parse(list.get(0).get("birthdate").toString()));
		res.setAddress(list.get(0).get("address").toString());
		res.setGender(list.get(0).get("gender").toString());
		res.setJoin_date(sdf.parse(list.get(0).get("join_date").toString()));
		return res;
	}

	public void doDelete(int member_no) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("DODELETE");
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("P_MEMBER_NO", member_no);
		simpleJdbcCall.execute(in);
	}

}
