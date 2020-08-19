<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>headerAdmin</title>

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
			<a href="${ path }/board/goodsForm.do" class="nav-item nav-link">Post</a>
			<a href="${ path }/member/userProfile.do" class="nav-item nav-link">My Page</a>
			<a href="${ path }/member/admin.do" class="nav-item nav-link">Admin</a>
		</div>
		
		<a href="${ path }/member/userProfile.do" class="navbar-brand ml-auto">Hello, ${ sessionScope.login_user.username } </a>
		<input type="button" class="btn btn-outline-secondary" value="log out" onclick="location.href='${ path }/member/logout.do'">
	</div>
	
</nav>

</body>
</html>