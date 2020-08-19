package com.validator;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.vo.UploadFile;

//spring���� �������ִ� ��ȿ�� �˻� Ŭ������ implements
@Service(value = "fileValidator")
public class FileValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object uploadFile, Errors errors) {
		UploadFile file = (UploadFile) uploadFile;
		System.out.println("1. getGoods_name() : " + file.getGoods_name());
		System.out.println("2. getGoods_category() : " + file.getGoods_category());
		System.out.println("3. getMember_no() : " + file.getMember_no());		
		
		 if(file != null){
		 	if(file.getFile().getSize() == 0){
		 		errors.rejectValue("file", "uploadForm", "���� ������ �����ϴ�.");
		 	}
		 }
	
		 if(file.getGoods_name().isEmpty()) {
			 errors.rejectValue("goods_name", "uploadForm", "���� �̸��� �����ϴ�.");
		 }	
		
		 if(file.getGoods_category().isEmpty()) {
			 errors.rejectValue("goods_category", "uploadForm", "ī�װ��� �����ϴ�.");
		 }		 
	
		 if(file.getPrice() == 0) {
			 errors.rejectValue("price", "uploadForm", "������ �����ϴ�.");
		 }
	
		 if(file.getEmpty_date() == null || file.getEmpty_date().equals("")) {
			 errors.rejectValue("empty_date", "uploadForm", "��¥�� �����ϴ�.");
		 }	
		 
		 if(file.getEmpty_reason().isEmpty()) {
			 errors.rejectValue("empty_reason", "uploadForm", "������ �������ּ���.");
		 }
		 
		 if(file.getEmpty_way().isEmpty()) {
			 errors.rejectValue("empty_way", "uploadForm", "����� �������ּ���.");
		 }
		 
		 if(file.getMemo().isEmpty()) {
			 errors.rejectValue("memo", "uploadForm", "����� �������ּ���.");
		 }
		
	}
	
}
