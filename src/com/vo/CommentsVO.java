package com.vo;

import java.util.Date;

public class CommentsVO {

	private int comments_no;
	private int goods_no;
	private int member_no;
	private String contents;
	private Date comments_date;
	private Date updated_date;
	private int comments_level;
	private String member_image;
	private String username;
	
	public CommentsVO() {
		super();
	}

	public int getComments_no() {
		return comments_no;
	}

	public void setComments_no(int comments_no) {
		this.comments_no = comments_no;
	}

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getComments_date() {
		return comments_date;
	}

	public void setComments_date(Date comments_date) {
		this.comments_date = comments_date;
	}

	public Date getUpdated_date() {
		return updated_date;
	}

	public void setUpdated_date(Date updated_date) {
		this.updated_date = updated_date;
	}

	public int getComments_level() {
		return comments_level;
	}

	public void setComments_level(int comments_level) {
		this.comments_level = comments_level;
	}

	public String getMember_image() {
		return member_image;
	}

	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return String.format(
				"CommentsVO [comments_no=%s, goods_no=%s, member_no=%s, contents=%s, comments_date=%s, updated_date=%s, comments_level=%s, member_image=%s, username=%s]",
				comments_no, goods_no, member_no, contents, comments_date, updated_date, comments_level, member_image,
				username);
	}
	
}
