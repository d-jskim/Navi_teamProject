<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.vo.GradeVO"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>USER PROFILE</title>
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
<script type="text/javascript">

/*
$(document).ready(function(){
	
	$('#OpenImgUpload').click(function(){$('#imgupload').trigger('click');})
	
	// 변경하기 버튼 누르면, 새로운 UserName을 입력하는 텍스트 박스 + 확인을 눌렀을 때 Ajax로 값을 받아서 Controller로 보낸다.
	// 성공 시 DB에서 값을 받아온다.
});
*/
function setThumbnail(event) { 
	for (var image of event.target.files) { 
		var reader = new FileReader(); 
		reader.onload = function(event) { 
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result); 
			img.setAttribute("style", "width: 256px; height: 256px"); 			
			img.setAttribute("class", "rounded-circle");
			
			
			if (document.querySelector("div#preview").hasChildNodes()) {
				document.querySelector("div#preview").lastElementChild.remove(); 
			}
			//document.querySelector('#original').remove();
			document.querySelector("div#preview").appendChild(img); 
		}; 
		console.log(event.target.result);
		console.log(image); 
		reader.readAsDataURL(image); 
	} 
} 

/* document.getElementById('updateU_photo').addEventListener('click', function() {
    alert('안녕 친구들');
}); */

function ImagePath(Image) {
	document.form.Image.value = ImagePath;
}

google.load('visualization', '1', {'packages':['corechart']});
google.load('visualization', '1', {'packages':['line']});

function init(){
	$.ajax({
        url: "/Navi/chart/getCategoryData.do",
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
        url: "/Navi/chart/getPostData.do",
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
	
	var chart = new google.visualization.ColumnChart(document.getElementById('chart_div01'));
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
	
	var chart = new google.visualization.LineChart(document.getElementById('chart_div02'));
	chart.draw(data, options);
	
}

</script>
<style>
   .mainContainer {
     padding: 50px;
     background-image: url('/Navi/img/background04.jpg'); 
     background-repeat: no-repeat; 
	 background-size: cover; 
	 background-position: center center;
   }
   .row {
     padding: 20px;
     text-align: center;
   }
</style>
<%
	String path = application.getContextPath();
	String imgPath = application.getContextPath() + "/img/userImg"; 
	request.setAttribute("imgPath", imgPath);
%>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<c:set var="imgPath" value="${ pageContext.request.contextPath }/img/userImg"/>
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
<div class="container w3-white card my-4" align="center">

	<h3 class="my-4"> 프로필 </h3>
	
	<div class="container mainContainer card mb-4" style="margin-top:30px ; max-width: 1400px;">
	
	<form action="${ path }/member/updateImage.do" modelAttribute="uploadFile" 
		target="_blank" method="post" enctype="multipart/form-data" acceptCharset="UTF-8">
	
		<div class = "row">
			<div class = "col-sm-6" align="center">
					<input type="file" id="file" name="file" path="file" accept="image/*" multiple="true" onchange="setThumbnail(event);"/>
				<div id="preview">
<!-- 					<input type="hidden" path="preview"> -->
					<c:if test="${ empty res.member_image }">
						<img id="original" alt="없음" src="${ imgPath }/default.jpg" style="width: 256px; height: 256px;" class="rounded-circle" alt="Circular Image">
					</c:if>
					<c:if test="${ !empty res.member_image }">
						<img alt="" id="original" src="${ imgPath }/${ res.member_image }" style="width: 256px; height: 256px;" class="rounded-circle" alt="Circular Image">
					</c:if>
				</div>	

				<br>
				<input type="hidden" path="member_no" name="member_no" value="${ sessionScope.login_user.member_no }">
				<input type="submit" value="save"  style="background-color: white; size: 20em;">

		</div>	
		<form> 		
			
			<div class = "col-sm-6">
					
					<label class = "font-weight-bolder">
						Username : 
					</label>
					<input type="text" value="${ res.username }" name="username" path="username">
					<%-- <c:out  value=" ${ res.username }"></c:out> --%>
					<br><br>
										
					<label class = "font-weight-bolder">
						총 포인트:
					</label>
					<c:out value=" ${ res.empty_point + res.share_point}"></c:out><br><br>
					<label class = "font-weight-bolder">
						비움 포인트:
					</label>
					<c:out value=" ${ res.empty_point }"></c:out><br><br>
					<label class = "font-weight-bolder">
						나눔 포인트:
					</label>
					<c:out value=" ${ res.share_point }"></c:out><br><br>
				
					<label class = "font-weight-bolder">
					회원 등급 : 
					</label>
					<c:out value=" ${ res.grade }"></c:out><br><br>
					<br><br>
					
					<div id = "updateU_name">
					<!-- <input type="submit">Username 변경</button> -->
					</div>
					<br>	

			</div>
		</div>
	
	</div>
</div>

<div class="container w3-white card my-3">
	<div class="container mb-4">
	
		<h4 class="my-3">카테고리 별 비움 물건 수</h4>
	  <div class="col-sm-12" id="chart_div01"></div>
		<h4 class="my-3">비움 물건 수</h4>
	  <div class="col-sm-12" id="chart_div02"></div>
		
	</div>
</div>
	
<div class="container" align="center">
	<c:import url="/footer.jsp" charEncoding="EUC-KR"/>
</div>

</body>
</html>