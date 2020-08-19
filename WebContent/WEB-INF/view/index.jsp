<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Index</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<link rel='stylesheet' href='https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' type='text/css'>
<link rel='stylesheet' href='https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style>
    .navbar{
      margin-bottom: 1rem;
    }
    .carousel-item {
	  height: 65vh;
	  min-height: 350px;
	  background: no-repeat center center scroll;
	  -webkit-background-size: cover;
	  -moz-background-size: cover;
	  -o-background-size: cover;
	  background-size: cover;
	}
</style>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
</head>
<body class="w3-light-gray" style="font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif';">

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

<div class="w3-container" align="center"> <!-- content zone -->
	<div class="w3-container" style="max-width: 1200px;" >

		<header class="mb-4 my-2 border shadow-sm" style="border-color: #333333;"> <!-- 1st row -->
		
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
		    		<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		    		<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		    		<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		  		</ol>
		  		<div class="carousel-inner" role="listbox">
					<div class="carousel-item active" style="background-image: url('${ path }/img/background01.jpg')">	
		  				<div class="carousel-caption d-none d-md-block" style="color: #1C1C1C;">
		    				<h3 class="display-4" style="color: #6E6E6E;">나비란?</h3>
		    				<p class="lead"><b>나비</b>란 나누고 비우고의 줄임말로, <br>
					미니얼리즘 실천 서비스입니다.</p>
		  				</div>
					</div>
					<div class="carousel-item" style="background-image: url('${ path }/img/background02.jpg')">
		  				<div class="carousel-caption d-none d-md-block">
		    				<h3 class="display-4">왜 나비인가?</h3>
		    				<p class="lead"><b>나비</b>를 통해서  동네 이웃들과 가깝고 따뜻한 나눔을 지금 경험해보세요.</p>
		  				</div>
					</div>
					<div class="carousel-item" style="background-image: url('${ path }/img/background03.jpg')">
						<div class="carousel-caption d-none d-md-block">
							<h3 class="display-4">나비, 함께하세요</h3>
							<p class="lead"></p>
						</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
			
		</header> <!-- 1st row -->

		<div class="row mb-4" style="padding-left: 15px; padding-right: 15px;"> <!-- 2nd row -->

			<div class="col-md-8" style="padding-left: 0px; padding-right: 0px;">
				<img class="img-fluid border" style="border-color: #333333;" src="${ path }/img/background01.jpg" alt="">
			</div>
		
			<div class="col-md-4 w3-white">
				<h3 class="my-5">나비란?</h3>
				<p>
				    <b>나비</b>란 나누고 비우고의 줄임말로, <br>
					미니얼리즘 실천 서비스입니다.
				</p>
			</div>
		
		</div> <!-- 2nd row -->

		<div class="row mb-4"  style="padding-left: 15px; padding-right: 15px;"> <!-- 3rd row -->

			<div class="col-md-4 w3-white">
				<h3 class="my-5">왜 나비인가?</h3>
				<p>
					<b>나비</b>를 통해서  동네 이웃들과 가깝고 따뜻한 나눔을 지금 경험해보세요.
				</p>
			</div>

			<div class="col-md-8" style="padding-left: 0px; padding-right: 0px;">
				<img class="img-fluid border" style="border-color: #333333;" src="${ path }/img/background02.jpg" alt="">
			</div>

		</div> <!-- 3rd row -->

		<div class="row mb-4" style="padding-left: 15px; padding-right: 15px;"> <!-- 4th row -->
		
  			<div class="col-md-8" style="padding-left: 0px; padding-right: 0px;">
    			<img class="img-fluid border" style="border-color: #333333;" src="${ path }/img/background03.jpg" alt="">
  			</div>

 			<div class="col-md-4 w3-white">
    			<h3 class="my-5 ">나비, 함께하세요</h3>
    			<p></p>
  			</div>
  			
		</div> <!-- 4th row -->
		<c:if test="${ empty indexList }">
			<div class="row">
				게시글 없음
				<c:out value="${ indexList }"></c:out>
			</div>
		</c:if>
		<c:if test="${ !empty indexList }">
			<div class="row">
				<c:forEach var="vo" items="${ indexList }" varStatus="status">
					
					<div class="col-lg-4 col-sm-6 mb-4">
						<div class="card h-100 shadow-sm">
			 				<a>
			 					<img class="card-img-top" src="${ path }/img/goodsImg/<c:out value="${ vo.goods_image }"/>" alt="<c:out value="${ vo.goods_image }"/>">
			 				</a>
		    				<div class="card-body">
								<div class="card-group"><c:out value="${ vo.goods_category }"/></div>
		    					<div class = "card-desc">
									<div class="card-title font-weight-bolder"><c:out value="${ vo.goods_name }"/></div>
									<div class="card-counts w3-right">
										<span><i class="btn far fa-comment-dots" style="color: rgb(59, 91, 152);"></i></span><c:out value="${ vo.comments_count }"/>
										<span><i class="btn far fa-heart" style="color: red;" aria-hidden="true"></i></span><c:out value="${ vo.likes_count }"/>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</c:forEach>
			</div>
		</c:if>
		
	</div>
</div> <!-- content zone -->

<c:import url="/footer.jsp" charEncoding="EUC-KR"/>

</body>
</html>