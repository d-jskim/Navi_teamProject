<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>headerGuest</title>

</head>
<body>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<nav class="navbar navbar-expand-lg navbar-light w3-white"> <!-- nav -->

	<a href="${ path }/index.jsp" class="navbar-brand">Navi</a>
	<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse8">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarCollapse8">
		<div class="navbar-nav">
			<a href="${ path }/index.jsp" class="nav-item nav-link active">Home</a>
			<a href="${ path }/board/board.do" class="nav-item nav-link">Board</a>
		</div>
		
		<form class="form-inline ml-auto" action="${ path }/member/login.do" method="post" accept-charset="UTF-8">
			<input type="text" class="form-control mr-sm-2" placeholder="email" name="email">
			<input type="password" class="form-control mr-sm-2" placeholder="password" name="password">
			<button type="submit" class="btn btn-outline-secondary mr-sm-2">log in</button>
		</form>
		<input type="button" class="btn btn-outline-secondary" value="sign up" onclick="location.href='${ path }/member/goSignup.do'">
	</div>
	
</nav>

</body>
</html>