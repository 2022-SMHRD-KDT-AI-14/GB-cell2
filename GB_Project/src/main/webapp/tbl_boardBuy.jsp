<%@page import="javax.swing.border.Border"%>
<%@page import="com.smhrd.model.ShareDAO"%>
<%@page import="com.smhrd.model.tbl_share"%>
<%@page import="java.util.Random"%>
<%@page import="com.smhrd.model.tbl_coordinate"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.tbl_coordinateDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>

<head>
<title>boardBuy</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<style>
 

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* Slideshow container */
.slideshow-container {
	max-width: 1200px;
	max-height: 750px;
	position: relative;
	margin: auto;
}

.slideshow-container .mySlides img {
	height: 500px;
	border-radius: 0.375em;
}

/* Hide the images by default */
.mySlides {
	display: none;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	margin-top: -22px;
	padding: 16px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Caption text */
.text {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* The dots/bullets/indicators */
.dot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .dot:hover {
	background-color: #717171;
}

/* Fading animation */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {from { opacity:.4
	
}

to {
	opacity: 1
}

}
@
keyframes fade {from { opacity:.4
	
}

to {
	opacity: 1
	 
}




}
</style>
</head>

<body class="is-preload">
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

				<!-- Section -->
				<section>
						<header class="major">
						<h2>신규 게시물</h2>
					<!-- </header>
						<header class="main" style="text-align: right;"> -->
							<p align="right"><a href="tbl_write.jsp" class="button"
							style="
							 color: #ffffff;
							font-size: 1.5em;
							padding: 0.3em 0.5em;
							margin-right: 0.1em;
							" >글쓰기✏️</a><p>
						</header>
					<div class="posts">
						<table class="table">
							<c:forEach begin="0" end="8" step="1" varStatus="status">
								<article>
								<a id="anfile${status.index}" href="" class="image">
								<img id="file${status.index}" src="" /></a>
									<p id="name${status.index}"></p>
									<p id="state${status.index}"></p>
									<pre id="writer${status.index}"></pre>
									<div style="text-align: right;">
									</div>
								</article>
							</c:forEach>
							 <tr>
							  <td colspan="4" id="controller" ></td>
						  	</tr>
						</table>
						
					</div>
					
					
								<!-- Section -->
				<section>
					<header class="major">
						<h2>구매 게시판</h2>
					</header>
					<!-- 슬라이드쇼 컨테이너 -->
					<div class="slideshow-container">
						<!-- 숫자와 캡션이 있는 이미지 -->
						<div class="mySlides fade">
							<div class="numbertext">1 / 3</div>
							<img src="images/pic14.png" style="width: 100%">
						</div>
						<div class="mySlides fade">
							<div class="numbertext">2 / 3</div>
							<img src="images/pic15.png" style="width: 100%">
						</div>
						<div class="mySlides fade">
							<div class="numbertext">3 / 3</div>
							<img src="images/pic16.png" style="width: 100%">
						</div>
						<!-- 다음, 이전 이미지 버튼 -->
						<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
							class="next" onclick="plusSlides(1)">&#10095;</a>
					</div>
				</section>
				<br>
				<!-- 현재 이미지를 알려주는 하단의 점 -->
				<div style="text-align: center">
					<span class="dot" onclick="currentSlide(1)"></span> <span
						class="dot" onclick="currentSlide(2)"></span> <span class="dot"
						onclick="currentSlide(3)"></span>
				</div>
				<div>
					<p>이곳은 구매 게시판 입니다.</p>
					<p>다양한 상품을 나눠 공유 할 수 있습니다.</p>
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
				<%if(session.getAttribute("MEM_ID")!=null&&session.getAttribute("loginMember")!=null){ 
				
					
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
						  if(id.size()>0){
						  num1 = r.nextInt(id.size());
						  num2 = r.nextInt(id.size());
						  num3 = r.nextInt(id.size());
						  list1 = dao.selectListshare(id.get(num1));
						  list2 = dao.selectListshare(id.get(num2));
						  list3 = dao.selectListshare(id.get(num3));
						  }
						  if(list1.size()>0){
						  num11 = r.nextInt(list1.size());
						  a = list1.get(num11).getBOARD_SEQ().intValue();
						  }
						  if(list2.size()>0){
						  num22 = r.nextInt(list2.size());
						  b = list2.get(num22).getBOARD_SEQ().intValue();
						  }
						  if(list3.size()>0){
						 num33 = r.nextInt(list3.size());
						  c = list3.get(num33).getBOARD_SEQ().intValue();
						  
						  }
						 
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
						<%if(list1.size()>0) {%>
						<article>
							<a href="boardView.jsp?num=${board_seq1}" class="image">
							<img src="img/<%=list1.get(num11).getARTICLE_FILE()%>" alt="" /></a>
							<p>제목 : <%=list1.get(num11).getARTICLE_TITLE() %></p>
							<p>작성자 : <%=list1.get(num11).getMEM_ID() %></p>
						
						</article>
						<%} %>
						<%if(list2.size()>0) {%>
						<article>
							<a href="boardView.jsp?num=${board_seq2}" class="image">
							<img src="img/<%=list2.get(num22).getARTICLE_FILE()%>" alt="" /></a>
							<p>제목 : <%=list2.get(num22).getARTICLE_TITLE() %></p>
							<p>작성자 : <%=list2.get(num22).getMEM_ID() %></p>
							<%} %>
						</article>
						<%if(list3.size()>0){%>
						<article>
							<a href="boardView.jsp?num=${board_seq3}" class="image">
							<img src="img/<%=list3.get(num33).getARTICLE_FILE()%>" alt="" /></a>
							<p>제목 : <%=list3.get(num33).getARTICLE_TITLE() %></p>
							<p>작성자 : <%=list3.get(num33).getMEM_ID() %></p>
						</article>
						<%} %>
					</div>
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
						<li class="icon solid fa-home">주소<br />
							상세주소</li>
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
		var maxRow = 9;

		
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
					console.log(data_list) // 페이지 넘길 데이터 리스트 전부

					if (data_list.length < maxRow) {/* DB를 통해 가져왔는데 가져온 양이 테이블 행의 갯수인 10 보다 적으면 html의 테이블은 이전값을 가지고 있으므로 안보이게 .hide()를 사용해주어야 한다 */
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
			console.log("list_write 함수가동중~")
			for (var i = 0; i < data_list.length; i++) {//jquery 문을통해 태그안의 내용을 바꾸어준다 --> .text()사용
				$('#anfile' + i).attr("href","boardView.jsp?num="+data_list[i].num)
				$('#name' + i).html(
						"<h2><a href='boardView.jsp?num=" + data_list[i].num + "'>"
								+ data_list[i].name +"</a></h2>");
				$('#state' + i).html("<strong>"+data_list[i].state+"</strong>");
				$('#writer' + i).html("작성자 "+data_list[i].writer+"    ("+data_list[i].date+")");
				$('#views' + i).text(data_list[i].views);
				$('#file' + i).attr("src", "img/"+data_list[i].file);
				
			}

			for (var i = data_list.length; i <maxRow; i++) {//jsonArray타입의 객체의 갯수가 10개보다 적을경우 데이터가 들어가지 않는 행은 안보임 처리를 해준다
				$('#name' + i).hide();
				$('#state' + i).hide();
				$('#writer' + i).hide();
				$('#views' + i).hide();
				$('#file' + i).hide();
				$('#views' + i).hide();
			}

		}

		//클로저 함수 --> 클릭된 버튼의 값에 맞게 불러온 데이터 를 슬라이싱 해서 보여줌
		//클릭된 버튼의 값을 사용해서 슬라이싱 범위인 startNum,endNum을 지정해 준다.
		//한 페이지 에는 페이지안에 속해있는 페이지 블럭에 맞는 게시물(레코드) 수가 있기 때문이다.
		//--->한 페이지 가 가지고 있는 배열안에서 그때그때 해당페이지 블럭을 클릭 한다면 거기 범위에 맞는 데이터를 가져오기 위해 슬라이싱 해줄 필요가 있다
		function page(currentPage) {
			
			var startNum = (currentPage - 1) * maxRow + 1;
			var endNum = currentPage * maxRow;
			var startNum_ =arr[startNum-1].num;
			var endNum_ = startNum_-maxRow;
			console.log("currentPage에서 바뀐 startNum_ >> "+startNum_)
			console.log("currentPage에서 바뀐 endNum_ >> "+endNum_)
			console.log("currentPage에서 바뀐 arr.length >> "+arr.length)
			var start_index = 0;
			var end_index = 0;

			//endNum 이 해당 배열의 마지막 숫자보다 크다면 다시 슬라이싱이 제대로 되지 않으므로 범위를 다시 지정해 주어야 한다
			//구분 하기 위해 check라는 변수를 사용해서 check 값이 변하지 않는다면 endNum의 범위를 다시 지정해준다
			var check = null;

			for (var i = 0; i < arr.length; i++) { 
				console.log(i+" 번째 arr["+i+"].num >>"+arr[i].num)
				if (arr[i].num == startNum_) {
					start_index = i;
					console.log("currentPage에서 start_index >> "+start_index)
				}
				if (arr[i].num == endNum_) {
					end_index = i;
					check = 1;
					console.log("currentPage에서 end_index >> "+end_index)
				}

			}

			var new_arr = new Array();

			if (check != 1) {
				end_index = arr.length - 1; // endNum의 는 배열의 마지막 인덱스 번호이다. 
				console.log("currentPage에서 end_index >> "+end_index)
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
			for (var i = 0; i < data_list.length; i++) {//jquery 문을통해 태그안의 내용을 바꾸어준다 --> .text()사용
				console.log(i+" >> "+data_list[i].name)
				$('#anfile'+i).show();
				$('#name'+i).show();
				$('#state'+i).show();
				$('#writer'+i).show();
				$('#views'+i).show();
				$('#file'+i).show();
				
				
				$('#anfile' + i).attr("href","boardView.jsp?num="+data_list[i].num)
				$('#name' + i).html(
						"<h2><a href='boardView.jsp?num=" + data_list[i].num + "'>"
								+ data_list[i].name +"</a></h2>");
				$('#state' + i).html("<strong>"+data_list[i].state+"</strong>");
				$('#writer' + i).html("작성자 "+data_list[i].writer+"    ("+data_list[i].date+")");
				$('#views' + i).text(data_list[i].views);
				$('#file' + i).attr("src", "img/"+data_list[i].file);
				
			}
		}
	</script>

</body>

</html>