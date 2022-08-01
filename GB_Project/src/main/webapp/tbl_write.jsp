<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>write</title>
	<meta charset="utf-8" />
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
						<li><a href="tbl_main.jsp" class="icon solid fa-home"><span class="label">Medium</span></a></li>
						<li><a href="#" class="icon solid fa-file-invoice-dollar"><span class="label">Medium</span></a>
						</li>
						<li><a href="tbl_join.jsp" class="icon solid fa-user"><span class="label">Medium</span></a></li>
					</ul>
				</header>

				<section>
					<header class="main">
						<h1>게시물 작성</h1>
					</header>
					
					
					<form action="test_BoardWriteCon" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
						<div class="col-6 col-12-small">
							<input type="text" placeholder="게시물 제목 작성" name="name">
						</div>
						<br>

						<!-- 게시물 작성 -->
						<div class="col-6 col-12-small">
							<div class="col-6 col-12-small">
								<div class="col-6 col-12-small">
									<input name="filename" type="file">
								</div>
								<div >
									<div>
										<br>
										<input type="radio" name="radio" id="r1" value="1" checked><label
											for="r1">자유</label>
										<input type="radio" name="radio" id="r2" value="2"><label for="r2">계정공유</label>
										<input type="radio" name="radio" id="r3" value="3"><label for="r3">알바대행</label>
										<input type="radio" name="radio" id="r4" value="4"><label for="r4">구매</label>
									</div>

									<div class="buyForm" style="width:300px; display:none;">
										구매링크 <input type="text" name="buylink">
										구매가격 <input type="text" name="buypay">
										<br>
									</div>

									<div class="accountingForm" style="width:300px; display:none;">
										계정링크 <input type="text" name="idlink">
										이용기간 <input type="text" name="idtime">
										구매가격 <input type="text" name="idpay">
										<br>
									</div>

									<div class="albeitForm" style="width:300px;  display:none;">
										알바시간 <input type="text" name="arbeittime">
										알바장소 <input type="text" name="arbeitsite">
										알바시급 <input type="text" name="arbeitpay">
										<br>
									</div>
								</div>
								<script>
									$(document).ready(function () {

										// 라디오버튼 클릭시 이벤트 발생
										$("input:radio[name=radio]").click(function () {

											if ($("input[name=radio]:checked").val() == "1") {
												$(".buyForm").css('display', 'none')
												$(".accountingForm").css('display', 'none')
												$(".albeitForm").css('display', 'none')

											} else if ($("input[name=radio]:checked").val() == "2") {
												$(".buyForm").css('display', 'none')
												$(".accountingForm").css('display', 'block')
												$(".albeitForm").css('display', 'none')
											} else if ($("input[name=radio]:checked").val() == "3") {
												$(".buyForm").css('display', 'none')
												$(".accountingForm").css('display', 'none')
												$(".albeitForm").css('display', 'block')
											} else if ($("input[name=radio]:checked").val() == "4") {
												$(".buyForm").css('display', 'block')
												$(".accountingForm").css('display', 'none')
												$(".albeitForm").css('display', 'none')



											}
										});
									});
								</script>

								<textarea name="content" rows="10" style="width : 100%;"></textarea><br>
								
								<input type="submit" value="작성완료">
								
							</div>
						</div>
					</form>
				</section>


			</div>
		</div>

		<!-- Sidebar -->
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
				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><a href="tbl_main.jsp">홈페이지</a></li>
						<li><a href="tbl_boardwrite.jsp">글작성</a></li>
						<li>
							<span class="opener">공유하기</span>
							<ul>
                                <li><a href="tbl_boardBuy.jsp">구매 게시판</a></li>
                                <li><a href="tbl_boardId.jsp">계정공유 게시판</a></li>
                                <li><a href="tbl_boardArbeit.jsp">알바 게시판</a></li>
                                <li><a href="tbl_boardFree.jsp">자유 게시판</a></li>
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

	</script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>