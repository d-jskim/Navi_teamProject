package com.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class GoodsVO {
	
	private int goods_no;
	private String goods_name;
	private String goods_image;
	private String goods_category;
	private int goods_price;
	@DateTimeFormat(iso = ISO.DATE)
	private Date empty_date;
	private String empty_reason;
	private String empty_way;
	private String memo;
	@DateTimeFormat(iso = ISO.DATE)
	private Date post_date;
	private int member_no;
	

	public GoodsVO() {
		super();
	}
	
	public GoodsVO(UploadFile uploadFile, String filename) {		
		super();
		this.goods_no = uploadFile.getGoods_no();
		this.goods_name = uploadFile.getGoods_name();
		this.goods_image = filename;
		this.goods_category = uploadFile.getGoods_category();
		this.empty_date = uploadFile.getEmpty_date();
		this.empty_reason = uploadFile.getEmpty_reason();
		this.empty_way = uploadFile.getEmpty_way();
		this.memo = uploadFile.getMemo();
		this.goods_price = uploadFile.getPrice();
		this.member_no = uploadFile.getMember_no();
	}

	public GoodsVO(int goods_no, String goods_name, String goods_image, String goods_category, Date empty_date,
			String empty_reason, String empty_way, String memo, int goods_price, Date post_date, int member_no) {
		super();
		this.goods_no = goods_no;
		this.goods_name = goods_name;
		this.goods_image = goods_image;
		this.goods_category = goods_category;
		this.empty_date = empty_date;
		this.empty_reason = empty_reason;
		this.empty_way = empty_way;
		this.memo = memo;
		this.goods_price = goods_price;
		this.post_date = post_date;
		this.member_no = member_no;
	}

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
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

	public int getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public Date getEmpty_date() {
		return empty_date;
	}

	public void setEmpty_date(Date empty_date) {
		this.empty_date = empty_date;
	}

	public Date getPost_date() {
		return post_date;
	}

	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}

	@Override
	public String toString() {
		return String.format(
				"GoodsVO [goods_no=%s, goods_name=%s, goods_image=%s, goods_category=%s, goods_price=%s, empty_date=%s, empty_reason=%s, empty_way=%s, memo=%s, post_date=%s, member_no=%s]",
				goods_no, goods_name, goods_image, goods_category, goods_price, empty_date, empty_reason, empty_way,
				memo, post_date, member_no);
	}

}
