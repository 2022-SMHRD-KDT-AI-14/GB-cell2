<%@page import="com.smhrd.model.MyPage"%>
<%@page import="com.smhrd.model.MyPageDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="assets/css/main.css" />
</head>

<jsp:useBean id="MyPageDAO" class="com.smhrd.model.MyPageDAO" />
<c:set var="MyPageList"
	value="${MyPageDAO.selectMyPageOne(param.MEM_ID)}" />

<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header"> <a href="tbl_main.jsp" class="logo"><strong>무언가
						나누고 싶어?</strong> 1/N !</a>
				<ul class="icons">

					<c:choose>
						<c:when test="${empty loginMember}">
							<li><a href="tbl_login.jsp" class="icon solid fa-lock"><span
									class="label">로그인</span></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="logoutCon" class="icon solid fa-lock-open"><span
									class="label">Medium</span></a></li>
						</c:otherwise>
					</c:choose>
					<li><a href="#" class="icon solid fa-file-invoice-dollar"><span
							class="label">Medium</span></a></li>
					<li><a href="tbl_join.jsp" class="icon solid fa-user"><span
							class="label">Medium</span></a></li>
				</ul>
				</header>

				<section>
				<h2 style="text-align: center;">마이페이지</h2>
				</section>

				<div style="text-align: center;" class="table-wrapper">
					<table class="alt" >
						<thead>
							<tr>
								<th width="200px"></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
						<td>아이디 :</td>
						<td>${MyPageList.MEM_ID}</td>
					</tr>
					<tr>
						<td>비밀번호 :</td>
						<td>${MyPageList.MEM_PW}</td>
					</tr>
					<tr>
						<td>닉네임 :</td>
						<td>${MyPageList.MEM_NICK}</td>
					</tr>
					<tr>
						<td>이름 :</td>
						<td>${MyPageList.MEM_NAME}</td>
					</tr>
					<tr>
						<td>핸드폰번호 :</td>
						<td>${MyPageList.MEM_PHONE}</td>
					</tr>
					<tr>
						<td>계좌번호 :</td>
						<td>${MyPageList.MEM_BANK_NUM}</td>
					</tr>
					<tr>
						<td>주민번호 : ${MyPageList.MEM_JUMIN}</td>
						<td>${MyPageList.MEM_JUMIN}</td>
					</tr>
					<tr>
						<td>회원온도 :</td>
						<td>${MyPageList.MEM_TEMPER}</td>
					</tr>
					<tr>
						<c:choose>
					<c:when test="${MyPageList.MEM_AREA eq 'earth'}">
                        희망배송지역 없음<br>
					</c:when>
				</c:choose>
				<%-- <c:choose>
					<c:when test="${MyPageList.MEM_AREA eq 'earth'}">
						<button type="button"
							onclick="location.href='myPageMemAreainput.jsp';">희망배송지
							설정</button>
					</c:when>

					<c:otherwise>
						<div style="text-align: center;">
							<button type="button" class="button primary"
								onclick="location.href='myPageMemAreainput.jsp';">희망배송지
								수정</button>
							<a href="tbl_main.jsp" class="button">되돌아가기</a>
						</div>
					</c:otherwise>
				</c:choose> --%>
					</tr>
						</tbody>
						<tfoot>
							<tr>
								<td></td>
								<td></td>
							</tr>
						</tfoot>
					</table>
				</div>
				
				<c:choose>
					<c:when test="${MyPageList.MEM_AREA eq 'earth'}">
                        희망배송지역 없음<br>
					</c:when>
					<%-- <c:otherwise>
                        <td>희망배송지역 : ${MyPageList.MEM_AREA}</td><br>
                    </c:otherwise> --%>
				</c:choose>

				<!-- <a href="tbl_coordinateCon">추천배송지</a> -->

				<c:choose>
					<c:when test="${MyPageList.MEM_AREA eq 'earth'}">
						<button type="button"
							onclick="location.href='myPageMemAreainput.jsp';">희망배송지
							설정</button>
					</c:when>

					<c:otherwise>
						<div style="text-align: center;">
							<button type="button" class="button primary"
								onclick="location.href='myPageMemAreainput.jsp';">희망배송지
								수정</button>
							<a href="tbl_main.jsp" class="button">되돌아가기</a>
						</div>
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Search -->
				<section id="search" class="alt">
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="Search" />
					</form>
				</section>

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><a href="tbl_main.jsp">홈페이지</a></li>
						<li><a href="tbl_boardwrite.jsp">글작성</a></li>
						<li><span class="opener">공유하기</span>
							<ul>
								<li><a href="tbl_boardBuy.jsp">구매 게시판</a></li>
								<li><a href="tbl_boardId.jsp">계정공유 게시판</a></li>
								<li><a href="tbl_boardArbeit.jsp">알바 게시판</a></li>
								<li><a href="tbl_boardFree.jsp">자유 게시판</a></li>
							</ul></li>
						<li><a href="#">문의하기</a></li>
					</ul>
				</nav>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>추천상품</h2>
					</header>
					<div class="mini-posts">
						<article>
							<a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
							<p>상품1</p>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
							<p>상품2</p>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
							<p>상품3</p>
						</article>
					</div>
					<ul class="actions">
						<li><a href="#" class="button">공유참여</a></li>
					</ul>
				</section>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>문의주세요</h2>
					</header>
					<p>사이트의 이상이 있다면 아래 연락처로 연락 부탁 드립니다</p>
					<ul class="contact">
						<li class="icon solid fa-envelope"><a href="#">이메일</a></li>
						<li class="icon solid fa-phone">연락처</li>
						<li class="icon solid fa-home">주소<br /> 상세주소
						</li>
					</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
				</footer>

			</div>
		</div>
	</div>

	<!-- Scripts -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script type="text/javascript"></script>
</body>
</html>


