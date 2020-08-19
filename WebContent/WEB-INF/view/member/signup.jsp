<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Signup</title>
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
	
	function goPopup() {
		var pop = window.open("/Navi/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	
	function jusoCallBack(roadFullAddr, jibunAddr, siNm, sggNm, emdNm) {
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.address.value = siNm + " " + sggNm + " " + emdNm;
	}
	
</script>
<style type="text/css">
	.card-signin {
	  border-radius: 1rem;
	  overflow: hidden;
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

<div class="container">
	<div class="row">
		<div class="col-lg-10 col-xl-9 mx-auto">
			<div class="card card-signin flex-row my-4">
				<div class="card-body">
					<h5 class="card-title text-center font-weight-bolder" style="font-size: 1.75rem;">Sign Up</h5>
					<hr class="my-4">
					<form:form action="${ path }/member/signup.do" name="form" id="form" method="post" accept-charset="UTF-8" modelAttribute="memberVO">
						<div class="form-group row">
							<label for="email" class="text-center col-sm-2 col-form-label w3-centered">Email</label>
							<div class="col-sm-10">
								<form:input path="email" type="text" class="form-control" placeholder="email" id="email" name="email" required="required"/>
							</div>
						</div>
						<div class="form-group row">
							<label for="password" class="text-center col-sm-2 col-form-label w3-centered">Password</label>
							<div class="col-sm-10">
								<form:input path="password" type="password" class="form-control" id="password" name="password" required="required"/>
							</div>
						</div>
						<div class="form-group row">
							<label for="username" class="text-center col-sm-2 col-form-label w3-centered">Username</label>
							<div class="col-sm-10">
								<form:input path="username" type="text" class="form-control" placeholder="username" id="username" name="username" required="required"/>
							</div>
						</div>
						<div class="form-group row">
							<label for="name" class="text-center col-sm-2 col-form-label w3-centered">Name</label>
							<div class="col-sm-10">
								<form:input path="name" type="text" class="form-control" placeholder="name" id="name" name="name" required="required"/>
							</div>
						</div>
						<div class="form-group row">
							<label for="birthdate" class="text-center col-sm-2 col-form-label w3-centered">Date</label>
							<div class="col-sm-10">
								<form:input path="birthdate" type="date" class="form-control" placeholder="birthdate" id="birthdate" name="birthdate" required="required"/>
							</div>
						</div>
						<div class="form-group row">
							<label for="address" class="text-center col-sm-2 col-form-label w3-centered">Address</label>
							<div class="col-sm-10">
								<button type="button" class="btn btn-primary mb-3 w3-right" onClick="goPopup();" id="addrBtn">주소입력하기</button>
								<input type="text" class="form-control col-sm-10" placeholder="address" name="roadFullAddr" id="roadFullAddr" disabled="disabled" required="required">
								<form:input path="address" type="hidden" id="address" name="address"/>
							</div>
						</div>
						<div class="form-group row">
							<label class="text-center col-sm-2 col-form-label w3-centered">Gender</label>
							<div class="col-sm-10">
								<form:radiobutton path="gender" class="custom-radio col-sm-1" id="male" name="male" value="male"/>
								<label class="text-left" for="male">남</label>
								<form:radiobutton path="gender" class="custom-radio col-sm-1" id="female" name="female" value="female"/>
								<label class="text-left" id="female">여</label>
							</div>
						</div>
						<hr class="my-4">
						<div align="center">
							<button type="reset" class="btn btn-secondary">reset</button>
							<button type="submit" class="btn btn-primary">Sign Up</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="/footer.jsp" charEncoding="EUC-KR"/>

</body>
</html>