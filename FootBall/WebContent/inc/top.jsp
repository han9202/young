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
	<div id="topContent">
		<div id="mainImage">
			<a href="/FootBall/footballmain.do"><img src="/FootBall/images/logo.png"></a>
		</div>
		<div id="topRight">
			<div id="auth">
				<div class="loginForm">
					<a href="/FootBall/register/register.do">회원가입</a>
				</div>
				<div class="loginForm">
					<a href="/FootBall/member/login.do">로그인</a>
				</div>
			</div>		
			<div id="topMenu">
				<div class="menuLink" id="sideMenu1">
					<span><a href="/FootBall/club/clubsearch.do">클럽</a></span>
					<div id="sideDiv1">
						<div class="sideList"><a href="/FootBall/club/clubsearch.do">클럽검색</a></div>
						<div class="sideList"><a href="/FootBall/club/clubadd.do">클럽생성</a></div>
						<div class="sideList"><a href="/FootBall/club/myclub.do">My클럽</a></div>
						<div class="sideList"><a href="/FootBall/club/clubrank.do">클럽랭킹</a></div>
					</div>
				</div>
				<div class="menuLink" id="sideMenu2">
					<span><a href="/FootBall/match/matchlist.do">대회</a></span>
					<div id="sideDiv2">
						<div class="sideList"><a href="/FootBall/match/matchlist.do">대회리스트</a></div>
						<div class="sideList"><a href="/FootBall/match/matchapply.do">대회신청</a></div>
						<div class="sideList"><a href="/FootBall/match/matchresult.do">대회결과</a></div>
					</div>
				</div>
				<div class="menuLink">
					<span><a href="/FootBall/freestyle/list.do">프리스타일</a></span>
				</div>
				<div class="menuLink">
					<span><a href="/FootBall/board/nocticelist.do">공지사항</a></span>
				</div>
				<div class="menuLink">
					<span><a href="/FootBall/board/proposallist.do">건의사항</a></span>
				</div>
				<div class="menuLink">
					<span><a href="/FootBall/board/freelist.do">자유게시판</a></span>
				</div>
				<div class="menuLink">
					<span><a href="/FootBall/board/galleylist.do">포토갤러리</a></span>
				</div>
			</div>
		</div>
	</div>
	
	

</div>
	
