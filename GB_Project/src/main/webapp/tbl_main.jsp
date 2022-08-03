<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.smhrd.model.tbl_share"%>
<%@page import="java.util.Random"%>
<%@page import="com.smhrd.model.tbl_coordinate"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.tbl_coordinateDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>1/N 😎분의 1 공유 중계 서비스</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">


				<!-- Header -->
				<header id="header">
					<a href="tbl_main.jsp" class="logo"><strong>무언가 나누고
							싶어?</strong> 1/N !</a>
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

				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<header>
							<h1>
								1/N 😎분의 1<br> 공유 중계 서비스
							</h1>
						</header>
						<p>1/n은 무언가를 나누고 싶다는 목적으로 만들어진 사이트 입니다. 그 'N'의 것은 상품이 될 수도 있고
							계정이 될 수도 있으며 일 분담이 될 수도 있습니다. 무언가를 나누고자 하는 분들을 위한 서비스 입니다.</p>
						<ul class="actions">
							<c:if test="${!empty loginMember}">
								<li><a href="tbl_boardwrite.jsp" class="button big">게시물
										작성</a></li>
								<li><a href="payState.jsp" class="button big">결제상태</a></li>
								<li><a href="myPage.jsp?MEM_ID=${loginMember}"
									class="button primary">마이페이지</a></li>
								<c:if test="${loginMember=='admin'}">
									<li><a href="tbl_reportview.jsp" class="button big">신고내역확인</a></li>
								</c:if>
							</c:if>
						</ul>
					</div>
					<span class="image object"> <img src="images/pic10.png"
						alt="" />
					</span>
				</section>


				<!--  
				
				
				
				<section>
					<header class="major">
						<h2>추천 상품들</h2>
					</header>
					<div class="posts">
						<article>
							<a href="#" class="image"><img src="images/pic01.jpg" alt="" /></a>
							<h3>Interdum aenean</h3>
							<p>공유 하실 물건을 홍보하세요!</p>
							<ul class="actions">
								<li><a href="#" class="button">공유참여</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pic02.jpg" alt="" /></a>
							<h3>Nulla amet dolore</h3>
							<p>공유 하실 물건을 홍보하세요!</p>
							<ul class="actions">
								<li><a href="#" class="button">공유참여</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pic03.jpg" alt="" /></a>
							<h3>Tempus ullamcorper</h3>
							<p>공유 하실 물건을 홍보하세요!</p>
							<ul class="actions">
								<li><a href="#" class="button">공유참여</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pic04.jpg" alt="" /></a>
							<h3>Sed etiam facilis</h3>
							<p>공유 하실 물건을 홍보하세요!</p>
							<ul class="actions">
								<li><a href="#" class="button">공유참여</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pic05.jpg" alt="" /></a>
							<h3>Feugiat lorem aenean</h3>
							<p>공유 하실 물건을 홍보하세요!</p>
							<ul class="actions">
								<li><a href="#" class="button">공유참여</a></li>
							</ul>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pic06.jpg" alt="" /></a>
							<h3>Amet varius aliquam</h3>
							<p>공유 하실 물건을 홍보하세요!</p>
							<ul class="actions">
								<li><a href="#" class="button">공유참여</a></li>
							</ul>
						</article>
					</div>
				</section>-->

				<!-- Section -->
				<section>
					<header class="major">
						<h2>팀원소개</h2>
					</header>
					<div class="features">
						<article>
							<span class="icon solid fa-desktop"></span>
							<div class="content">
								<h3>김건빈</h3>
								<p>팀원을 소개합니다!</p>
							</div>
						</article>
						<article>
							<span class="icon solid fa-gem"></span>
							<div class="content">
								<h3>김윤주</h3>
								<p>팀원을 소개합니다!</p>
							</div>
						</article>
						<article>
							<span class="icon solid fa-database"></span>
							<div class="content">
								<h3>박성결</h3>
								<p>팀원을 소개합니다!</p>
							</div>
						</article>
						<article>
							<span class="icon solid fa-map"></span>
							<div class="content">
								<h3>임다영</h3>
								<p>팀원을 소개합니다!</p>
							</div>
						</article>
						<article>
							<span class="icon solid fa-dollar-sign"></span>
							<div class="content">
								<h3>최훈철</h3>
								<p>팀원을 소개합니다!</p>
							</div>
						</article>
					</div>
				</section>

			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar" class="inactive">
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
						<li><span class="opener">게시판 이동</span>
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
				<%
				if (session.getAttribute("MEM_ID") != null && session.getAttribute("loginMember") != null) {

					String MEM_ID = (String) session.getAttribute("MEM_ID");
					int MEM_LATITUDE = (int) session.getAttribute("MEM_LATITUDE");
					int MEM_LONGITUDE = (int) session.getAttribute("MEM_LONGITUDE");

					tbl_coordinateDAO dao = new tbl_coordinateDAO();

					ArrayList<String> id = new ArrayList<String>();
					List<tbl_coordinate> tbl_coordinate = dao.selectAllList();

					int cnt = 0;

					for (int i = 0; i < tbl_coordinate.size(); i++) {
						if (!tbl_coordinate.get(i).getMEM_ID().equals(MEM_ID)) {
					if (tbl_coordinate.get(i).getMEM_LATITUDE() < MEM_LATITUDE + 3
							&& tbl_coordinate.get(i).getMEM_LATITUDE() > MEM_LATITUDE - 3
							&& tbl_coordinate.get(i).getMEM_LONGITUDE() < MEM_LONGITUDE + 3
							&& tbl_coordinate.get(i).getMEM_LONGITUDE() > MEM_LONGITUDE - 3) {
						id.add(cnt, tbl_coordinate.get(i).getMEM_ID());
						cnt++;
					}
						}
					}

					int num1 = 0;
					int num2 = 0;
					int num3 = 0;
					int num11 = 0;
					int num22 = 0;
					int num33 = 0;
					int a = 0;
					int b = 0;
					int c = 0;
					List<tbl_share> list1 = new ArrayList<tbl_share>();
					List<tbl_share> list2 = new ArrayList<tbl_share>();
					List<tbl_share> list3 = new ArrayList<tbl_share>();

					Random r = new Random();
					if (id.size() > 0) {
						num1 = r.nextInt(id.size());
						num2 = r.nextInt(id.size());
						num3 = r.nextInt(id.size());
						list1 = dao.selectListshare(id.get(num1));
						list2 = dao.selectListshare(id.get(num2));
						list3 = dao.selectListshare(id.get(num3));
					}
					if (list1.size() > 0) {
						num11 = r.nextInt(list1.size());
						a = list1.get(num11).getBOARD_SEQ().intValue();
					}
					if (list2.size() > 0) {
						num22 = r.nextInt(list2.size());
						b = list2.get(num22).getBOARD_SEQ().intValue();
					}
					if (list3.size() > 0) {
						num33 = r.nextInt(list3.size());
						c = list3.get(num33).getBOARD_SEQ().intValue();

					}

					int board_seq1 = a / 2;
					int board_seq2 = b / 2;
					int board_seq3 = c / 2;

					session.setAttribute("board_seq1", board_seq1);
					session.setAttribute("board_seq2", board_seq2);
					session.setAttribute("board_seq3", board_seq3);
				%>

				<section>
					<header class="major">
						<h2>추천상품</h2>
					</header>
					<div class="mini-posts">
						<%
						if (list1.size() > 0) {
						%>
						<article>
							<a href="boardView.jsp?num=${board_seq1}" class="image"><img
								src="images/pic07.jpg" alt="" /></a>
							<p>
								제목 :
								<%=list1.get(num11).getARTICLE_TITLE()%></p>
							<p>
								작성자 :
								<%=list1.get(num11).getMEM_ID()%></p>
							<%
							}
							%>
						</article>
						<%
						if (list2.size() > 0) {
						%>
						<article>
							<a href="boardView.jsp?num=${board_seq2}" class="image"><img
								src="images/pic08.jpg" alt="" /></a>
							<p>
								제목 :
								<%=list2.get(num22).getARTICLE_TITLE()%></p>
							<p>
								작성자 :
								<%=list2.get(num22).getMEM_ID()%></p>
							<%
							}
							%>
						</article>
						<%
						if (list3.size() > 0) {
						%>
						<article>
							<a href="boardView.jsp?num=${board_seq3}" class="image"><img
								src="images/pic09.jpg" alt="" /></a>
							<p>
								제목 :
								<%=list3.get(num33).getARTICLE_TITLE()%></p>
							<p>
								작성자 :
								<%=list3.get(num33).getMEM_ID()%></p>
						</article>
						<%
						}
						%>
					</div>
					<ul class="actions">
						<li><a href="#" class="button">공유참여</a></li>
					</ul>
				</section>
				<%
				}
				%>
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
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>