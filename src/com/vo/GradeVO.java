package com.vo;

public class GradeVO {
	
	private int member_no;
	private String username;
	private String member_image;
	private int empty_point;
	private int share_point;
	
	public GradeVO() {
		super();
	}
	
	public GradeVO(int member_no, String username, String member_image, int empty_point, int share_point) {
		super();
		this.member_no = member_no;
		this.username = username;
		this.member_image = member_image;
		this.empty_point = empty_point;
		this.share_point = share_point;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getMember_image() {
		return member_image;
	}
	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}
	public int getEmpty_point() {
		return empty_point;
	}
	public void setEmpty_point(int empty_point) {
		this.empty_point = empty_point;
	}
	public int getShare_point() {
		return share_point;
	}
	public void setShare_point(int share_point) {
		this.share_point = share_point;
	}

	@Override
	public String toString() {
		return String.format("GradeVO [member_no=%s, username=%s, member_image=%s, empty_point=%s, share_point=%s]",
				member_no, username, member_image, empty_point, share_point);
	}

}
