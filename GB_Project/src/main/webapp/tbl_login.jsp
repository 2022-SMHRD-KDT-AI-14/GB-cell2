<%@page import="com.smhrd.model.tbl_share"%>
<%@page import="java.util.Random"%>
<%@page import="com.smhrd.model.tbl_coordinate"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.tbl_coordinateDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<html>

<head>
<title>login</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
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
						<li><a href="tbl_login.jsp" class="icon solid fa-lock"><span
								class="label">Medium</span></a></li>
						<li><a href="#" class="icon solid fa-file-invoice-dollar"><span
								class="label">Medium</span></a></li>
						<li><a href="tbl_join.jsp" class="icon solid fa-user"><span
								class="label">Medium</span></a></li>
					</ul>
				</header>

				<section>

					<header class="major">
						<h2>로그인</h2>
					</header>
					<form action="test_loginCon" method="post" id="loginform">
						<div></div>
						<div text-align="center" style="margin-bottom: 15px;">
							아이디
							<div class="row">
								<div class="col-6 col-12-small">
									<input type="text" class="fadeIn second" name="id"
										placeholder="id" style="margin-top: 15px">
								</div>
								<div class="col-6 col-12-small"></div>
							</div>

						</div>
						<div text-align="center" style="margin-bottom: 15px;">
							비밀번호

							<div class="row">
								<div class="col-6 col-12-small">
									<input type="password" class="fadeIn third" name="pw"
										placeholder="password">
								</div>
								<div class="col-6 col-12-small"></div>
							</div>

						</div>
						
						<div>
							<input type="submit" class="bttn" value="로그인">
							<a href="tbl_join.jsp" class="button primary">회원가입</a>
						</div>
					</form>
				</section>
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
						<li><a href="home.html">홈페이지</a></li>
						<li><a href="boardwrite.html">글작성</a></li>
						<li><span class="opener">공유하기</span>
							<ul>
								<li><a href="#">구매 게시판</a></li>
								<li><a href="#">계정공유 게시판</a></li>
								<li><a href="#">알바 게시판</a></li>
								<li><a href="#">자유 게시판</a></li>
							</ul></li>
						<li><a href="#">문의하기</a></li>


					</ul>
				</nav>
				<!-- Section -->
				<%if(session.getAttribute("MEM_ID")!=null){ 
				
					
						String MEM_ID = (String)session.getAttribute("MEM_ID");
						int MEM_LATITUDE = (int)session.getAttribute("MEM_LATITUDE");
						int MEM_LONGITUDE = (int)session.getAttribute("MEM_LONGITUDE");



						tbl_coordinateDAO dao = new tbl_coordinateDAO();

							ArrayList<String> id = new ArrayList<String>();
							List<tbl_coordinate> tbl_coordinate = dao.selectAllList();
							
							int cnt = 0;
						for(int i = 0 ; i<tbl_coordinate.size();i++){
							if(!tbl_coordinate.get(i).getMEM_ID().equals(MEM_ID)){
							if(tbl_coordinate.get(i).getMEM_LATITUDE()<MEM_LATITUDE+3&&tbl_coordinate.get(i).getMEM_LATITUDE()>MEM_LATITUDE-3
								&&tbl_coordinate.get(i).getMEM_LONGITUDE()<MEM_LONGITUDE+3&&tbl_coordinate.get(i).getMEM_LONGITUDE()>MEM_LONGITUDE-3){
								id.add(cnt, tbl_coordinate.get(i).getMEM_ID());
								cnt++;
							}
							}
						}
						  Random r = new Random();
						  int num1 = r.nextInt(id.size());
						  int num2 = r.nextInt(id.size());
						  int num3 = r.nextInt(id.size());
						  List<tbl_share> list1 = dao.selectListshare(id.get(num1));
						  List<tbl_share> list2 = dao.selectListshare(id.get(num2));
						  List<tbl_share> list3 = dao.selectListshare(id.get(num3));
						  int num11 = r.nextInt(list1.size());
						  int num22 = r.nextInt(list2.size());
						  int num33 = r.nextInt(list3.size());
						
						  
						  int a = list1.get(num11).getBOARD_SEQ().intValue();
						  int b = list2.get(num22).getBOARD_SEQ().intValue();
						  int c = list3.get(num33).getBOARD_SEQ().intValue();
						  
						 int board_seq1 =a/2;
						  int board_seq2 = b/2;
						  int board_seq3 = c/2;
						  
						  session.setAttribute("board_seq1", board_seq1);
						  session.setAttribute("board_seq2", board_seq2);
						  session.setAttribute("board_seq3", board_seq3);
				
				%>
				
				<section>
					<header class="major">
						<h2>추천상품</h2>
					</header>
					<div class="mini-posts">
						<article>
							<a href="boardView.jsp?num=${board_seq1}" class="image"><img src="images/pic07.jpg" alt="" /></a>
							<p>제목 : <%=list1.get(num11).getARTICLE_TITLE() %></p>
							<p>작성자 : <%=list1.get(num11).getMEM_ID() %></p>
							
						</article>
						<article>
							<a href="boardView.jsp?num=${board_seq2}" class="image"><img src="images/pic08.jpg" alt="" /></a>
							<p>제목 : <%=list2.get(num22).getARTICLE_TITLE() %></p>
							<p>작성자 : <%=list2.get(num22).getMEM_ID() %></p>
						</article>
						<article>
							<a href="boardView.jsp?num=${board_seq3}" class="image"><img src="images/pic09.jpg" alt="" /></a>
							<p>제목 : <%=list3.get(num33).getARTICLE_TITLE() %></p>
							<p>작성자 : <%=list3.get(num33).getMEM_ID() %></p>
						</article>
					</div>
					<ul class="actions">
						<li><a href="#" class="button">공유참여</a></li>
					</ul>
				</section>
				<%} %>

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