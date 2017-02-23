<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

#sideDiv1{
	border : 1px solid black;
	width : 100px;
	height: 100px;
	position : relative;
	left : 0px;
	top : 10px;
	z-index: 1;
	background-color: white;
	display: none;
}
#sideDiv2{
	border : 1px solid black;
	width : 100px;
	height: 80px;
	position : relative;
	left : 0px;
	top : 10px;
	z-index: 1;
	background-color: white;
	display: none;
}

.sideList{
	width : 80px;
	margin-left : 8px;
	margin-top : 2px;
	cursor: pointer;
}

</style>
<script>

$(function(){

	$("#sideMenu1").mouseover(function(){
		$("#sideDiv1").show();
		
	});
	$("#sideMenu1,#sideDiv1").mouseout(function(){
		$("#sideDiv1").hide();
		
	});
	$("#sideMenu2").mouseover(function(){
		$("#sideDiv2").show();
	});
	$("#sideMenu2,#sideDiv2").mouseout(function(){
		$("#sideDiv2").hide();
		
	});
	
})


</script>
<div id="top">
	<div id="mainImage">
		<a href="#"><img src="images/logo.png"></a>
	</div>
	<div id="topRight">
		<div id="auth">
			<div class="loginForm">
				<a href="#">회원가입</a>
			</div>
			<div class="loginForm">
				<a href="#">로그인</a>
			</div>
		</div>
		
		<div id="topMenu">
			<div class="menuLink" id="sideMenu1">
				<span><a href="#">클럽</a></span>
				<div id="sideDiv1">
					<div class="sideList">클럽검색</div>
					<div class="sideList">클럽생성</div>
					<div class="sideList">My클럽</div>
					<div class="sideList">클럽랭킹</div>
				</div>
			</div>
			<div class="menuLink" id="sideMenu2">
				<span><a href="#">대회</a></span>
				<div id="sideDiv2">
					<div class="sideList">대회리스트</div>
					<div class="sideList">대회신청</div>
					<div class="sideList">대회결과</div>
				</div>
			</div>
			<div class="menuLink">
				<span><a href="#">프리스타일</a></span>
			</div>
			<div class="menuLink">
				<span><a href="#">공지사항</a></span>
			</div>
			<div class="menuLink">
				<span><a href="#">건의사항</a></span>
			</div>
			<div class="menuLink">
				<span><a href="#">자유게시판</a></span>
			</div>
			<div class="menuLink">
				<span><a href="#">포토갤러리</a></span>
			</div>
		</div>
	</div>
	

</div>
