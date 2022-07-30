<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>1/N 😎분의 1 공유 중계 서비스</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
					<a href="tbl_main.jsp" class="logo"><strong>무언가 나누고 싶어?</strong> 1/N !</a>
					<ul class="icons">
					
						<c:choose>
						<c:when test="${empty loginMember}">
						<li><a href="tbl_login.jsp" class="icon solid fa-lock"><span class="label">로그인</span></a></li>
						</c:when>
						<c:otherwise>
						<li><a href="logoutCon" >로그아웃</span></a></li>
						</c:otherwise>
						</c:choose>
		
					
						<li><a href="#" class="icon solid fa-file-invoice-dollar"><span class="label">Medium</span></a></li>
						<li><a href="tbl_join.jsp" class="icon solid fa-user"><span class="label">Medium</span></a></li>
					</ul>
				</header>

				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<header>
							<h1>1/N 😎분의 1<br>
								공유 중계 서비스</h1>
						</header>
						<p>1/n은 무언가를 나누고 싶다는 목적으로 만들어진 사이트 입니다. 그 'N'의 것은 상품이 될 수도 있고 계정이 될 수도 있으며 일 분담이 될 수도 있습니다. 무언가를
							나누고자 하는 분들을 위한 서비스 입니다.</p>
						<ul class="actions">
						<c:if test="${!empty loginMember}">
							<li><a href="tbl_boardwrite.jsp" class="button big">게시물 작성</a></li>
							<li><a href="payState.jsp" class="button big">결제상태</a></li>
							<li><a href="myPage.jsp" class="button big">마이페이지</a></li>
						</c:if>
						</ul>
					</div>
					<span class="image object">
						<img src="images/pic10.png" alt="" />
					</span>
				</section>


				<!-- Section -->
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
				</section>
				
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
				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><a href="tbl_main.jsp">홈페이지</a></li>
						<li><a href="tbl_boardwrite.jsp">글작성</a></li>
						<li>
							<span class="opener">게시판 이동</span>
							<ul>
                                <li><a href="boardBuy.jsp">구매 게시판</a></li>
                                <li><a href="boardId.jsp">계정공유 게시판</a></li>
                                <li><a href="boardArbeit.jsp">알바 게시판</a></li>
                                <li><a href="boardFree.jsp">자유 게시판</a></li>
                            </ul>
						</li>
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
						<li class="icon solid fa-home">주소<br />
							상세주소</li>
					</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5
							UP</a>.</p>
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
</body>
</html>