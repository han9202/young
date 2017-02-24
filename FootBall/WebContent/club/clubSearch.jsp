<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FootBall</title>

<%@include file="/inc/asset.jsp" %>

<!-- 캐시 자동 삭제 -->
<meta http-equiv="Cache-Control" content="no-cache"/> 
<meta http-equiv="Expires" content="0"/> 
<meta http-equiv="Pragma" content="no-cache"/>


<style>

#submenu{
	width : 1000px;
	height : 50px;
	margin: 0px auto;
	border : 0px solid black;
}

#searchForm{
	width : 1000px;
	height : 50px;
	margin: 20px auto;
	border : 0px solid black;
}

.search{

	width : 150px;
	float: right;
	margin-right: 10px;

}
.search2{
	width : 150px;
	display: inline-block;
}

#searchBtn{
	float: right;
}

#nameSearch{
	width : 1000px;
	height : 50px;
	margin: 20px auto;
	border : 0px solid black;
}

#nameSearchcontent{
	width : 600px;
	margin: 0px auto;
}

.searchInput{
	width : 300px;
	display: inline-block;
}
#tbl th{text-align: center;}
#tbl td{text-align: center; vertical-align: middle;}
#tbl {text-align: center; height: 600px;}
#tbl th:nth-child(1),#tbl td:nth-child(1){width : 50px;}
#tbl th:nth-child(2),#tbl td:nth-child(2){width : 60px;}
#tbl th:nth-child(3),#tbl td:nth-child(3){width : 200px;}
#tbl th:nth-child(4),#tbl td:nth-child(4){width : 100px;}
#tbl th:nth-child(5),#tbl td:nth-child(5){width : 80px;}
#tbl th:nth-child(6),#tbl td:nth-child(6){width : 80px;}
#tbl th:nth-child(7),#tbl td:nth-child(7){width : 80px;}
#tbl th:nth-child(8),#tbl td:nth-child(8){width : 100px;}
#tbl th:nth-child(9),#tbl td:nth-child(9){width : 150px;}
#tbl th:nth-child(10),#tbl td:nth-child(10){width : 100px;}


</style>

<script>
$(document).ready(function() {

	
});

function movepage() {
	if (
				$("#pagenum").val() != null &&
				!isNaN($("#pagenum").val()) && 
				$("#pagenum").val() >=1 && 
				$("#pagenum").val() <= ${totalPage}
		) {
		location.href = "/FootBall/club/clubsearch.do?page=" + $("#pagenum").val();
	}
}

function movepage2() {
	location.href = "/FootBall/club/clubsearch.do?page=" + $(event.srcElement).val();
}

</script>

</head>
<body>

	<div id="main">
		<%@include file="/inc/top.jsp" %>
		
		<div id="middle">
			<div id="submenu">
				<ul class="nav nav-tabs">
				  <li role="presentation" class="active"><a href="#">클럽검색</a></li>
				  <li role="presentation"><a href="#">클럽생성</a></li>
				  <li role="presentation"><a href="#">My클럽</a></li>
				  <li role="presentation"><a href="#">클럽랭킹</a></li>
				</ul>
			</div>
			<div id="searchForm">
				<button id="searchBtn" class="btn btn-primary">검색</button>
				<select class="search form-control">
					<option>검색종류2</option>
					<option>등급별</option>
					<option>지역별</option>
				</select>
				<select class="search form-control">
					<option>검색종류1</option>
					<option>등급별</option>
					<option>지역별</option>
				</select>
			</div>
			<table id="tbl" class="table table-striped">
			
				<tr>
					<th>번호</th>
					<th>엠블럼</th>
					<th>클럽명</th>
					<th>클럽장</th>
					<th>최소나이</th>
					<th>최대나이</th>
					<th>현재인원/최대인원</th>
					<th>등급</th>
					<th>활동지역</th>
					<th>비고</th>
				</tr>	
				<c:if test="${empty list || list.size() == 0}">
				<tr>
				<td colspan="5">게시물이 존재하지 않습니다.</td>
				</tr>
				</c:if>
				<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.seq}</td>			
					<td><img src="../images/emblem.png" style="width : 30px;"><%-- ${dto.emblem} --%></td>
					<td>${dto.name}</td>
					<td>${dto.username}</td>
					<td>${dto.minage}</td>
					<td>${dto.maxage}</td>
					<td>${dto.nowcount}/${dto.maxusers}</td>
					<td>${dto.clublevel}</td>
					<td>${dto.dosi} ${dto.sigu}</td>
					<td><input type="button" value="가입신청" class="btn btn-primary"></td>
				</tr>
				</c:forEach>	
				
			</table>
			
			<div id="nameSearch">
				<div id="nameSearchcontent">
					<select class="search2 form-control">
						<option>검색종류2</option>
						<option>클럽명</option>
						<option>클럽장명</option>
					</select>
					<input type="text" class="searchInput form-control">
					<button id="searchBtn2" class="btn btn-primary">검색</button>
				</div>
			</div>
			
			<div id="pagebar" style="text-align: center;">
			${pagebar}
			</div>
		
		
		
		</div>
		
		<%@include file="/inc/bottom.jsp" %>
	</div>

</body>
</html>
