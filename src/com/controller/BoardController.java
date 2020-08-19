package com.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.biz.BoardBIZ;
import com.validator.FileValidator;
import com.vo.CommentsVO;
import com.vo.DataVO;
import com.vo.GoodsVO;
import com.vo.MemberVO;
import com.vo.SharingVO;
import com.vo.UploadFile;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	private BoardBIZ boardBIZ;
	
	@Autowired
	private FileValidator fileValidator;
	
	private List<String> cList = new ArrayList<>(Arrays.asList(
			"디지털/가전", "가구/인테리어", "유아동/유아도서", "생활/가공식품", "여성의류", "여성잡화", "뷰티/미용", 
			"남성패션/잡화", "스포츠/레저", "도서/티켓/음반", "반려동물용품", "기타 중고물품"));
	
	@GetMapping(path = "/board.do")
	public ModelAndView goBoard() {
		ModelAndView mv = new ModelAndView("/board/board");
		mv.addObject("goodsList", boardBIZ.selectAllGoods());
		return mv;
	}
	
	@GetMapping(path = "/goDetails.do")
	public ModelAndView goDetails(@RequestParam(value = "goods_no") int goods_no) throws ParseException {
		ModelAndView mv = new ModelAndView("board/details");
		GoodsVO res = boardBIZ.selectOneGoods(goods_no);
		mv.addObject("g_vo", res);
		List<DataVO> commentsList = boardBIZ.selectAllComments(goods_no);
		mv.addObject("commentsList", commentsList);
		List<DataVO> likesList = boardBIZ.selectAllLikes(goods_no);
		mv.addObject("likesList", likesList);
		SharingVO sh_vo = boardBIZ.selectStatus(res.getGoods_no());
		if(sh_vo != null) {
			mv.addObject("sh_vo", sh_vo);
		}
		return mv;
	}
	
	@GetMapping(path = "/goodsForm.do")
	public ModelAndView getUploadForm(@ModelAttribute UploadFile uploadFile) {		
		ModelAndView mv = new ModelAndView("/board/empty_post");
		mv.addObject("cList", cList);
		return mv;
	}
	
	@GetMapping(path = "/updateForm.do")
	public ModelAndView getUpdateForm(@RequestParam(value = "goods_no") int goods_no, @ModelAttribute UploadFile uploadFile,
									  @SessionAttribute("login_user") MemberVO m_vo) {
		
		
		ModelAndView mv = new ModelAndView("/board/empty_update");
		GoodsVO g_vo = boardBIZ.selectGoods(goods_no);
		mv.addObject("g_vo", g_vo);
		mv.addObject("m_vo", m_vo);
		mv.addObject("cList", cList);
		
		SharingVO sh_vo = boardBIZ.selectStatus(goods_no);
		if(sh_vo != null) {
			mv.addObject("sh_vo", sh_vo);
		}		
		return mv;
	}
	
	@PostMapping(path = "/upload.do")
	public ModelAndView fileUpload(@ModelAttribute("uploadFile") UploadFile uploadFile, 
									BindingResult result,
									@SessionAttribute("login_user") MemberVO m_vo) throws ParseException {
		
		
		//1. 유효성 검사
		fileValidator.validate(uploadFile, result);
		if(result.hasErrors()) {
			ModelAndView mv = new ModelAndView("/board/empty_post");
			mv.addObject("cList", cList);
			return mv;	
		} 
	
		//2. 업로드 vo의 객체 중 MultipartFile로 getFile()을 리턴받는다.
		MultipartFile file = uploadFile.getFile();
		
		//3. 리턴받은 MultipartFile의 객체의 원본 파일이름을 리턴받는다.
		String filename = file.getOriginalFilename();	
		
		//4. uploadFile.jsp에서 사용할 객체를 생성한 후 vo에 입력한다.
		GoodsVO g_vo = new GoodsVO(uploadFile, filename);
		g_vo.setMember_no(m_vo.getMember_no());//임시로 넣어놓은 member_id [!] 세션값을 통해서 받은 member_id 값 추가해야 함.
			
		//5. 저장장소를 지정하고 File 객체를 통해 읽어서 저장한다.
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		try {
			inputStream = file.getInputStream();
			String path = "C:\\SpringWork\\Navi\\WebContent\\img\\goodsImg";
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
		
		//6. function: insert / update -> 조건문에 따라 BIZ의 메소드 호출 달라짐.		
		String function = uploadFile.getFunction();
		
		GoodsVO res = null;
		
		if(function.equals("insert")) {
			String msg = boardBIZ.insertGoods(g_vo);//G_NAME
			
			if(!msg.isEmpty()) {
				res = boardBIZ.selectRecentGoods(m_vo.getMember_no());
				if(res.getEmpty_way().equals("navi")) {
					boardBIZ.insertSharing(res);
				}
			}
		}else if(function.equals("update")){
			res = boardBIZ.updateGoods(g_vo);			
		}else {
			System.out.println("폼 에러");
		}
		ModelAndView mv = new ModelAndView("/board/details");
		mv.addObject("g_vo",  res);
		mv.addObject("m_vo", m_vo);
		mv.addObject("cList", cList);
		List<DataVO> commentsList = boardBIZ.selectAllComments(res.getGoods_no());
		mv.addObject("commentsList", commentsList);
		List<DataVO> likesList = boardBIZ.selectAllLikes(res.getGoods_no());
		mv.addObject("likesList", likesList);
		SharingVO sh_vo = boardBIZ.selectStatus(res.getGoods_no());
		if(sh_vo != null) {
			mv.addObject("sh_vo", sh_vo);
		}
		return mv;		
	}
	
	@PostMapping(path = "/updateStatus.do")
	@ResponseBody
	public void doUpdateStatus(@RequestParam(value="goods_no") int goods_no,
							   @RequestParam(value="status") String status) {

		System.out.println("goods_no: " + goods_no);
		System.out.println("status: " + status);
		SharingVO sh_vo = new SharingVO(goods_no, status);
		boardBIZ.updateStatus(sh_vo);
	}
	
	@PostMapping(path = "comment.do")
	public ModelAndView doComment(@ModelAttribute CommentsVO vo) throws ParseException {
		boardBIZ.doComment(vo);
		ModelAndView mv = new ModelAndView("board/details");
		GoodsVO res = boardBIZ.selectOneGoods(vo.getGoods_no());
		mv.addObject("g_vo", res);
		List<DataVO> commentsList = boardBIZ.selectAllComments(vo.getGoods_no());
		mv.addObject("commentsList", commentsList);
		List<DataVO> likesList = boardBIZ.selectAllLikes(vo.getGoods_no());
		mv.addObject("likesList", likesList);
		SharingVO sh_vo = boardBIZ.selectStatus(res.getGoods_no());
		if(sh_vo != null) {
			mv.addObject("sh_vo", sh_vo);
		}
		return mv;
	}
	
	@GetMapping(path = "deleteComment.do")
	public ModelAndView deleteComment(@RequestParam(value = "comments_no") int comments_no,
																@RequestParam(value="goods_no") int goods_no) throws ParseException {
		boardBIZ.deleteComment(comments_no);
		ModelAndView mv = new ModelAndView("board/details");
		GoodsVO res = boardBIZ.selectOneGoods(goods_no);
		mv.addObject("g_vo", res);
		List<DataVO> commentsList = boardBIZ.selectAllComments(goods_no);
		mv.addObject("commentsList", commentsList);
		List<DataVO> likesList = boardBIZ.selectAllLikes(goods_no);
		mv.addObject("likesList", likesList);
		SharingVO sh_vo = boardBIZ.selectStatus(res.getGoods_no());
		if(sh_vo != null) {
			mv.addObject("sh_vo", sh_vo);
		}
		return mv;
	}
	
	@GetMapping(path = "like.do")
	public ModelAndView doLike(@RequestParam(value="goods_no") int goods_no,
									@SessionAttribute(value = "login_user") MemberVO vo) throws ParseException {
		boardBIZ.doLike(goods_no, vo.getMember_no());
		ModelAndView mv = new ModelAndView("board/details");
		GoodsVO res = boardBIZ.selectOneGoods(goods_no);
		mv.addObject("g_vo", res);
		List<DataVO> commentsList = boardBIZ.selectAllComments(goods_no);
		mv.addObject("commentsList", commentsList);
		List<DataVO> likesList = boardBIZ.selectAllLikes(goods_no);
		mv.addObject("likesList", likesList);
		SharingVO sh_vo = boardBIZ.selectStatus(res.getGoods_no());
		if(sh_vo != null) {
			mv.addObject("sh_vo", sh_vo);
		}
		return mv;
	}
	
	@GetMapping(path = "unlike.do")
	public ModelAndView doUnlike(@RequestParam(value="goods_no") int goods_no,
									@SessionAttribute(value = "login_user") MemberVO vo) throws ParseException {
		boardBIZ.doUnlike(goods_no, vo.getMember_no());
		ModelAndView mv = new ModelAndView("board/details");
		GoodsVO res = boardBIZ.selectOneGoods(goods_no);
		mv.addObject("g_vo", res);
		List<DataVO> commentsList = boardBIZ.selectAllComments(goods_no);
		mv.addObject("commentsList", commentsList);
		List<DataVO> likesList = boardBIZ.selectAllLikes(goods_no);
		mv.addObject("likesList", likesList);
		SharingVO sh_vo = boardBIZ.selectStatus(res.getGoods_no());
		if(sh_vo != null) {
			mv.addObject("sh_vo", sh_vo);
		}
		return mv;
	}
	
	@RequestMapping(path = "/delete.do")
	public ModelAndView doDeleteGoods(@RequestParam int goods_no) {
		int delRes = boardBIZ.deleteGoods(goods_no);
		ModelAndView mv = new ModelAndView("redirect:/board/board.do");//유저프로필 없기 때문에 일단 board로.
		return mv;
	}
	
}
