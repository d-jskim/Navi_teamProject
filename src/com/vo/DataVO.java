package com.vo;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DataVO {
	
	private DateFormat sdf;
	private String goods_no;
	private String goods_name;
	private String goods_image;
	private String goods_category;
	private String goods_price;
	private String empty_date;
	private String empty_reason;
	private String empty_way;
	private String memo;
	private String post_date;
	private String member_no;
	private String email;
	private String password;
	private String username;
	private String name;
	private String birthdate;
	private String address;
	private String	gender;
	private String	member_image;
	private String join_date;
	private String grade;
	
	// 좋아요 수
	private String likes_count;
	private String comments_count;
	
	// 회원등급 (참고 : member_no, username, member_image)
	private String empty_point;
	private String share_point;
	private String num_likes;
	
	// 댓글 (+ goods_no, member_no, member_image)
	private String comments_no;
	private String contents;
	private String comments_date;
	private String updated_date;
	private String comments_level;
	
	public DataVO() {
		super();
	}

	public DataVO(GoodsVO vo) {
		super();
		sdf = new SimpleDateFormat("yyyy-MM-dd");
		this.goods_no = String.valueOf(vo.getGoods_no());
		this.goods_name = vo.getGoods_name();
		this.goods_image = vo.getGoods_image();
		this.goods_category = vo.getGoods_category();
		this.goods_price = String.valueOf(vo.getGoods_price());
		this.empty_date = sdf.format(vo.getEmpty_date());
		this.empty_reason = vo.getEmpty_reason();
		this.empty_way = vo.getEmpty_way();
		this.memo = vo.getMemo();
		this.post_date =sdf.format(vo.getPost_date());
		this.member_no = String.valueOf(vo.getMember_no());
	}

	public DataVO(MemberVO vo) {
		super();
		sdf = new SimpleDateFormat("yyyy-MM-dd");
		this.member_no = String.valueOf(vo.getMember_no());
		this.email = vo.getEmail();
		this.password = vo.getPassword();
		this.username = vo.getUsername();
		this.name = vo.getName();
		this.birthdate = sdf.format(vo.getBirthdate());
		this.address = vo.getAddress();
		this.gender = vo.getGender();
		this.member_image = vo.getMember_image();
		this.join_date = sdf.format(vo.getJoin_date());
	}

	public DateFormat getSdf() {
		return sdf;
	}

	public void setSdf(DateFormat sdf) {
		this.sdf = sdf;
	}

	public String getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(String goods_no) {
		this.goods_no = goods_no;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public String getGoods_image() {
		return goods_image;
	}

	public void setGoods_image(String goods_image) {
		this.goods_image = goods_image;
	}

	public String getGoods_category() {
		return goods_category;
	}

	public void setGoods_category(String goods_category) {
		this.goods_category = goods_category;
	}

	public String getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(String goods_price) {
		this.goods_price = goods_price;
	}

	public String getEmpty_date() {
		return empty_date;
	}

	public void setEmpty_date(String empty_date) {
		this.empty_date = empty_date;
	}

	public String getEmpty_reason() {
		return empty_reason;
	}

	public void setEmpty_reason(String empty_reason) {
		this.empty_reason = empty_reason;
	}

	public String getEmpty_way() {
		return empty_way;
	}

	public void setEmpty_way(String empty_way) {
		this.empty_way = empty_way;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getPost_date() {
		return post_date;
	}

	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}

	public String getMember_no() {
		return member_no;
	}

	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMember_image() {
		return member_image;
	}

	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}

	public String getJoin_date() {
		return join_date;
	}

	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}

	public String getLikes_count() {
		return likes_count;
	}

	public void setLikes_count(String likes_count) {
		this.likes_count = likes_count;
	}

	public String getComments_count() {
		return comments_count;
	}

	public void setComments_count(String comments_count) {
		this.comments_count = comments_count;
	}

	public String getEmpty_point() {
		return empty_point;
	}

	public void setEmpty_point(String empty_point) {
		this.empty_point = empty_point;
	}

	public String getShare_point() {
		return share_point;
	}

	public void setShare_point(String share_point) {
		this.share_point = share_point;
	}

	public String getNum_likes() {
		return num_likes;
	}

	public void setNum_likes(String num_likes) {
		this.num_likes = num_likes;
	}

	public String getComments_no() {
		return comments_no;
	}

	public void setComments_no(String comments_no) {
		this.comments_no = comments_no;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getComments_date() {
		return comments_date;
	}

	public void setComments_date(String comments_date) {
		this.comments_date = comments_date;
	}

	public String getUpdated_date() {
		return updated_date;
	}

	public void setUpdated_date(String updated_date) {
		this.updated_date = updated_date;
	}

	public String getComments_level() {
		return comments_level;
	}

	public void setComments_level(String comments_level) {
		this.comments_level = comments_level;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String toGoodsString() {
		return String.format(
				"Data [goods_no=%s, goods_name=%s, goods_image=%s, goods_category=%s, goods_price=%s, empty_date=%s, empty_reason=%s, empty_way=%s, memo=%s, post_date=%s, member_no=%s]",
				goods_no, goods_name, goods_image, goods_category, goods_price, empty_date, empty_reason, empty_way,
				memo, post_date, member_no);
	}

	public String toMemberString() {
		return String.format(
				"Data [member_no=%s, email=%s, password=%s, username=%s, name=%s, birthdate=%s, address=%s, gender=%s, member_image=%s, join_date=%s]",
				member_no, email, password, username, name, birthdate, address, gender, member_image, join_date);
	}

	public String toBoardString() {
		return String.format(
				"Data [goods_no=%s, goods_name=%s, goods_image=%s, goods_category=%s, goods_price=%s, empty_date=%s, empty_reason=%s, empty_way=%s, memo=%s, post_date=%s, member_no=%s, comments_count=%s, likes_count=%s]",
				goods_no, goods_name, goods_image, goods_category, goods_price, empty_date, empty_reason, empty_way,
				memo, post_date, member_no, comments_count, likes_count);
	}

	public String toGradeString() {
		return String.format(
				"Data [member_no=%s, username=%s, member_image=%s, empty_point=%s, share_point=%s, num_likes=%s]",
				member_no, username, member_image, empty_point, share_point, num_likes);
	}
	
	public String toCommentsString() {
		return String.format(
				"DataVO [goods_no=%s, member_no=%s, member_image=%s, comments_no=%s, contents=%s, comments_date=%s, updated_date=%s, comments_level=%s]",
				goods_no, member_no, member_image, comments_no, contents, comments_date, updated_date, comments_level);
	}

	public MemberVO toMemberVO() throws ParseException {
		sdf = new SimpleDateFormat("yyyy-MM-dd");
		MemberVO vo = new MemberVO();
		vo.setMember_no(Integer.parseInt(this.member_no));
		vo.setEmail(this.email);
		vo.setPassword(this.password);
		vo.setUsername(this.username);
		vo.setName(this.name);
		vo.setBirthdate(sdf.parse(this.birthdate));
		vo.setAddress(this.address);
		vo.setGender(this.gender);
		vo.setMember_image(this.member_image);
		vo.setJoin_date(sdf.parse(this.join_date));
		return vo;
	}

}
