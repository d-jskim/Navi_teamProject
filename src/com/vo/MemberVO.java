package com.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class MemberVO {
	
	private int member_no;
	private String email;
	private String password;
	private String username;
	private String name;
	@DateTimeFormat(iso = ISO.DATE)
	private Date birthdate;
	private String address;
	private String	gender;
	private String	member_image;
	@DateTimeFormat(iso = ISO.DATE)
	private Date join_date;																																														
	
	public MemberVO() {
		super();
	}

	public MemberVO(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public MemberVO(String email, String password, String username, String name, Date birthdate, String address,
			String gender) {
		super();
		this.email = email;
		this.password = password;
		this.username = username;
		this.name = name;
		this.birthdate = birthdate;
		this.address = address;
		this.gender = gender;
	}

	public MemberVO(int member_no, String email, String password, String username, String name, Date birthdate,
			String address, String gender, String member_image, Date join_date) {
		super();
		this.member_no = member_no;
		this.email = email;
		this.password = password;
		this.username = username;
		this.name = name;
		this.birthdate = birthdate;
		this.address = address;
		this.gender = gender;
		this.member_image = member_image;
		this.join_date = join_date;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
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

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	@Override
	public String toString() {
		return String.format(
				"MemberVO [member_no=%s, email=%s, password=%s, username=%s, name=%s, birthdate=%s, address=%s, gender=%s, member_image=%s, join_date=%s]",
				member_no, email, password, username, name, birthdate, address, gender, member_image, join_date);
	}
	
}
