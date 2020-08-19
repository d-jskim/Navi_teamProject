package com.validator;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.vo.UploadFile;

//spring에서 제공해주는 유효성 검사 클래스를 implements
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
		 		errors.rejectValue("file", "uploadForm", "파일 내용이 없습니다.");
		 	}
		 }
	
		 if(file.getGoods_name().isEmpty()) {
			 errors.rejectValue("goods_name", "uploadForm", "물건 이름이 없습니다.");
		 }	
		
		 if(file.getGoods_category().isEmpty()) {
			 errors.rejectValue("goods_category", "uploadForm", "카테고리가 없습니다.");
		 }		 
	
		 if(file.getPrice() == 0) {
			 errors.rejectValue("price", "uploadForm", "가격이 없습니다.");
		 }
	
		 if(file.getEmpty_date() == null || file.getEmpty_date().equals("")) {
			 errors.rejectValue("empty_date", "uploadForm", "날짜가 없습니다.");
		 }	
		 
		 if(file.getEmpty_reason().isEmpty()) {
			 errors.rejectValue("empty_reason", "uploadForm", "이유를 선택해주세요.");
		 }
		 
		 if(file.getEmpty_way().isEmpty()) {
			 errors.rejectValue("empty_way", "uploadForm", "방법을 선택해주세요.");
		 }
		 
		 if(file.getMemo().isEmpty()) {
			 errors.rejectValue("memo", "uploadForm", "방법을 선택해주세요.");
		 }
		
	}
	
}
