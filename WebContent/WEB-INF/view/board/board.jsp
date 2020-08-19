<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Board</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<link rel='stylesheet' href='https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' type='text/css'>
<link rel='stylesheet' href='https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<c:set var="path" value="${ pageContext.request.contextPath }"/>
</head>
<body class="w3-light-gray"	style="font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif'; -webkit-font-smoothing: antialiased;">

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

<div class="w3-container" align="center">
	<div class="w3-container" style="max-width: 1200px; margin-top: 1.5rem;" >
		
		<c:if test="${ !empty goodsList }">
			<div class="row">
				<c:forEach var="vo" items="${ goodsList }" varStatus="status">
					
					<div class="col-lg-4 col-sm-6 mb-4">
						<div class="card h-100 shadow-sm">
			 				<a href="${ path }/board/goDetails.do?goods_no=${ vo.goods_no }">
			 					<img class="card-img-top" src="${ path }/img/goodsImg/${ vo.goods_image }" alt="${ vo.goods_image }">
			 				</a>
		    				<div class="card-body">
								<div class="card-group"><c:out value="${ vo.goods_category }"/></div>
		    					<div class = "card-desc">
									<div class="card-title font-weight-bolder"><c:out value="${ vo.goods_name }"/></div>
<%-- 									<div class="card-counts w3-right">
										<span><i class="btn far fa-comment-dots" style="color: rgb(59, 91, 152);"></i></span><c:out value="${ vo.comments_count }"/>
										<span><i class="btn far fa-heart" style="color: red;" aria-hidden="true"></i></span><c:out value="${ vo.likes_count }"/>
									</div> --%>
								</div>
							</div>
						</div>
					</div>
					
				</c:forEach>
			</div>
		</c:if>

	</div>
</div>

<c:import url="/footer.jsp" charEncoding="EUC-KR"/>

</body>
</html>
