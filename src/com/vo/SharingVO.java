package com.vo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class SharingVO {
	
	private int goods_no;
	private int member_no;
	private String status;
	@DateTimeFormat(iso = ISO.DATE)
	private Date share_date;
	
	public SharingVO(int goods_no, int member_no, String status, Date share_date) {
		super();
		this.goods_no = goods_no;
		this.member_no = member_no;
		this.status = status;
		this.share_date = share_date;
	}
	
	public SharingVO(int goods_no, String status) {
		this.goods_no = goods_no;
		this.status = status;
	}

	public SharingVO(int goods_no) {
		this.goods_no = goods_no;
	}

	public SharingVO() {
		
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getShare_date() {
		return share_date;
	}

	public void setShare_date(Date share_date) {
		this.share_date = share_date;
	}

	@Override
	public String toString() {
		return String.format("SharingVO [goods_no=%s, member_no=%s, status=%s, share_date=%s]", goods_no, member_no,
				status, share_date);
	}
	
	
	

}