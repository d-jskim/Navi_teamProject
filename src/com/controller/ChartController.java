package com.controller;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.biz.ChartBIZ;
import com.vo.MemberVO;

@RestController
@RequestMapping(value = "/chart")
public class ChartController {
	
	@Autowired
	private ChartBIZ chartBIZ;
	
	@PostMapping(path = "/getCategoryData.do")
	public JSONArray getCategoryJSON(@SessionAttribute("login_user") MemberVO vo) {
		
		JSONArray jArray = chartBIZ.countCategory(vo.getMember_no());
		System.out.println("카테고리 별 수 확인");
		System.out.println(jArray);
		
		return jArray;
	}
	
	@PostMapping(path = "/getPostData.do")
	public JSONArray getEmptyPostJSON(@SessionAttribute("login_user") MemberVO vo) {
		
		JSONArray jArray = chartBIZ.countEmptyPost(vo.getMember_no());
		System.out.println(jArray);
		
		return jArray;
	}
	
	/*Admin용 분석데이터*/
	@PostMapping(path = "/getCategoryAdmin.do")
	public JSONArray getCategoryAdmin() {
		
		JSONArray jArray = chartBIZ.countCategoryAdmin();
		System.out.println("카테고리 별 수 확인");
		System.out.println(jArray);
		
		return jArray;
	}
	
	@PostMapping(path = "/getPostAdmin.do")
	public JSONArray getPostAdmin() {
		
		JSONArray jArray = chartBIZ.countPostAdmin();
		System.out.println(jArray);
		
		return jArray;
	}
	
	@PostMapping(path = "/getGenderAdmin.do")
	public JSONArray getGenderAdmin() {
		
		JSONArray jArray = chartBIZ.countGenderAdmin();
		System.out.println(jArray);
		
		return jArray;
	}

}
