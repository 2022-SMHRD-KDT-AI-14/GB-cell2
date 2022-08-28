<%@page import="java.util.Random"%>
<%@page import="com.smhrd.model.tbl_share"%>
<%@page import="com.smhrd.model.tbl_coordinate"%>
<%@page import="com.smhrd.model.tbl_coordinateDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="javax.management.Notification"%>
<%@page import="com.smhrd.model.Share"%>
<%@page import="com.smhrd.model.ShareDAO"%>
<%@page import="org.apache.ibatis.scripting.xmltags.ForEachSqlNode"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<title>test_paystate</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
					<a href="tbl_main.jsp" class="logo"><strong
						style="font-size: 40pt;">&nbsp;&nbsp;&nbsp;&nbsp;N분의 1</strong></a></a>
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
						<li><a href="join.html" class="icon solid fa-user"><span
								class="label">Medium</span></a></li>
					</ul>
				</header>

				<!-- Banner -->
				<section>
					<div class="table-wrapper">
						<header>
							<h2>등록한 게시글</h2>
						</header>

						<p>
							<%
							String loginMember = (String) session.getAttribute("loginMember");
							List<Share> shareList = new ShareDAO().selectAllMyList(loginMember);
							%>
						
						<table class="alt">
							<thead>
								<tr>
									<th>게시글No.</th>
									<th>카테고리</th>
									<th>거래현황</th>
									<th>작성자</th>
									<th colspan=2>거래상태</th>
								</tr>
							</thead>
							<%
							for (Share s : shareList) {
							%>
							<tr>
								<td><%=s.getBoard_seq()%></td>
								<td><%=s.getCat_name()%></td>
								<td><a
									href="eachPayState2.jsp?board_seq=<%=s.getBoard_seq()%>"><%=s.getArticle_title()%></a></td>
								<td><%=s.getMem_id()%></td>
								<td><%=s.getArticle_state()%></td>
								<td>
								<% if (s.getArticle_state().equals("모집중")) {%>
									 <a href="newUpdateCon?board_seq=<%=s.getBoard_seq()%>&article_state=입금대기">
										<button onclick="decision()">거래결정</button></a>
									 <a href="shareDeleteCon?board_seq=<%=s.getBoard_seq()%>">
										<button>게시판삭제</button></a> 
								<%}else if (s.getArticle_state().equals("입금대기")) { %> 
										 <a href="newUpdatePayCon?board_seq=<%=s.getBoard_seq()%>">
										<button  onclick="trans()">입금하기</button></a> 
										<a href="newUpdateCancelCon?board_seq=<%=s.getBoard_seq()%>">
										<button>거래취소</button> </a> 
								<%}else if (s.getArticle_state().equals("거래중")) { %> 
									<!-- 참석자들이 거래결정을 하기전에는 작성자는 반환신청 못눌러 -->
								<%}else if(s.getArticle_state().equals("거래완료")) {
											if(loginMember.equals(s.getMem_id())){ %> 
												<a href="#">
												<button>반환금신청</button></a> 
										<% }//if닫고
								}//elseif닫고
						}// for문닫고%>
						</table>
						</p>
					</div>
				</section>
				<script>
				function decision(){
					alert("거래결정 완료")
				}
				function trans(){
					alert("금액만큼 이체 가정")
				}
				
				</script>
				<!-- 내용시작 -->
				<section>
					<div class="table-wrapper">
						<header>
							<h2>참여한 게시글</h2>
						</header>

						<p>
						<table class="alt">
							<thead>
								<tr>
									<th>게시글No.</th>
									<th>카테고리</th>
									<th>거래현황</th>
									<th>작성자</th>
									<th colspan=2>거래상태</th>
								</tr>
							</thead>
							<%
							List<Share> parList = new ShareDAO().selectAllMyParListB(loginMember);
							for (Share s : parList) {
							%>
							<tr>
								<td><%=s.getBoard_seq()%></td>
								<td><%=s.getCat_name()%></td>
								<td><a
									href="eachPayState2.jsp?board_seq=<%=s.getBoard_seq()%>"><%=s.getArticle_title()%></a></td>
								<td><%=s.getMem_id()%></td>
								<td><%=s.getArticle_state()%></td>
								<td>
									<%
									if (s.getArticle_state().equals("모집중")) {
										if(!s.getMem_id().equals(loginMember)){
									%>
										<a href="parCancelCon?board_seq=<%=s.getBoard_seq()%>">
										<button onclick="parCancel()">참여취소</button> </a> 
								
									 <%}
									} else if (s.getArticle_state().equals("입금대기")) {
								 %>  <a href="newUpdatePayCon?board_seq=<%=s.getBoard_seq()%>">
										<button onclick="trans()">입금하기</button></a>
								 <a href="newUpdateCancelCon?board_seq=<%=s.getBoard_seq()%>">
										<button onclick="transCancel()">입금취소</button></a>
								 <%
								 } else if (s.getArticle_state().equals("거래중")) {
								 %> <a href="tradeDecCon?board_seq=<%=s.getBoard_seq()%>">
										<button id="tradeDec" onclick="tradeDec()">거래확정</button></a> 
										
										<% %>
								<%
								 }else if(s.getArticle_state().equals("거래완료")) {
									 if(loginMember.equals(s.getMem_id())){%> 
									<a href="#">
									<button>반환금신청</button></a> 
									<%}
								}else { %>
								 <!-- 거래완료--> 
								<% } //if문 끝
								 }//for문 끝%>
								 
								
						</table>
						</p>
					</div>
				</section>

			</div>
		</div>

	<script>
		function parCancel(){
			alert("참여취소 완료!")
		}
		
		function tradeDec(){
			$('#tradeDec').hide(); //
			alert("거래확정 완료!")
		}
		function transCancel(){
			alert("입금환불 완료!")
		}
	</script>
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
						<br>
						<p>cell1234@gmail.com</p>
						<li class="icon solid fa-phone">연락처</li>
						<br>
						<p>062-655-3510</p>
						<li class="icon solid fa-home">주소</li>
						<br>
						<p>동명동 스마트인재개발원</p>
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


	<script> // 작성자의 거래결정 후 참석자의 미입금 상태 알람
   /*  $(window).load(function () { 
    	$.ajax({
		url : 'alramCon',
		type: 'get',
		success : function(data){
			
			if(data)alert("${loginMember}님~ "+data)
			
		},
		error : function(){
			alert("로그인 안함?")
			location.href="tbl_login.jsp";
		}
		})
    }); */
	</script>
	<script> //입금모두 되면 조건 변경하여 자동 업데이트
    /* $(window).load(function () { 
    	$.ajax({
		url : 'checkPay',
		type: 'get',
		success : function(data){
			
		},
		error : function(){
			alert("통신실패")
		}
		})
    }); */
	</script>
	<script> //게시글테이블 거래상태를 참석자 테이블에도 동기화
	/*$(window).load(function () { 
    	$.ajax({
		url : 'ShareToApplicantCon',
		type: 'get',
		success : function(data){
			
		},
		error : function(){
			alert("왕리스트 통신실패")
		}
		})
    });*/
</script>
	<script>

//listing vars here so they're in the global scope
var cards, nCards, cover, openContent, openContentText, pageIsOpen = false,
    openContentImage, closeContent, windowWidth, windowHeight, currentCard;

// initiate the process
init();

function init() {
  resize();
  selectElements();
  attachListeners();
}

// select all the elements in the DOM that are going to be used
function selectElements() {
  cards = document.getElementsByClassName('card'),
  nCards = cards.length,
  cover = document.getElementById('cover'),
  openContent = document.getElementById('open-content'),
  openContentText = document.getElementById('open-content-text'),
  openContentImage = document.getElementById('open-content-image')
  closeContent = document.getElementById('close-content');
}

/* Attaching three event listeners here:
  - a click event listener for each card
  - a click event listener to the close button
  - a resize event listener on the window
*/
function attachListeners() {
  for (var i = 0; i < nCards; i++) {
    attachListenerToCard(i);
  }
  closeContent.addEventListener('click', onCloseClick);
  window.addEventListener('resize', resize);
}

function attachListenerToCard(i) {
  cards[i].addEventListener('click', function(e) {
    var card = getCardElement(e.target);
    onCardClick(card, i);
  })
}

/* When a card is clicked */
function onCardClick(card, i) {
  // set the current card
  currentCard = card;
  // add the 'clicked' class to the card, so it animates out
  currentCard.className += ' clicked';
  // animate the card 'cover' after a 500ms delay
  setTimeout(function() {animateCoverUp(currentCard)}, 500);
  // animate out the other cards
  animateOtherCards(currentCard, true);
  // add the open class to the page content
  openContent.className += ' open';
}


function animateCoverUp(card) {
  // get the position of the clicked card
  var cardPosition = card.getBoundingClientRect();
  // get the style of the clicked card
  var cardStyle = getComputedStyle(card);
  setCoverPosition(cardPosition);
  setCoverColor(cardStyle);
  scaleCoverToFillWindow(cardPosition);
  // update the content of the opened page
  openContentText.innerHTML = '<h1>'+card.children[2].textContent+'</h1>'+paragraphText;
  openContentImage.src = card.children[1].src;
  setTimeout(function() {
    // update the scroll position to 0 (so it is at the top of the 'opened' page)
    window.scroll(0, 0);
    // set page to open
    pageIsOpen = true;
  }, 300);
}

function animateCoverBack(card) {
  var cardPosition = card.getBoundingClientRect();
  // the original card may be in a different position, because of scrolling, so the cover position needs to be reset before scaling back down
  setCoverPosition(cardPosition);
  scaleCoverToFillWindow(cardPosition);
  // animate scale back to the card size and position
  cover.style.transform = 'scaleX('+1+') scaleY('+1+') translate3d('+(0)+'px, '+(0)+'px, 0px)';
  setTimeout(function() {
    // set content back to empty
    openContentText.innerHTML = '';
    openContentImage.src = '';
    // style the cover to 0x0 so it is hidden
    cover.style.width = '0px';
    cover.style.height = '0px';
    pageIsOpen = false;
    // remove the clicked class so the card animates back in
    currentCard.className = currentCard.className.replace(' clicked', '');
  }, 301);
}

function setCoverPosition(cardPosition) {
  // style the cover so it is in exactly the same position as the card
  cover.style.left = cardPosition.left + 'px';
  cover.style.top = cardPosition.top + 'px';
  cover.style.width = cardPosition.width + 'px';
  cover.style.height = cardPosition.height + 'px';
}

function setCoverColor(cardStyle) {
  // style the cover to be the same color as the card
  cover.style.backgroundColor = cardStyle.backgroundColor;
}

function scaleCoverToFillWindow(cardPosition) {
  // calculate the scale and position for the card to fill the page,
  var scaleX = windowWidth / cardPosition.width;
  var scaleY = windowHeight / cardPosition.height;
  var offsetX = (windowWidth / 2 - cardPosition.width / 2 - cardPosition.left) / scaleX;
  var offsetY = (windowHeight / 2 - cardPosition.height / 2 - cardPosition.top) / scaleY;
  // set the transform on the cover - it will animate because of the transition set on it in the CSS
  cover.style.transform = 'scaleX('+scaleX+') scaleY('+scaleY+') translate3d('+(offsetX)+'px, '+(offsetY)+'px, 0px)';
}

/* When the close is clicked */
function onCloseClick() {
  // remove the open class so the page content animates out
  openContent.className = openContent.className.replace(' open', '');
  // animate the cover back to the original position card and size
  animateCoverBack(currentCard);
  // animate in other cards
  animateOtherCards(currentCard, false);
}

function animateOtherCards(card, out) {
  var delay = 100;
  for (var i = 0; i < nCards; i++) {
    // animate cards on a stagger, 1 each 100ms
    if (cards[i] === card) continue;
    if (out) animateOutCard(cards[i], delay);
    else animateInCard(cards[i], delay);
    delay += 100;
  }
}

// animations on individual cards (by adding/removing card names)
function animateOutCard(card, delay) {
  setTimeout(function() {
    card.className += ' out';
   }, delay);
}

function animateInCard(card, delay) {
  setTimeout(function() {
    card.className = card.className.replace(' out', '');
  }, delay);
}

// this function searches up the DOM tree until it reaches the card element that has been clicked
function getCardElement(el) {
  if (el.className.indexOf('card ') > -1) return el;
  else return getCardElement(el.parentElement);
}

// resize function - records the window width and height
function resize() {
  if (pageIsOpen) {
    // update position of cover
    var cardPosition = currentCard.getBoundingClientRect();
    setCoverPosition(cardPosition);
    scaleCoverToFillWindow(cardPosition);
  }
  windowWidth = window.innerWidth;
  windowHeight = window.innerHeight;
}

var paragraphText = '<p>Somebody once told me the world is gonna roll me. I ain\'t the sharpest tool in the shed. She was looking kind of dumb with her finger and her thumb in the shape of an "L" on her forehead. Well the years start coming and they don\'t stop coming. Fed to the rules and I hit the ground running. Didn\'t make sense not to live for fun. Your brain gets smart but your head gets dumb. So much to do, so much to see. So what\'s wrong with taking the back streets? You\'ll never know if you don\'t go. You\'ll never shine if you don\'t glow.</p><p>Hey now, you\'re an all-star, get your game on, go play. Hey now, you\'re a rock star, get the show on, get paid. And all that glitters is gold. Only shooting stars break the mold.</p><p>It\'s a cool place and they say it gets colder. You\'re bundled up now, wait till you get older. But the meteor men beg to differ. Judging by the hole in the satellite picture. The ice we skate is getting pretty thin. The water\'s getting warm so you might as well swim. My world\'s on fire, how about yours? That\'s the way I like it and I never get bored.</p>';
</script>
</body>
</html>