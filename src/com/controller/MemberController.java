package com.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.biz.ChartBIZ;
import com.biz.MemberBIZ;
import com.vo.DataVO;
import com.vo.MemberVO;
import com.vo.UploadFile;

@Controller
@RequestMapping(value = "/member")
@SessionAttributes(value = "login_user")
public class MemberController {

	@Autowired
	private MemberBIZ memberBIZ;

	@PostMapping(path = "login.do")
	public ModelAndView doLogin(@ModelAttribute MemberVO vo) {
		MemberVO res = memberBIZ.doLogin(vo);
		if (res != null) {
			System.out.println(res.getUsername() + "´ÔÀÌ ·Î±×ÀÎ ÇÏ¼Ì½À´Ï´Ù.");
		}
		ModelAndView mv = new ModelAndView("redirect:/index.jsp");
		if (res.getMember_no() == 1) {
			mv.setViewName("redirect:/member/admin.do");
		}
		mv.addObject("login_user", res);
		return mv;
	}
	
	@GetMapping(path = "/logout.do")
	public ModelAndView doLogout(@SessionAttribute("login_user") MemberVO vo, SessionStatus status) {
		System.out.println(vo.getUsername() + "´ÔÀÌ ·Î±×¾Æ¿ô ÇÏ¼Ì½À´Ï´Ù.");
		status.setComplete();
		ModelAndView mv = new ModelAndView("redirect:/index.jsp");
		return mv;
	}
	
	@GetMapping(path = "/admin.do")
	public ModelAndView goAdmin() {
		ModelAndView mv = new ModelAndView("member/admin");
		mv.addObject("memberList", memberBIZ.selectAllMember());
		return mv;
	}
	
	@GetMapping(path = "/goSignup.do")
	public ModelAndView goSignup(@ModelAttribute MemberVO vo) {
		return new ModelAndView("member/signup");
	}
	
	@PostMapping(path = "/signup.do")
	public ModelAndView doSignup(@ModelAttribute(value = "memberVO") MemberVO vo) throws ParseException {
		MemberVO res = memberBIZ.doSignup(vo);
		if (res != null) {
			System.out.println(res.getUsername() + "´ÔÀÌ È¸¿ø°¡ÀÔ ÇÏ¼Ì½À´Ï´Ù.");
		}
		ModelAndView mv = new ModelAndView("redirect:/index.jsp");
		mv.addObject("login_user", res);
		return mv;
	}
	
	@GetMapping(path = "/update.do")
	public ModelAndView doUpdate(@RequestParam(value = "member_no") int member_no) {
		ModelAndView mv = new ModelAndView("member/admin");
		mv.addObject("memberList", memberBIZ.selectAllMember());
		return mv;
	}
	
	@GetMapping(path = "/delete.do")
	public ModelAndView doDelete(@RequestParam(value = "member_no") int member_no) {
		System.out.println(member_no + "¹ø È¸¿øÀ» Å»Åð½ÃÄ×½À´Ï´Ù.");
		memberBIZ.doDelete(member_no);
		ModelAndView mv = new ModelAndView("member/admin");
		mv.addObject("memberList", memberBIZ.selectAllMember());
		return mv;
	}
	
	@GetMapping(path = "/userProfile.do") 
	public ModelAndView userProfile(@SessionAttribute("login_user") MemberVO vo) throws ParseException {
		//MemberVO m_vo = memberBIZ.selectMember(vo.getMember_no());
		ModelAndView mv = new ModelAndView("member/userProfile");
		DataVO res = memberBIZ.userProfile(vo.getMember_no());
		mv.addObject("res", res);
		
		return mv; 	 
	}
	
	@PostMapping(path = "/updateImage.do")
	public ModelAndView changeProfile(@ModelAttribute("uploadFile") UploadFile uploadFile, @SessionAttribute("login_user") MemberVO vo) throws ParseException{
		
		MultipartFile file = uploadFile.getFile();
		
		String filename = file.getOriginalFilename();
		System.out.println("ÆÄÀÏ¸í: " + filename);
		
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		try {
			inputStream = file.getInputStream();
			//String path = "C:\\Users\\Playdata\\Documents\\Navi2\\WebContent\\img\\goodsImg";
			//String path = "C:\\SpringWork\\Navi3\\WebContent\\img\\goodsImg";
			String path = "C:\\miniwork\\Navi\\WebContent\\img\\goodsImg";
			File newFile = new File(path + "/" + filename);
			if(!newFile.exists()) {
				newFile.createNewFile();
			}
			
			outputStream = new FileOutputStream(newFile);
			int read = 0;
			byte[] b = new byte[(int)file.getSize()];
			while((read = inputStream.read(b)) != -1) {
				outputStream.write(b, 0, read);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//System.out.println("updateProfile : member_image : " + filename);
		MemberVO m_vo = new MemberVO();
		m_vo.setMember_image(filename);
		m_vo.setMember_no(vo.getMember_no());
		
		int resRow = memberBIZ.updateImage(m_vo);
		
		
		//MemberVO m = new MemberVO();
		DataVO res = null;
		if(resRow == 1) {
			//m = memberBIZ.selectMember(m_vo.getMember_no());
			res = memberBIZ.userProfile(vo.getMember_no());
		}
		
		ModelAndView mv = new ModelAndView("member/userProfile");	
		mv.addObject("res", res);
		return mv;			
	}
	
}
