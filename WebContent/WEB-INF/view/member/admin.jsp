<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Admin</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<link rel='stylesheet' href='https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' type='text/css'>
<link rel='stylesheet' href='https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script>
google.load('visualization', '1', {'packages':['corechart']});
google.load('visualization', '1', {'packages':['line']});

function init(){
	        $.ajax({
	            url: "/Navi/chart/getGenderAdmin.do",
	            type: "POST",
	            data: null,
	            success: function(data){
	                var sJson = JSON.stringify(data);
	                drawChart(sJson);
	            },
	            error: function(){
	                alert("err");
	            }
	        });
	        $.ajax({
	            url: "/Navi/chart/getCategoryAdmin.do",
	            type: "POST",
	            data: null,
	            success: function(data){
	                var sJson = JSON.stringify(data);
	                drawBasic(sJson);	              
	            },
	            error: function(){
	                alert("err");
	            }
	        });
	        $.ajax({
	            url: "/Navi/chart/getPostAdmin.do",
	            type: "POST",
	            data: null,
	            success: function(data){
	                var sJson = JSON.stringify(data);
	              	drawLineChart(sJson);
	            },
	            error: function(){
	                alert("err");
	            }
	        });
}
function drawBasic(dataDB){ //histogram
	var dataObj = JSON.parse(dataDB);
	
	var data = new google.visualization.DataTable();
	data.addColumn('string', '카테고리');
	data.addColumn('number', '개수');
	for (var i = 0; i < dataObj.length; i++) {
	     data.addRow([dataObj[i].category, dataObj[i].count]);
	}
	var options = {
			title: '카테고리 별 비움 물건 개수',
			hAxis: {
				title: '카테고리',				
			},
			vAxis:{
				title: '물건 수'
			}
	
	};
	
	var chart = new google.visualization.ColumnChart(document.getElementById('chart_div02'));
	chart.draw(data, options);
}
function drawChart(dataDB){	//Pie chart
	
	var dataObj = JSON.parse(dataDB);
		
	var data = new google.visualization.DataTable();
	data.addColumn('string', '성별');
	data.addColumn('number', '회원수');
	for (var i = 0; i < dataObj.length; i++) {
	     data.addRow([dataObj[i].gender, dataObj[i].count]);
	}
	
	var options ={title: '성별 분포도',
			      hAxis: { title: '성별'},
				  vAxis: { title: '물건 수'},
				  width: 400,
				  height: 300};
	var chart = new google.visualization.PieChart(document.getElementById('chart_div01'));
	chart.draw(data, options);
}
function drawLineChart(dataDB){	//line graph
	var dataObj = JSON.parse(dataDB);
	var data = new google.visualization.DataTable();
	
	data.addColumn('string', '날짜');
	data.addColumn('number', '비움 물건 개수');
	for (var i = 0; i < dataObj.length; i++) {
	     data.addRow([dataObj[i].empty_date, dataObj[i].count]);
	}
	
	var options={
		title: '날짜 별 비움 물건 개수',
		legend: {position: 'bottom'}
	};
	
	var chart = new google.visualization.LineChart(document.getElementById('chart_div03'));
	chart.draw(data, options);
	
}
</script>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
</head>
<body class="w3-light-gray" style="font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif';" onload="init();">

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
	<div class="w3-content row my-4 w3-center" style="max-width: 1600px">
		<table class="w3-white table table-hover w3-bordered w3-border" style="overflow: auto;">
			<thead class="thead-dark" style="font-size: 1.3em;">
				<tr>
					<th>No</th>
					<th>Email</th>
					<th>Password</th>
					<th>Username</th>
					<th>Name</th>
					<th>Birthdate</th>
					<th>Address</th>
					<th>Gender</th>
					<th>Member_image</th>
					<th>Join_date</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
			</thead>
			<c:if test="${ !empty memberList }">
				<c:forEach var="vo" items="${ memberList }" varStatus="status">
					<tr>	
						<td class="w3-right-align"><c:out value="${ vo.member_no }"/></td>
						<td><c:out value="${ vo.email }"/></td>
						<td class="w3-right-align"><c:out value="${ vo.password }"/></td>
						<td><c:out value="${ vo.username }"/></td>
						<td><c:out value="${ vo.name }"/></td>
						<td><c:out value="${ vo.birthdate }"/></td>
						<td><c:out value="${ vo.address }"/></td>
						<td><c:out value="${ vo.gender }"/></td>
						<td><c:out value="${ vo.member_image }"/></td>
						<td><c:out value="${ vo.join_date }"/></td>
						<td>
							<input type="button" class="btn thead-light border-dark" value="update" onclick="location.href='${ path }/member/update.do?member_no=${ vo.member_no }'"/>
						</td>
						<td>
							<input type="button" class="btn thead-light border-dark" value="delete" onclick="location.href='${ path }/member/delete.do?member_no=${ vo.member_no }'"/>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
</div>

<div class="container w3-white card my-4">
	<h3 class="my-3 mb-3">Dashboard Analytics</h3>
	<div class="container mb-4">		
	
		<h5><b>회원 성별 분포도<b></h5>
		<div>			
			  <div class="h-100" id="chart_div01"></div>
		</div>
	
	 	<h5><b>카테고리 별 비움 물건 수<b></h5>
		<div>			
			 <div class="h-100" id="chart_div02"></div>
		</div>
		
		<h5><b>날짜 별 비움 물건 수<b></h5>
		<div>			
			  <div class="h-100" id="chart_div03" style="min-height: 300px;"></div>
		</div>		
		
	</div>
</div>

<c:import url="/footer.jsp" charEncoding="EUC-KR"/>

</body>
</html>