<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>arTchive / 마이페이지 - 개인정보 수정(기본 정보)</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/tools/reset.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage/myPageModifying.css'/>"/>
		
		<script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
		<div class="wrapper">
			 <c:import url="/WEB-INF/views/layout/top.jsp" />
		
		<section>
			<nav>
				<ul class="tabMenu">
					<li><a>마이페이지</a></li>
					<li><a href="<c:url value='/myPage/myPageHome'/>">홈</a></li>
					<li><a href="<c:url value='/myPage/myPageCheck'/>">개인정보 수정</a></li>
					<li><a href="<c:url value='/myPage/myPageRecommend'/>">추천 콘텐츠</a></li>
					<li><a href="<c:url value='/myPage/myPageScrap'/>">내 전시</a></li>
					<li><a href="<c:url value='/myPage/myPageActive'/>">활동 내역</a></li>
					<li><a href="<c:url value='/myPage/myPageReserv'/>">예매 내역</a></li>
				</ul>
			</nav>	
			<div class="myPageBox">
				<h2>개인정보 수정</h2>
					<p class="line">
				<div class="titleBox">
						<a href="<c:url value='/myPage/myPageModifying'/>">기본 정보</a>
						<a href="<c:url value='/myPage/myPageCustomized'/>">맞춤 정보</a>
				</div><!-- titleBox -->
				<form>
				
				<div class="tableBox">
					<table>
						<thead>
							<tr>
								<th>이름</th>
								<th>아이디</th>
								<th>닉네임</th>
								<th>비밀번호</th>
								<th>비밀번호 확인</th>
							</tr>
						</thead>
					
						<tbody>
							<tr>
								<td><input type="text" class="nameInput" placeholder="이름" readonly ></td>
								<td><input type="text" class="emailInput" placeholder="email@address.com" readonly ></td>
								<td><input type="text" class="nicknameInput" placeholder="닉네임 입력(6~20자)">
								<td>
									<div class="pwMentBox">
										<input type="password" class="pwInput" placeholder="비밀번호를 입력하세요." >
										<span>※ 8자~20자 이내의 영문자, 숫자, 특수문자를 혼용하여 입력해주세요.</span>
									</div>
								</td>
								<td><input type="password" class="pwConfirmInput" placeholder="비밀번호를 다시 한 번 입력하세요." ></td>
							</tr>
						</tbody>
					</table>
						<div class="buttonBox"> 
							<input type="submit" class="submitBtn" value="저장">
							<input type="reset" class="resetBtn" value="취소">
						</div> <!-- buttonBox -->
					</div><!--tableBox -->
					</form>
			</div> <!-- myPageBox -->
		</section>
		 </div> <!-- wrapper -->
		 <c:import url="/WEB-INF/views/layout/bottom.jsp" />
	</body>
</html>