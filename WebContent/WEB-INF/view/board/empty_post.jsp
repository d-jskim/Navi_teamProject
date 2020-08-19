<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>비움 물건 기록하기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<link rel='stylesheet' href='https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' type='text/css'>
<link rel='stylesheet' href='https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script type="text/javascript">
function setThumbnail(event) { 
	for (var image of event.target.files) { 
		var reader = new FileReader(); 
		reader.onload = function(event) { 
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result); 
			img.setAttribute("style", "width: 100%"); 
			if (document.querySelector("div#preview").hasChildNodes()) {					
				document.querySelector("div#preview").lastElementChild.remove(); 
			}
			document.querySelector("div#preview").appendChild(img); 
		}; 
		console.log(image); 
		reader.readAsDataURL(image); 
	} 
} 
</script>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
</head>
<body class="w3-light-gray" style="font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif'">
	
	<% String imgPath = application.getContextPath() + "/img/goodsImg"; 
	   String path = application.getContextPath(); 
	   List<String> cList = (List<String>)request.getAttribute("cList");					
	 %>
	
<c:choose>
	<c:when test="${ !empty sessionScope.login_user }">
		<c:choose>
			<c:when test="${ sessionScope.login_user.member_no == 1 }">
				<c:import url="/headerAdmin.jsp" charEncoding="EUC-KR"/>
			</c:when>
			<c:otherwise>
				<c:import url="/headerUser.jsp" charEncoding="EUC-KR"/>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
		<c:import url="/headerGuest.jsp" charEncoding="EUC-KR"/>
	</c:otherwise>
</c:choose>
	
<div class="container">

	<div style="text-align:center">
	 	 <h2>비움 물건 기록하기</h2>
	 	 <p>비움 물건에 대한 스토리를 들려주세요.</p>
	</div>
	

	<form:form action="${ path }/board/upload.do" modelAttribute="uploadFile"
			   target="_blank" method="post" enctype="multipart/form-data" acceptCharset="UTF-8">
		<form:hidden path="function" name="function" value="insert"/>
		<div class="row">
			<!-- 사진 업로드 영역 -->
			<div class="col-md-6">
				<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
				</div>
				<div class="custome-file">
					<form:input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01"
								name="file" path="file" accept="image/*" multiple="true" onchange="setThumbnail(event);"/>
					<label class="custom-file-label" for="inputGroupFile01">Choose file</label>
				<p style="color:red; font-weight:bold"><form:errors path="file" /></p><br> 
				</div>
				<div id="preview" style="max-width: 550px">
					<input type="hidden" path="preview"/><!-- JS의 hasChildNode()조건문에서 null 오류 방지 -->
				</div>				
			</div><!-- class="col-md-6" -->
			
			<!-- 물건 세부사항 영역 -->
			<div class="col-md-6">
			  	<div class="form-group row">
			    	<label for="goods_name" class="col-sm-2 col-form-label">물건 이름</label>
			      	<form:input type="text" class="form-control" id="goods_name" name="goods_name" path="goods_name"/>
			      	<p style="color:red; font-weight:bold"><form:errors path="goods_name" /></p><br>	  			   			
			    </div>
			    <div class="form-group row">
	    			<label for="goods_category" class="col-sm-2 col-form-label">카테고리</label>
	      			<form:select class="form-control" path="goods_category" name="goods_category" id="goods_category">
						<form:options items="<%=cList%>"/>
					</form:select>
					<p style="color:red; font-weight:bold"><form:errors path="goods_category" /></p><br>
				</div>
				<div class="form-group row">
					<label for="price" class="col-sm-2 col-form-label"><b>물건 가격</b></label>
					<form:input type="number" class="form-control" path="price" name="price"/>
					<p style="color:red; font-weight:bold"><form:errors path="price" /></p><br>	
  				</div>
  				<div class="form-group row">
					<label for="empty_date" class="col-sm-2 col-form-label"><b>비움 날짜</b></label>
					<form:input type="date" class="form-control" path="empty_date" name="empty_date"/>
					<p style="color:red; font-weight:bold"><form:errors path="empty_date" /></p><br>	
 				</div>
 				<div class="form-group row">
					<label for="empty_reason" class="col-sm-2 col-form-label"><b>비움 이유</b></label>
					<form:input type="text" class="form-control" path="empty_reason" name="empty_reason"/>
					<p style="color:red; font-weight:bold"><form:errors path="empty_reason" /></p><br>	  			   			
 				</div>
 				<div>
 					<fieldset><b>비움 방법</b></fieldset>				
	 				<div class="custom-control custom-radio">	 					
	  					<form:radiobutton path="empty_way" id="empty_way01" name="empty_way" class="custom-control-input" value="navi" />
	  					<label class="custom-control-label" for="empty_way01">Navi에서 나눔</label>
					</div>
					<div class="custom-control custom-radio">	 					
	  					<form:radiobutton path="empty_way" id="empty_way02" name="empty_way" class="custom-control-input" value="나눔" />
	  					<label class="custom-control-label" for="empty_way02">필요한 사람(가족/친구/이웃)에게 나눔</label>
					</div>
					<div class="custom-control custom-radio">	 					
	  					<form:radiobutton path="empty_way" id="empty_way03" name="empty_way" class="custom-control-input" value="기부" />
	  					<label class="custom-control-label" for="empty_way03">기부</label>
					</div>
					<div class="custom-control custom-radio">	 					
	  					<form:radiobutton path="empty_way" id="empty_way04" name="empty_way" class="custom-control-input" value="처분" />
	  					<label class="custom-control-label" for="empty_way04">처분</label>
					</div>
					<p style="color:red; font-weight:bold"><form:errors path="empty_way" /></p><br>	  			   			
				</div>
 				<div class="form-group row">
					<label for="memo" class="col-sm-2 col-form-label"><b>메모</b></label>
					<form:textarea class="form-control" path="memo" name="memo" id="memo"/>
					<p style="color:red; font-weight:bold"><form:errors path="memo" /></p><br>	  			   			
 				</div>
 				<!-- 버튼 -->
				<div class="form-group row">
					<button type="reset"  class="btn btn-secondary">취소</button>
					<button type="submit" class="btn btn-primary">기록하기</button>
				</div>	 						    
			</div><!-- class="col-md-6" -->
		</div><!-- class="row" -->	   
	</form:form>
</div> <!-- class="container" -->

<c:import url="/footer.jsp" charEncoding="EUC-KR"/>

</body>
</html>