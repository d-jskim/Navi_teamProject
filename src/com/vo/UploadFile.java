package com.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


@Service("uploadFile")
public class UploadFile {
	
	private String function;
	
	private int goods_no;
	
	private MultipartFile file;
	private String filename;
	private String goods_name; 
	private String goods_category;
	private int price;
	@DateTimeFormat(iso = ISO.DATE)
	private Date empty_date;
	private String empty_reason;
	private String empty_way;
	private String memo;
	private int member_no;
	
	private String member_image;
	
	private String username;
	
	public MultipartFile getFile() {
		return file;
	}
	
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	public String getFilename() {
		return filename;
	}
	
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public String getGoods_name() {
		return goods_name;
	}
	
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	
	public String getGoods_category() {
		return goods_category;
	}
	
	public void setGoods_category(String goods_category) {
		this.goods_category = goods_category;
	}
	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public Date getEmpty_date() {
		return empty_date;
	}
	
	public void setEmpty_date(Date empty_date) {
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
	
	public int getMember_no() {
		return member_no;
	}
	
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	
	public String getFunction() {
		return function;
	}

	public void setFunction(String function) {
		this.function = function;
	}

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
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
				"UploadFile [function=%s, goods_no=%s, file=%s, filename=%s, goods_name=%s, goods_category=%s, price=%s, empty_date=%s, empty_reason=%s, empty_way=%s, memo=%s, member_no=%s, member_image=%s, username=%s]",
				function, goods_no, file, filename, goods_name, goods_category, price, empty_date, empty_reason,
				empty_way, memo, member_no, member_image, username);
	}

}
