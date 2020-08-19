<%@page import="com.vo.SharingVO"%>
<%@page import="com.vo.DataVO"%>
<%@page import="com.vo.GoodsVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>물건 상세 보기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel='stylesheet' href='https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' type='text/css'>
<link rel='stylesheet' href='https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script type="text/javascript">
$(document).ready(function(){		
	
	   var g_no = $('#g_no').val();
	   
	   $('#status').on('change', function(){
		   $.ajax({
			   url: "updateStatus.do", //form의 action
	           type: "POST",			
	           data: {
	        	   goods_no: g_no,
	        	   status : this.value
	           },	        	  
	           success: function(data){
	        	   alert("success");
	           },
	           error: function(){
	          	 alert("err");
	           }
		   });
	   });		  
});
function del(g_no) {
	var chk = confirm("삭제하시겠습니까?" + g_no);
	if (chk) {
		location.href='delete.do?goods_no='+g_no;
	}
}
</script>
</script>
<%
	SharingVO sh_vo = (SharingVO)request.getAttribute("sh_vo");
	GoodsVO g_vo = (GoodsVO) request.getAttribute("g_vo");
	String imgPath = application.getContextPath() + "/img/goodsImg";
	String path = application.getContextPath();
%>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
</head>
<body class="w3-light-gray" style="font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif'">

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

<div class="container card w3-white my-4">
	<div style="text-align:center" class="my-4">
	 	 <h2>비움 물건 기록하기</h2>
	 	 <p>비움 물건에 대한 스토리를 들려주세요.</p>
	</div>
		<div class="row">
		<c:if test="${g_vo.member_no eq sessionScope.login_user.member_no and g_vo.empty_way eq 'navi'}">		
			<div class="form-group" style="padding-left: 1.25rem;">		
				<div>
					<select class="form-control" name="status" id="status">
			        	<option value="나눔중" <c:if test="${sh_vo.status eq '나눔중'}">selected</c:if>>나눔중</option>
			        	<option value="예약중" <c:if test="${sh_vo.status eq '예약중'}">selected</c:if>>예약중</option>
			        	<option value="나눔완료" <c:if test="${sh_vo.status eq '나눔완료'}">selected</c:if>>나눔완료</option>
			   		</select>
			   		<input type="hidden" value="<%=g_vo.getGoods_no()%>" id="g_no">
		   		</div>
		   	</div>   		
		</c:if>
		<c:if test="${g_vo.member_no ne sessionScope.login_user.member_no}">		
			<div class="col-sm-2">${sh_vo.status}</div>
		</c:if>
		</div>
		
		<div class="row my-3">
			<!-- 사진 업로드 영역 -->
			<div class="col-md-6">
				<figure class="figure">
  					<img src="<%=imgPath%>/${ g_vo.goods_image }" class="figure-img img-fluid rounded" alt="">
				</figure>			
			</div><!-- class="col-md-6" -->
			<div class="col-md-6">
			  	<div>
			    	<h4>물건 이름</h4>
			      	<p>${ g_vo.goods_name }</p><br>	  			   			
			    </div>
			    <div>
			    	<h4>카테고리</h4>
			      	<p>${ g_vo.goods_category }</p><br>	  			   			
			    </div>
			    <div>
			    	<h4>물건 가격</h4>
			      	<p>${ g_vo.goods_price }</p><br>	  			   			
			    </div>
			    <div>
			    	<h4>비움 날짜</h4>
			      	<p><fmt:formatDate value="${ g_vo.empty_date }" pattern="yyyy-MM-dd"/></p><br>	  			   			
			    </div>
			    <div>
			    	<h4>비움 이유</h4>
			      	<p>${ g_vo.empty_reason }</p><br>	  			   			
			    </div>
			    <div>
			    	<h4>비움 방법</h4>
			      	<p>${ g_vo.empty_way }</p><br>	  			   			
			    </div>
			     <div>
			    	<h4>메모</h4>
			      	<p>${ g_vo.memo }</p><br>	  			   			
			    </div>
				<div class="form-group" align="right">
				    <c:if test="${g_vo.member_no eq sessionScope.login_user.member_no}">	
						<button class="btn btn-secondary" style="width: 20%;" onclick="location.href='${ path }/board/updateForm.do?goods_no=${ g_vo.goods_no }'">수정</button>
						<button class="btn btn-danger" style="width: 20%;"  onclick="del(${g_vo.goods_no})">삭제</button>
						<button class="btn btn-primary" style="width: 20%;" onclick="location.href='${ path }/board/board.do'">목록</button>
					</c:if> 	
					<c:if test="${ empty likesList }">
						<input type="button" style="width: 20%;" value="좋아요 0" class="btn btn-primary" onclick="location.href='${ path }/board/like.do?goods_no=${ g_vo.goods_no }'">
					</c:if>
					<c:if test="${ !empty likesList }">
						<c:set var="contains" value="false"/>
						<c:forEach var="vo" items="${ likesList }">
							<c:if test="${ vo.member_no == sessionScope.login_user.member_no }">
								<c:set var="contains" value="true"/>
							</c:if>
						</c:forEach>
						<c:choose>
							<c:when test="${ contains }">
								<input type="button" style="width: 20%;" value="좋아요 ${ likesList.size() }" class="btn btn-primary" onclick="location.href='${ path }/board/unlike.do?goods_no=${ g_vo.goods_no }'"
								title="<c:forEach items="${ likesList }" var="vo" varStatus="status">${ vo.username }<c:if test="${ status.count != likesList.size() }">,&nbsp;</c:if></c:forEach>">
							</c:when>
							<c:otherwise>
								<input type="button" style="width: 20%;" value="좋아요 ${ likesList.size() }" class="btn btn-primary" onclick="location.href='${ path }/board/like.do?goods_no=${ g_vo.goods_no }'"
								title="<c:forEach items="${ likesList }" var="vo" varStatus="status">${ vo.username }<c:if test="${ status.count != likesList.size() }">,&nbsp;</c:if></c:forEach>">
							</c:otherwise>
						</c:choose>
					</c:if>
				</div>
			</div><!-- class="col-md-6" -->
		</div><!-- class="row" -->	  
</div> <!-- class="container" -->


<div class="container w3-white card my-4">    
	<form action="${ path }/board/comment.do" method="post" accept-charset="UTF-8">
	   	<div class="form-group row my-4">
	   		<div class="col-sm-1">
	   			<label class="form-control-label" style="font-size: 1.5rem;">댓글
	    			<c:if test="${ !empty commentsList }">
		    			<c:out value="${ commentsList.size() }"></c:out>
	    			</c:if>
	   			</label>
	   		</div>
	   			<input type="hidden" name="goods_no" value="${ g_vo.goods_no }">
	   			<input type="hidden" name="member_no" value="${ sessionScope.login_user.member_no }">
	   			<input type="hidden" name="comments_level" value="1">
		   		<div class="col-sm-9">
		   			<input type="text" name="contents" class="form-control" placeholder="your comment...">
		   		</div>
		   		<div class="col-sm-2">
		   			<input type="submit" value="등록" class="form-control btn btn-primary">
		   		</div>
	   		</div>
   		</form>
    <c:if test="${ !empty commentsList }">
    	<c:forEach var="vo" items="${ commentsList }">
			<div class="row">
				<div class="media col-sm-12 my-3">
					<div class="col-sm-1">
				    <c:choose>
				    	<c:when test="${ empty vo.member_image }">
							<img src="${ path }/img/userImg/default.jpg" class="media-object text-center my-3" style="width:40px; border-radius:50%;">
				    	</c:when>
				    	<c:otherwise>
							<img src="${ path }/img/userImg/${ vo.member_image }" class="media-object text-center my-3" style="width:40px; border-radius:50%;">
				    	</c:otherwise>
				    </c:choose>
					</div>
					<div class="media-body col-sm-11">
			  			<c:choose>
			  				<c:when test="${ empty vo.updated_date }">
								<p class="mb-1 w3-right" style="color: #999999;">${ vo.comments_date }</p>
			  				</c:when>
			  				<c:otherwise>
								<p class="mb-1 w3-right" style="color: #999999;">${ vo.updated_date }</p>
			  				</c:otherwise>
			  			</c:choose>
					  	<p class="media-heading title text-left font-weight-bolder">${ vo.username } </p>
				  		<p class="text-left">
							<a href="#" class="mb-1 w3-right btn" style="color: #0066ff;">답글</a>
							<c:if test="${ vo.member_no == sessionScope.login_user.member_no }">
								<a href="#" class="mb-1 w3-right btn" style="color: #0066ff;">수정</a>
								<a href="${ path }/board/deleteComment.do?goods_no=${ vo.goods_no }&comments_no=${ vo.comments_no }" class="mb-1 w3-right btn" style="color: #0066ff;">삭제</a>
							</c:if>
				  			<c:out value="${ vo.contents }"></c:out><br>
						</p>
					</div>
				</div>
			</div>
    	</c:forEach>
    </c:if>
</div>

<c:import url="/footer.jsp" charEncoding="EUC-KR"/>

</body>
</html>