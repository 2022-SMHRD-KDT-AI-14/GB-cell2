<%@page import="java.util.Random"%>
<%@page import="com.smhrd.model.tbl_share"%>
<%@page import="com.smhrd.model.tbl_coordinate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.tbl_coordinateDAO"%>
<%@page import="com.smhrd.model.BuyApplicant"%>
<%@page import="com.smhrd.model.BuyApplicantDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ShareDAO"%>
<%@page import="com.smhrd.model.Share"%>
<%@page import="com.smhrd.model.ConfirmationDAO"%>
<%@page import="com.smhrd.model.Confirmation"%>
<%@page import="javax.swing.text.html.CSS"%>
<%@page import="com.smhrd.model.BoardDAO"%>
<%@page import="com.smhrd.model.tbl_reportDAO"%>
<%@page import="com.smhrd.model.tbl_shareDAO"%>
<%@page import="com.smhrd.model.tbl_applicantselectDAO"%>
<%@page import="com.smhrd.model.tbl_applicantDAO"%>
<%@page import="com.smhrd.model.tbl_applicantselect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>boardView</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<jsp:useBean id="BoardDAO" class="com.smhrd.model.BoardDAO" />
<c:set var="board" value="${BoardDAO.selectOne(param.num*2)}" />

<jsp:useBean id="WritebuyDAO" class="com.smhrd.model.tbl_shareWriteDAO" />
<c:set var="boardbuy" value="${WritebuyDAO.selectBuyOne(param.num*2)}" />

<jsp:useBean id="WriteaccountDAO"
	class="com.smhrd.model.tbl_shareWriteDAO" />
<c:set var="boardaccount"
	value="${WriteaccountDAO.selectAccountOne(param.num*2)}" />

<jsp:useBean id="WritefreeDAO" class="com.smhrd.model.tbl_shareWriteDAO" />
<c:set var="boardfree"
	value="${WritefreeDAO.selectFreeOne(param.num*2)}" />

<jsp:useBean id="WritearbeitDAO"
	class="com.smhrd.model.tbl_shareWriteDAO" />
<c:set var="boardarbeit"
	value="${WritearbeitDAO.selectArbeitOne(param.num*2)}" />
<body class="is-preload">
	<%
	int num = Integer.parseInt(request.getParameter("num"));
	int real_num = num * 2;
	String MEM_ID = (String) session.getAttribute("loginMember");
	tbl_applicantselect vo = new tbl_applicantselect(MEM_ID, real_num);
	tbl_applicantselectDAO dao = new tbl_applicantselectDAO();
	
	
	
	Confirmation voo = new Confirmation(MEM_ID,real_num);
	String comState = new ShareDAO().selectOne(real_num).getArticle_state();
	System.out.print("게시글번호, 상태 >> "+real_num+" , "+comState+"\n");
	String state = new ConfirmationDAO().selectConfirm(voo);

	%>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<h3 id="main_test">무언가 나누고 싶어?</h3>
					<a href="tbl_main.jsp" class="logo">
					<strong style="font-size: 40pt;">&nbsp;&nbsp;&nbsp;&nbsp;N분의 1</strong></a>

					<ul class="icons" style="padding: 20px;">
					
					
						<c:choose>
							<c:when test="${empty loginMember}">
								<li><a href="tbl_login.jsp" class="icon solid fa-lock"><span
										class="label">로그인</span></a></li>
							</c:when>
							<c:otherwise>
								<li>${loginMember}님 환영합니다!😊&nbsp;</li>
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
					<img
						src="https://m.bunjang.co.kr/pc-static/resource/f1f8a93028f0f6305a87.png"
						width="15" height="15"> <img
						src="https://m.bunjang.co.kr/pc-static/resource/c5ce9d5a172b0744e630.png"
						width="6" height="10"> 게시판 이동 <img
						src="https://m.bunjang.co.kr/pc-static/resource/c5ce9d5a172b0744e630.png"
						width="6" height="10"> 구매/계정/알바/자유 <img
						src="https://m.bunjang.co.kr/pc-static/resource/c5ce9d5a172b0744e630.png"
						width="6" height="10"> 공유하기
				</section>
				
				<section>
					<div class="row">
						<div class="col-6 col-12-small">
							<c:choose>
								<c:when test="${empty board.ARTICLE_FILE}">
									<img src="images/pic01.jpg" />
								</c:when>
								<c:otherwise>
									<img src="img/${board.ARTICLE_FILE}" width="400px"
										height="300px">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-6 col-12-small">
							<p>제목 : ${board.ARTICLE_TITLE}
								<%if(comState.equals("거래확정")){ %>
								(이미확정된거래입니다)
								<%} %>
								<p style="font-size: 20pt; color: black">
									<b>${board.ARTICLE_TITLE}</b>
								</p>
							</header>
							<p>
								<a onclick="new_window();">작성자(신고기록) : ${board.MEM_ID}</a>
							</p>
							<p id="date">작성날짜 : ${board.ARTICLE_DATE}</p>

							<p>진행상태 : ${board.ARTICLE_STATE}</p>
							





							<c:choose>
								<c:when test="${board.CAT_NAME=='B'}">
									<p>
										<a href="${boardbuy.BUY_LINK}">구매링크 : ${boardbuy.BUY_LINK}</a>
									</p>
									<p><b>구매가격 : ${boardbuy.BUY_PAY}원</b></p>
								</c:when>

								<c:when test="${board.CAT_NAME=='A'}">
									<p>알바시간 : ${boardarbeit.ARBEIT_TIME}</p>
									<p>알바장소 : ${boardarbeit.ARBEIT_SITE}</p>
									<p><b>알바시급 : ${boardarbeit.ARBEIT_PAY}</b></p>
								</c:when>

								<c:when test="${board.CAT_NAME=='I'}">
									<p>계정링크 : ${boardaccount.ID_LINK}</p>
									<p>이용기간 : ${boardaccount.ID_TIME}</p>
									<p><b>구매가격 : ${boardaccount.ID_PAY}</b></p>
								</c:when>

								<c:otherwise>

								</c:otherwise>
							</c:choose>



							<br>
							<div style="text-align: center;">
								<button>

									<img
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAbBJREFUeNrsls9LAkEcxb+au+JSGIEQyGbBdg881CmConsE9Qd07S/p0qG69RcUdOzSoUt0UujS3c0kEQULU7R17c2wyhazNbvaesgHH9xZh3kzb35tpNfrUV/5fJ7+Stls9ks5FqCNKTDv/L6AjyAdiUrWi4AdcAXewDMwwTu4AQdAHbXxCrh3TJm55vpPAVvgHDyC7VEZM6M7sCbRlgGuwaGM8U9zvAkunbn0M/8nzvNpkBHr4MKnqVvHYDWI8RGY84wpFiNFUX5L8sxZlNJRL4E9UeVkMknpdJoSiQQvt9ttKpfLVK1WhVsXbIBb2RHvi96nUikyDGNgyhSPxymTyZCu614D2/UT9bqooqZpnrm6OyNYoNLGy6KKxWKRR/td3W6XCoWCV/sLfoyFJ5Bt29zAfbb3O9TpdLzaZzFND3NkcjUaDapUKoNyvV6nWq0ms7eHM2YqlUrUarXIsiwyTTPwbeX7dmJRs8hVVeXmoRkzNZtNzjCK0pg0MQ5NosX1BKwRetjCb6lcLje2ES+GHDk72G1m/MCu2hCNZ8HrZDv9j33MVtlMiJ58X38KMADfFnDPWur9bAAAAABJRU5ErkJggg=="
										width="15" height="15"> <a
										href="tbl_reportWrite.jsp?num=${board.BOARD_SEQ}"> 신고하기 </a>
								</button>
								<c:if test="${loginMember != board.MEM_ID}">
									<c:if test="${board.CAT_NAME=='B'}">
										<%//거래확정된글이거나 내가이미 참석하기 버튼을 눌렀을 경우
										if(comState.equals("거래확정") || dao.selectB(vo)!=null){
										/* if (dao.selectB(vo) != null) { */
										%>
										<%
										} else {
										%>
										<a
											href="insertStateConB?board_seq=${board.BOARD_SEQ}&
											buy_link=${boardbuy.BUY_LINK}&
											buy_pay=${boardbuy.BUY_PAY}&
											cat_name=B">
											<button class="button primary" onclick="B()">참여결정</button>
										</a>
										<%
										}
										%>
									</c:if>
									<c:if test="${board.CAT_NAME=='A'}">
										<%
										if (dao.selectA(vo) != null) {
										%>
										<%
										} else {
										%>
										<a
											href="insertStateConA?
			board_seq=${board.BOARD_SEQ}&
			arb_time=${boardarbeit.ARBEIT_TIME}&
			arb_site=${boardarbeit.ARBEIT_SITE}&
			arb_pay=${boardarbeit.ARBEIT_PAY}&
			cat_name=A">
											<button class="button primary" onclick="A()">참여결정</button>
										</a>

										<%
										}
										%>
									</c:if>
									<c:if test="${board.CAT_NAME=='I'}">
										<%
										if (dao.selectI(vo) != null) {
										%>
										<%
										} else {
										%>
										<a
											href="insertStateConI?
			board_seq=${board.BOARD_SEQ}&
			acc_link=${boardaccount.ID_LINK}&
			acc_time=${boardaccount.ID_TIME}&
			acc_pay=${boardaccount.ID_PAY}&
			cat_name=I">
											<button class="button primary" onclick="I()">참여결정</button>
										</a>

										<%
										}
										%>
									</c:if>
									<c:if test="${board.CAT_NAME=='F'}">
										<%
										if (dao.selectF(vo) != null) {
										%>
										<%
										} else {
										%>
										<a
											href="insertStateConF?
			board_seq=${board.BOARD_SEQ}&
			cat_name=F">
											<button class="button primary" onclick="F()">참여결정</button>
										</a>

										<%
										}
										%>
									</c:if>
								</c:if>


							</div>
						</div>
					</div>
					<br>
				</section>
				
				<%
					Share share = new ShareDAO().selectOne(real_num);
					String writer = share.getMem_id();
					List<Share> shareList = new ShareDAO().selectAllMyList(writer);
				%>
				
				<header class="major">
					<h4>작성자 게시물</h4>
				</header>
				<section style="padding: 10px; margin: 10px">
					<div class="row">
						<%for(Share s: shareList){
							BuyApplicant b= new BuyApplicantDAO().selectOne(s.getBoard_seq().intValue());	
							int price = b.getBuy_pay().intValue();
						%>
						
						<div class="col-3 col-12-small">
							<article>
								<a href="boardView.jsp?num=<%=s.getBoard_seq().intValue()/2 %>" class="image">	
								<img width="200" height="150" src="img/<%=s.getArticle_file() %>"></a>
								<p><%=s.getArticle_title() %></p>
								<p style="padding: 10px;"><%=price%>원</p>
							</article>
						</div>
						<%} %>
					</div>
				</section>
				<section>
					<header class="major">
						<h4>작성내용</h4>
					</header>
					<div>

						<p>${board.ARTICLE_CONTENT}</p>

					</div>
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
				<%
				if (session.getAttribute("MEM_ID") != null && session.getAttribute("loginMember") != null) {

					int MEM_LATITUDE = (int) session.getAttribute("MEM_LATITUDE");
					int MEM_LONGITUDE = (int) session.getAttribute("MEM_LONGITUDE");
					
					tbl_coordinateDAO ddao = new tbl_coordinateDAO();
					ArrayList<String> id = new ArrayList<String>();
					List<tbl_coordinate> tbl_coordinate = ddao.selectAllList();

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
						list1 = ddao.selectListshare(id.get(num1));
						list2 = ddao.selectListshare(id.get(num2));
						list3 = ddao.selectListshare(id.get(num3));
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
							<a href="boardView.jsp?num=${board_seq1}" class="image">
							<img src="img/<%=list1.get(num11).getARTICLE_FILE()%>" alt="" /></a>
							
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
							<a href="boardView.jsp?num=${board_seq2}" class="image">
							<img src="img/<%=list2.get(num11).getARTICLE_FILE()%>" alt="" /></a>
							
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
							<a href="boardView.jsp?num=${board_seq3}" class="image">
							<img src="img/<%=list3.get(num11).getARTICLE_FILE()%>" alt="" /></a>
							
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
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script type="text/javascript">
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
		//게시물요청
		var slideIndex = 0; //slide index

		// HTML 로드가 끝난 후 동작
		window.onload = function() {
			showSlides(slideIndex);

			// Auto Move Slide
			var sec = 3000;
			setInterval(function() {
				slideIndex++;
				showSlides(slideIndex);

			}, sec);
		}

		// Next/previous controls
		function moveSlides(n) {
			slideIndex = slideIndex + n
			showSlides(slideIndex);
		}

		// Thumbnail image controls
		function currentSlide(n) {
			slideIndex = n;
			showSlides(slideIndex);
		}

		function showSlides(n) {

			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			var size = slides.length;

			if ((n + 1) > size) {
				slideIndex = 0;
				n = 0;
			} else if (n < 0) {
				slideIndex = (size - 1);
				n = (size - 1);
			}

			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}

			slides[n].style.display = "block";
			dots[n].className += " active";
		}

		next_list(1, 1);

		var arr = null;
		var pageSize = 3;
		var maxRow = 10;


		//다음 버튼이 눌린다면 그에 맞는 버튼들이 생성, 삭제 와 해당 리스트가 출력되기 위한 메소드 
		function next_list(startRow, startPage) {
			$.ajax({
				/* jsp 시작하면서 바로 border서블릿과 비동기 통신으로 DB 에있는 내용을 가져온다 */
				url : 'BboardPagingCon',
				method : 'post',
				dataType : 'json', //응답데이터 형식지정 (그전에는 문자열을 받아와서 따로지정안했음)
				data : {
					"num" : startRow
				},/* 한 페이지 에서 가져와야하는 양이 정해저 있으므로 어디 페이지에서 요청했는지 알기위해 가져올DB의 시작 num을 같이 넘겨 준다 */
				success : function(data_list) {
					console.log("next_list함수에서 받아온 data_list"+data_list)

					if (data_list.length < 10) {/* DB를 통해 가져왔는데 가져온 양이 테이블 행의 갯수인 10 보다 적으면 html의 테이블은 이전값을 가지고 있으므로 안보이게 .hide()를 사용해주어야 한다 */
						list_write(data_list);
						button_create(data_list, startPage);
					}

					else {
						print_list(data_list);
						button_create(data_list, startPage);
					}

				},
				error : function(e) {
					alert(e);
				}

			});

		}
		
		function button_create(data_list, startPage) {

			var pageNum = null;

			if (data_list.length % maxRow == 0) {
				pageNum = data_list.length / maxRow;
			}

			else {
				pageNum = Math.floor(data_list.length / maxRow) + 1;
			}

			var currentPage = startPage;

			for (var i = 0; i < pageNum; i++) {
				arr = data_list;
				$('#controller').append(
						'<button onclick="page(' + currentPage + ')" id="'
								+ currentPage + '" class="button">'
								+ currentPage + '</button>');
				currentPage = currentPage + 1;
			}
		}

		//jsonArray타입의 객체의 갯수가 10개보다 적을경우 객체를 매개변수로 받아 출력하는 함수이다.
		function list_write(data_list) {

			for (var i = 0; i < data_list.length; i++) {//jquery 문을통해 태그안의 내용을 바꾸어준다 --> .text()사용

				$('#name' + i).html(
						"<a href='boardView.jsp?num=" + data_list[i].num + "'>"
								+ data_list[i].name + "</a>");
				$('#writer' + i).text(data_list[i].writer);
				$('#views' + i).text(data_list[i].views);
			}

			for (var i = data_list.length; i < 10; i++) {//jsonArray타입의 객체의 갯수가 10개보다 적을경우 데이터가 들어가지 않는 행은 안보임 처리를 해준다
				$('#name' + i).hide();
				$('#writer' + i).hide();
				$('#views' + i).hide();
			}

		}

		//클로저 함수 --> 클릭된 버튼의 값에 맞게 불러온 데이터 를 슬라이싱 해서 보여줌
		//클릭된 버튼의 값을 사용해서 슬라이싱 범위인 startNum,endNum을 지정해 준다.
		//한 페이지 에는 페이지안에 속해있는 페이지 블럭에 맞는 게시물(레코드) 수가 있기 때문이다.
		//--->한 페이지 가 가지고 있는 배열안에서 그때그때 해당페이지 블럭을 클릭 한다면 거기 범위에 맞는 데이터를 가져오기 위해 슬라이싱 해줄 필요가 있다
		function page(currentPage) {

			var startNum = (currentPage - 1) * 10 + 1;
			var endNum = currentPage * 10;

			var start_index = 0;
			var end_index = 0;

			//endNum 이 해당 배열의 마지막 숫자보다 크다면 다시 슬라이싱이 제대로 되지 않으므로 범위를 다시 지정해 주어야 한다
			//구분 하기 위해 check라는 변수를 사용해서 check 값이 변하지 않는다면 endNum의 범위를 다시 지정해준다
			var check = null;

			for (var i = 0; i < arr.length; i++) {
				if (arr[i].num == startNum) {
					start_index = i;
				}
				if (arr[i].num == endNum) {
					end_index = i;
					check = 1;
				}

			}

			var new_arr = new Array();

			if (check != 1) {
				end_index = arr.length - 1; // endNum의 는 배열의 마지막 인덱스 번호이다. 
			}

			new_arr = arr.slice(start_index, end_index + 1);

			if (new_arr.length < maxRow) {//데이터가 maxRow보다 작다면 데이터를 출력하는 데에 있어서 다르게 처리해주어야 함
				list_write(new_arr);
			} else {
				print_list(new_arr);
			}

		}

		//10개 보다 큰 게시물이 출력 될때 이전의 데이터는 10개보다 작을수 있으므로
		//.hide()메소드가 사용되어 가려져 있을 확률 이 있다
		//그래서 전부 .show() 로 보여준다음

		//해당 게시물을 출력한다
		function print_list(data_list) {
			for (var i = 0; i < 10; i++) {
				$('#name' + i).show();
				$('#writer' + i).show();
				$('#views' + i).show();

				$('#name' + i).html(
						"<a href='boardView.jsp?num=" + data_list[i].num + "'>"
								+ data_list[i].name + "</a>");
				$('#writer' + i).text(data_list[i].writer);
				$('#views' + i).text(data_list[i].views);
			}
		}
		
		function addReply() {
			/* 占쏙옙占쏙옙占쏙옙占쏙옙 占쏠갈몌옙占쏙옙占쏙옙 , 占쏙옙크占쏙옙트占싫울옙占쏙옙 el표占쏙옙占� 占쏙옙占쏙옙, 표占쏙옙占쏙옙占쏙옙占쏙옙 占쌘바븝옙占쏙옙占쏙옙占쏙옙占쏙옙占썩가占쏙옙 */
				let ta = $('textarea').val()
					
				$.ajax({
				//占쏙옙청占쏙옙占�
				url: 'ReplyCon',
				//占쏙옙청占쏙옙占쏙옙占쏙옙 (占쌉시뱄옙占쏙옙호, 占쌜쇽옙占쏙옙占�)
				data: {
					'boardnum':${param.num},
					'reply':ta
				},
				//占쏙옙청占쏙옙占�(get,post)
				type:'post',
				success:function(data){ //占쏙옙占쏙옙占� 占쏙옙占쏙옙
					//alert(data) 
					$('#reply').prepend('<li class="list-group-item"><span>'+ta+'/${loginVO.id}</span></li>')
				},
				error :function(){ //占쏙옙占쏙옙占� 占쏙옙占쏙옙
					alert('占쏙옙탐占쏙옙占�')
				}
				
				})
			
			
			}
			
			function B() {
				alert("참석완료!")
			}
			
			function I() {
				alert("참석완료!")
			}
			
			function A() {
				alert("참석완료!")
			}
			
			function F() {
				alert("참석완료!")
			}
			
			function R() {
				alert("신고당한 횟수 : "+r_num)
			}
			
			function new_window() {
				window.open("report.jsp?R_MEM_ID=${board.MEM_ID}", "report",
						"width=400, height=300 top=50, left=50");
			}
	</script>

</body>

</html>