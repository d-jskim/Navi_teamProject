package com.biz;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.vo.ChartVO;
import com.dao.BoardDAO;
import com.dao.BoardDaoJDBC;
import com.dao.ChartDAO;
import com.vo.GoodsVO;

@Service(value = "chartBIZ")
public class ChartBIZ {

	@Autowired
	private ChartDAO chartDAO;

	public JSONArray countCategory(int member_no) {
		List<ChartVO> list = chartDAO.countCategory(member_no);
		
		JSONArray jArray = new JSONArray();
		for(int i = 0; i < list.size(); i++) {
			JSONObject obj = new JSONObject();//배열 내에 들어갈 json
			obj.put("category", list.get(i).getGoods_category());
			obj.put("count", list.get(i).getCount());
			jArray.add(obj);
		}
		
		System.out.println("BIZ에서 json확인: " + jArray);
		
		return jArray;
	}

	public JSONArray countEmptyPost(int member_no) {
		List<ChartVO> list = chartDAO.countEmptyPost(member_no);
		JSONArray jArray = new JSONArray();
		for(int i = 0; i < list.size(); i++) {
			JSONObject obj = new JSONObject();//배열 내에 들어갈 json
			obj.put("empty_date", list.get(i).getEmpty_date());
			obj.put("count", list.get(i).getCount());
			jArray.add(obj);
		}
		
		return jArray;
		
	}

	public JSONArray countCategoryAdmin() {
		List<ChartVO> list = chartDAO.countCategoryAdmin();
		
		JSONArray jArray = new JSONArray();
		for(int i = 0; i < list.size(); i++) {
			JSONObject obj = new JSONObject();//배열 내에 들어갈 json
			obj.put("category", list.get(i).getGoods_category());
			obj.put("count", list.get(i).getCount());
			jArray.add(obj);
		}
		
		System.out.println("BIZ에서 json확인: " + jArray);
		
		return jArray;
	}

	public JSONArray countPostAdmin() {
		List<ChartVO> list = chartDAO.countPostAdmin();
		JSONArray jArray = new JSONArray();
		for(int i = 0; i < list.size(); i++) {
			JSONObject obj = new JSONObject();//배열 내에 들어갈 json
			obj.put("empty_date", list.get(i).getEmpty_date());
			obj.put("count", list.get(i).getCount());
			jArray.add(obj);
		}
		
		return jArray;
	}

	public JSONArray countGenderAdmin() {
		List<ChartVO> list = chartDAO.countGenderAdmin();
		JSONArray jArray = new JSONArray();
		for(int i = 0; i < list.size(); i++) {
			JSONObject obj = new JSONObject();//배열 내에 들어갈 json
			obj.put("gender", list.get(i).getGender());
			obj.put("count", list.get(i).getCount());
			jArray.add(obj);
		}
		
		return jArray;
	}
}
