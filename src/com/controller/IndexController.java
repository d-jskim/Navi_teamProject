package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.biz.BoardBIZ;

@Controller
public class IndexController {
	
	@Autowired
	private BoardBIZ boardBIZ;
	
	@GetMapping(path = "/index.do")
	public ModelAndView goIndex() {
		ModelAndView mv = new ModelAndView("/index");
		mv.addObject("indexList", boardBIZ.selectAllIndex());
		return mv;
	}

}
