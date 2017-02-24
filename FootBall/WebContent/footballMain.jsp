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

</style>

<script>
$(document).ready(function(){
	
});


</script>

</head>
<body>

	<div id="main">
		<%@include file="/inc/top.jsp" %>
		
			<div id="middle">
				<div class="mainImg">
					<img src="images/main1.gif">
				</div>
				
				<div id="hotCount">
					<div class="countBox">
					
						<div class="userCount">
							<div>
								<span class="counter">2000</span>
								<h4>회원수</h4>
							</div>
						</div>
						
						<div class="clubCount">
							<div>
								<span class="counter">100</span>
								<h4>클럽수</h4>
							</div>
						</div>
						
						<div class="fsCount">
							<div>
								<span class="counter">5000</span>
								<h4>프리스타일 경기수</h4>
							</div>
						</div>
						
						<div class="matchCount">
							<div>
								<span class="counter">30</span>
								<h4>대회 경기수</h4>
							</div>
						</div>
						
					</div>
				</div>
			
			</div>
		
		<%@include file="/inc/bottom.jsp" %>
	</div>

</body>
</html>
